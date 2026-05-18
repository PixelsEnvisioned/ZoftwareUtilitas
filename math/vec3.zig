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
    };
}
