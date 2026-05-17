pub const Vec3 = struct {
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

    pub fn add(self: *Vec3, other: Vec3) void {
        self.x += other.x;
        self.y += other.y;
        self.z += other.z;
    }

    pub fn Add(self: Vec3, other: Vec3) Vec3 {
        var res_vec = self;
        res_vec.add(other);
        return res_vec;
    }
};
