const math = @import("std").math;

pub fn Vec3(comptime T: type) type {
    return struct {
        const Self = @This();
        x: T,
        y: T,
        z: T,

        //I was thinking maybe we could use optionals here? though idk how they even work
        //like x, ?y, ?z and if only x then it fills with just the x but...
        //i think maybe better being explicit
        pub fn init(x: T, y: T, z: T) Vec3(T) {
            return .{
                .x = x,
                .y = y,
                .z = z,
            };
        }

        pub fn init_fill(num: T) Vec3(T) {
            return Vec3(T).init(num, num, num);
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

        pub fn div(self: *Self, other: Vec3(T)) void {
            self.x = @divFloor(self.x, other.x);
            self.y = @divFloor(self.y, other.y);
            self.z = @divFloor(self.z, other.z);
        }

        pub fn Div(v1: Vec3(T), v2: Vec3(T)) Vec3(T) {
            return Vec3(T).init(
                @divFloor(v1.x, v2.x),
                @divFloor(v1.y, v2.y),
                @divFloor(v1.z, v2.z),
            );
        }

        pub fn Dot(v1: Vec3(T), v2: Vec3(T)) T {
            return (v1.x * v2.x) + (v1.y * v2.y) + (v1.z * v2.z);
        }

        //for these below we dont actually want to modify the vec3 its being called on ever right?
        //like v.nomalize() surely shouldnt change v to be the normalized version of v.. or should it..?
        //and if this is the case, are the second variants even necessary here? idk bruh im tweaking out

        pub fn length(self: Self) f32 {
            return math.sqrt((self.x * self.x) + (self.y * self.y) + (self.z * self.z));
        }

        pub fn Length(v1: Vec3(T)) f32 {
            return math.sqrt((v1.x * v1.x) + (v1.y * v1.y) + (v1.z * v1.z));
        }

        pub fn normalize(self: Self) Vec3(T) {
            return Vec3(T).Div(self, Vec3(T).init_fill(self.length()));
        }

        pub fn Normalize(v1: Vec3(T)) Vec3(T) {
            return Vec3(T).Div(v1, Vec3(T).init_fill(v1.length()));
        }
    };
}
