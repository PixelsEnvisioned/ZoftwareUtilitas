const v3 = @import("vec3.zig").Vec3;
const expect = @import("std").testing.expect;

test "initializing a vec3 struct" {
    const x: i32 = 1;
    const y: i32 = 2;
    const z: i32 = 3;

    const v = v3(i32).init(x, y, z);
    try expect(v.x == x);
    try expect(v.y == y);
    try expect(v.z == z);
}
