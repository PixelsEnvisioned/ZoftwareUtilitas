const math = @import("std").math;
const _print = @import("std").debug.print;

pub fn Vec3(comptime T: type) type {
    return struct {
        const Self = @This();
        x: T,
        y: T,
        z: T,

        pub fn init(x: T, y: T, z: T) Vec3(T) {
            return .{
                .x = x,
                .y = y,
                .z = z,
            };
        }

        pub fn init_fill(value: T) Vec3(T) {
            return Vec3(T).init(value, value, value);
        }

        pub fn print(self: Self) void {
            _print("{{.x={}, .y={}, .z={}}}\n", .{ self.x, self.y, self.z });
        }

        pub fn equals(self: *const Self, other: *const Vec3(T)) bool {
            return (self.x == other.x and self.y == other.y and self.z == other.z);
        }

        pub fn equals_addr(self: *const Self, other: *const Vec3(T)) bool {
            return self == other;
        }

        pub fn zero(self: *Self) void {
            self.x = @as(T, 0);
            self.y = @as(T, 0);
            self.z = @as(T, 0);
        }

        pub fn Zero() Vec3(T) {
            return Vec3(T).init(
                @as(T, 0),
                @as(T, 0),
                @as(T, 0),
            );
        }

        pub fn add(self: *Self, other: Vec3(T)) void {
            self.x += other.x;
            self.y += other.y;
            self.z += other.z;
        }

        pub fn Add(v1: Vec3(T), v2: Vec3(T)) Vec3(T) {
            return Vec3(T).init(
                v1.x + v2.x,
                v1.y + v2.y,
                v1.z + v2.z,
            );
        }

        pub fn sub(self: *Self, other: Vec3(T)) void {
            self.x -= other.x;
            self.y -= other.y;
            self.z -= other.z;
        }

        pub fn Sub(v1: Vec3(T), v2: Vec3(T)) Vec3(T) {
            return Vec3(T).init(
                v1.x - v2.x,
                v1.y - v2.y,
                v1.z - v2.z,
            );
        }

        pub fn scale(self: *Self, factor: T) void {
            self.x *= factor;
            self.y *= factor;
            self.z *= factor;
        }

        pub fn Scale(v: Vec3(T), factor: T) Vec3(T) {
            return Vec3(T).init(
                v.x * factor,
                v.y * factor,
                v.z * factor,
            );
        }

        pub fn mul(self: *Self, other: Vec3(T)) void {
            self.x *= other.x;
            self.y *= other.y;
            self.z *= other.z;
        }

        pub fn Mul(v1: Vec3(T), v2: Vec3(T)) Vec3(T) {
            return Vec3(T).init(
                v1.x * v2.x,
                v1.y * v2.y,
                v1.z * v2.z,
            );
        }

        pub fn div(self: *Self, other: Vec3(T)) void {
            if (@typeInfo(T) == .int) {
                _print("\nDisclaimer: Beware when using on ints that might not divide\n", .{});
                self.x = @divExact(self.x, other.x);
                self.y = @divExact(self.y, other.y);
                self.z = @divExact(self.z, other.z);
                return;
            }

            self.x /= other.x;
            self.y /= other.y;
            self.z /= other.z;
        }

        pub fn Div(v1: Vec3(T), v2: Vec3(T)) Vec3(T) {
            if (@typeInfo(T) == .int) {
                _print("\nDisclaimer: Beware when using on ints that might not divide\n", .{});
                return Vec3(T).init(
                    @divExact(v1.x, v2.x),
                    @divExact(v1.y, v2.y),
                    @divExact(v1.z, v2.z),
                );
            }

            return Vec3(T).init(
                v1.x / v2.x,
                v1.y / v2.y,
                v1.z / v2.z,
            );
        }

        pub fn dot(self: Self, other: Vec3(T)) T {
            return (self.x * other.x) + (self.y * other.y) + (self.z * other.z);
        }

        pub fn length(self: Self) f32 {
            return math.sqrt((self.x * self.x) + (self.y * self.y) + (self.z * self.z));
        }

        pub fn normalize(self: *Self) void {
            self.div(Vec3(T).init_fill(self.length()));
        }

        pub fn Normalize(v: Vec3(T)) Vec3(T) {
            return Vec3(T).Div(v, Vec3(T).init_fill(v.length()));
        }
    };
}
