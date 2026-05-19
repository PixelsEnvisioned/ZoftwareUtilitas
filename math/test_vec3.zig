const Vec3 = @import("vec3.zig").Vec3;
const expect = @import("std").testing.expect;
const print = @import("std").debug.print;

const T = f32;
const x: T = 1;
const y: T = 2;
const z: T = 3;

test "Vec3.init()" {
    print("TEST: Vec3.init()", .{});
    const v = Vec3(T).init(x, y, z);
    try expect(v.x == x);
    try expect(v.y == y);
    try expect(v.z == z);
    print(" [PASS]\n", .{});
}

test "Vec3.add()" {
    print("TEST: Vec3.add()", .{});
    var v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    v1.add(v2);

    try expect(v1.x == x + z);
    try expect(v1.y == y + y);
    try expect(v1.z == z + x);
    print(" [PASS]\n", .{});
}

test "Vec3.Add()" {
    print("TEST: Vec3.Add()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const v_res = Vec3(T).Add(v1, v2);

    try expect(v_res.x == v1.x + v2.x);
    try expect(v_res.y == v1.y + v2.y);
    try expect(v_res.z == v1.z + v2.z);
    print(" [PASS]\n", .{});
}

test "Vec3.sub()" {
    print("TEST: Vec3.sub()", .{});
    var v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    v1.sub(v2);

    try expect(v1.x == x - z);
    try expect(v1.y == y - y);
    try expect(v1.z == z - x);
    print(" [PASS]\n", .{});
}

test "Vec3.Sub()" {
    print("TEST: Vec3.Sub()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const v_res = Vec3(T).Sub(v1, v2);

    try expect(v_res.x == v1.x - v2.x);
    try expect(v_res.y == v1.y - v2.y);
    try expect(v_res.z == v1.z - v2.z);
    print(" [PASS]\n", .{});
}

test "Vec3.scale()" {
    print("TEST: Vec3.scale()", .{});
    var v = Vec3(T).init(x, y, z);
    const factor: T = z;

    v.scale(factor);

    try expect(v.x == x * factor);
    try expect(v.y == y * factor);
    try expect(v.z == z * factor);

    print(" [PASS]\n", .{});
}

test "Vec3.Scale()" {
    print("TEST: Vec3.Scale()", .{});
    const v = Vec3(T).init(x, y, z);
    const factor: T = z;

    const res_vec = Vec3(T).Scale(v, factor);

    try expect(res_vec.x == x * factor);
    try expect(res_vec.y == y * factor);
    try expect(res_vec.z == z * factor);

    print(" [PASS]\n", .{});
}

test "Vec3.Dot()" {
    print("TEST: Vec3.Dot()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const dot_res = Vec3(T).Dot(v1, v2);
    const test_res = (x * z) + (y * y) + (z * x);

    try expect(dot_res == test_res);

    print(" [PASS]\n", .{});
}
