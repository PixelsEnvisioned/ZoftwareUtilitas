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

        pub fn equals(self: Self, other: Vec3(T)) bool {
            return (self.x == other.x and self.y == other.y and self.z == other.z);
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

        pub fn Dot(v1: Vec3(T), v2: Vec3(T)) T {
            return (v1.x * v2.x) + (v1.y * v2.y) + (v1.z * v2.z);
        }
    };
}
