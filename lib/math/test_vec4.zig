const std = @import("std");
const Vec4 = @import("vec4.zig").Vec4;
const Vec3 = @import("vec4.zig").Vec3;
const expectEqual = @import("std").testing.expectEqual;

const T = i32;
const x: T = 1;
const y: T = 2;
const z: T = 3;

test "Vec4.init() with w = 1" {
    const w: T = 1;
    const v = Vec4(T).init(x, y, z, w);

    try expectEqual(v.x, x);
    try expectEqual(v.y, y);
    try expectEqual(v.z, z);
    try expectEqual(v.w, w);
}

test "Vec4.init() with w > 1" {
    const w: T = 2;
    const v = Vec4(T).init(x, y, z, w);

    try expectEqual(v.x, @divFloor(x, w));
    try expectEqual(v.y, @divFloor(y, w));
    try expectEqual(v.z, @divFloor(z, w));
    try expectEqual(v.w, 1);
}

test "Vec4 init from Vec3" {
    const v3 = Vec3(T).init(1, 2, 3);
    const v4 = Vec4(T).init_Vec3(v3);

    try expectEqual(v4.x, v3.x);
    try expectEqual(v4.y, v3.y);
    try expectEqual(v4.z, v3.z);
    try expectEqual(v4.w, 1);
}
