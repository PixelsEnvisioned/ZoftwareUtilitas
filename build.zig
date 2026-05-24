const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("ZW_utils", .{
        .root_source_file = b.path("lib/lib.zig"),
        .target = target,
        .optimize = optimize,
    });
    const lib = b.addLibrary(.{
        .name = "ZW_utils",
        .linkage = .static,
        .root_module = b.createModule(.{
            .root_source_file = b.path("lib/lib.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    b.installArtifact(lib);

    const test_filters = b.option(
        []const []const u8,
        "test_filter",
        "Skip tests that don't match the specified filters",
    ) orelse &.{};
    const custom_runner = b.option(
        bool,
        "custom_runner",
        "Whether to use a custom test runner (default: true)",
    ) orelse true;
    const test_step = b.step("test", "Run unit tests");
    const unit_tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("tests/main.zig"),
            .target = target,
        }),
        .filters = test_filters,
        .test_runner = if (custom_runner) .{
            .path = b.path("test_runner.zig"),
            .mode = .simple,
        } else null,
    });
    unit_tests.root_module.addImport("ZW_utils", lib.root_module);
    const run_unit_tests = b.addRunArtifact(unit_tests);
    test_step.dependOn(&run_unit_tests.step);
}
