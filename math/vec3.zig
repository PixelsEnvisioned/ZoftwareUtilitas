pub const Vec3 = struct {
    const Self = @This();
    x: i32,
    y: i32,
    z: i32,

    pub fn init(x: i32, y: i32, z: i32) Vec3 {
        return .{
            .x = x,
            .y = y,
            .z = z,
        };
    }

    pub fn add(self: *Self, other: Vec3) void {
        self.x += other.x;
        self.y += other.y;
        self.z += other.z;
    }

    pub fn Add(v1: Vec3, v2: Vec3) Vec3 {
        return Vec3.init(
            v1.x + v2.x,
            v1.y + v2.y,
            v1.z + v2.z,
        );
    }
};
