const Vec3 = @import("ZW_utils").math.Vec3;
const expect = @import("std").testing.expect;
const print = @import("std").debug.print;
const math = @import("std").math;

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

test "Vec3.equals()" {
    print("TEST: Vec3.equals()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(x, y, z);

    //const test_res: bool = (v.x == v.x and v.y == v.y and v.z == v.z);
    const test_res = v1.x == v2.x and v1.y == v2.y and v1.z == v2.z;

    try expect(test_res == v1.equals(&v2));
    print(" [PASS]\n", .{});
}
test "Vec3.equals_addr()" {
    print("TEST: Vec3.equals_addr()", .{});
    const v = Vec3(T).init(x, y, z);

    //const test_res: bool = (v.x == v.x and v.y == v.y and v.z == v.z);
    const test_res = &v == &v;

    try expect(test_res == (v.equals_addr(&v)));
    print(" [PASS]\n", .{});
}

test "Vec3.init_fill()" {
    print("TEST: Vec3.init_fill()", .{});

    const v = Vec3(T).init_fill(x);
    const test_vec = Vec3(T).init(x, x, x);

    try expect(v.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.zero()" {
    print("TEST: Vec3.zero()", .{});
    var v = Vec3(T).init(x, y, z);

    v.zero();
    const test_vec = Vec3(T).init(0, 0, 0);

    try expect(v.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.Zero()" {
    print("TEST: Vec3.Zero()", .{});

    const v = Vec3(T).Zero();
    const test_vec = Vec3(T).init(0, 0, 0);

    try expect(v.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.add()" {
    print("TEST: Vec3.add()", .{});
    var v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    v1.add(v2);
    const test_vec = Vec3(T).init(x + z, y + y, z + x);

    try expect(v1.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.Add()" {
    print("TEST: Vec3.Add()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const res_vec = Vec3(T).Add(v1, v2);
    const test_vec = Vec3(T).init(x + z, y + y, z + x);

    try expect(res_vec.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.sub()" {
    print("TEST: Vec3.sub()", .{});
    var v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    v1.sub(v2);
    const test_vec = Vec3(T).init(x - z, y - y, z - x);

    try expect(v1.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.Sub()" {
    print("TEST: Vec3.Sub()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const res_vec = Vec3(T).Sub(v1, v2);
    const test_vec = Vec3(T).init(x - z, y - y, z - x);

    try expect(res_vec.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.scale()" {
    print("TEST: Vec3.scale()", .{});
    var v = Vec3(T).init(x, y, z);
    const factor: T = z;

    v.scale(factor);
    const test_vec = Vec3(T).init(x * factor, y * factor, z * factor);

    try expect(v.equals(&test_vec));

    print(" [PASS]\n", .{});
}

test "Vec3.Scale()" {
    print("TEST: Vec3.Scale()", .{});
    const v = Vec3(T).init(x, y, z);
    const factor: T = z;

    const res_vec = Vec3(T).Scale(v, factor);
    const test_vec = Vec3(T).init(x * factor, y * factor, z * factor);

    try expect(res_vec.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.mul()" {
    print("TEST: Vec3.mul()", .{});
    var v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    v1.mul(v2);
    const test_vec = Vec3(T).init(x * z, y * y, z * x);

    try expect(v1.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.Mul()" {
    print("TEST: Vec3.Mul()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const res_vec = Vec3(T).Mul(v1, v2);
    const test_vec = Vec3(T).init(x * z, y * y, z * x);

    try expect(res_vec.equals(&test_vec));
    print(" [PASS]\n", .{});
}

test "Vec3.div()" {
    print("TEST: Vec3.div()", .{});
    var v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    v1.div(v2);
    const test_vec = Vec3(T).init(
        x / z,
        y / y,
        z / x,
    );

    try expect(v1.equals(&test_vec));

    const xi: i32 = 1;
    const yi: i32 = 2;
    const zi: i32 = 3;
    var v1i = Vec3(i32).init(xi, yi, zi);
    const v2i = Vec3(i32).init(xi, yi, zi);

    v1i.div(v2i);
    const test_veci = Vec3(i32).init(
        xi / xi,
        yi / yi,
        zi / zi,
    );

    try expect(v1i.equals(&test_veci));
    print(" [PASS]\n", .{});
}

test "Vec3.Div()" {
    print("TEST: Vec3.Div()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const res_vec = Vec3(T).Div(v1, v2);
    const test_vec = Vec3(T).init(
        x / z,
        y / y,
        z / x,
    );

    try expect(res_vec.equals(&test_vec));

    const xi: i32 = 1;
    const yi: i32 = 2;
    const zi: i32 = 3;
    const v1i = Vec3(i32).init(xi, yi, zi);
    const v2i = Vec3(i32).init(xi, yi, zi);

    const res_veci = Vec3(i32).Div(v1i, v2i);
    const test_veci = Vec3(i32).init(
        xi / xi,
        yi / yi,
        zi / zi,
    );

    try expect(res_veci.equals(&test_veci));
    print(" [PASS]\n", .{});
}

test "Vec3.dot()" {
    print("TEST: Vec3.dot()", .{});
    const v1 = Vec3(T).init(x, y, z);
    const v2 = Vec3(T).init(z, y, x);

    const dot_res = v1.dot(v2);
    const test_res = (x * z) + (y * y) + (z * x);

    try expect(dot_res == test_res);
    print(" [PASS]\n", .{});
}

test "Vec3().length()" {
    print("TEST: Vec3.length()", .{});
    const v = Vec3(T).init(x, y, z);

    const len = v.length();
    const test_res = math.sqrt((x * x) + (y * y) + (z * z));

    try expect(len == test_res);
    print(" [PASS]\n", .{});
}

test "Vec3.normalize()" {
    print("TEST: Vec3.normalize()", .{});
    var v = Vec3(T).init(x, y, z);

    v.normalize();

    const test_vec = Vec3(T).init(x, y, z);
    const len = test_vec.length();
    const vec_len = Vec3(T).init_fill(len);
    const test_res = Vec3(T).Div(test_vec, vec_len);

    try expect(v.equals(&test_res));
    print(" [PASS]\n", .{});
}

test "Vec3.Normalize()" {
    print("TEST: Vec3.Normalize()", .{});
    const v = Vec3(T).init(x, y, z);

    const norm = Vec3(T).Normalize(v);
    const test_res = Vec3(T).Div(v, Vec3(T).init_fill(v.length()));

    try expect(norm.equals(&test_res));
    print(" [PASS]\n", .{});
}
