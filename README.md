# ZoftwareUtilitas

A library of functions and types that are used across PixelsEnvisioned projects.

## Building and using

The library can be imported by running:

```sh
zig fetch --save git+https://github.com/PixelsEnvisioned/ZoftwareUtilitas/#main
```

Then add the following to your `build.zig` before `b.installArtifact(exe);`:

```zig
const ZW_utils = b.dependency("ZW_utils", .{
    .target = target,
    .optimize = optimize,
});
exe.root_module.addImport("ZW_utils", utils.module("ZW_utils"));
```

Then build with `zig build` like normal.

The library can then be imported as follows:

```zig
const utils = @import("ZW_utils");
```
