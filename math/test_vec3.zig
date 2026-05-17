const v3 = @import("vec3.zig").Vec3;
const expect = @import("std").testing.expect;
const print = @import("std").debug.print;

const x: i32 = 1;
const y: i32 = 2;
const z: i32 = 3;

test "Vec3.init()" {
    const v = v3.init(x, y, z);
    try expect(v.x == x);
    try expect(v.y == y);
    try expect(v.z == z);
}

test "Vec3.add()" {
    var v1 = v3.init(x, y, z);
    const v2 = v3.init(x, y, z);

    v1.add(v2);
    print("V1: x={}, y={}, z={}\n", .{ v1.x, v1.y, v1.z });

    try expect(v1.x == x + x);
    try expect(v1.y == y + y);
    try expect(v1.z == z + z);
}

test "Vec3.Add()" {
    var v1 = v3.init(x, y, z);
    const v2 = v3.init(x, y, z);

    const v_res = v1.Add(v2);

    print("V_RES: x={}, y={}, z={}\n", .{ v_res.x, v_res.y, v_res.z });

    try expect(v_res.x == v1.x + v2.x);
    try expect(v_res.y == v1.y + v2.y);
    try expect(v_res.z == v1.z + v2.z);
}
