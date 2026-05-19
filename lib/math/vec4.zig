const std = @import("std");

// temp, for compatability
fn Vec3(comptime T: type) type {
    return struct { x: T, y: T, z: T };
}

pub fn Vec4(comptime T: type) type {
    return struct {
        const Self = @This();

        x: T,
        y: T,
        z: T,
        w: T,

        pub fn init(x: T, y: T, z: T, w: T) @This() {
            return @This(){
                .x = x,
                .y = y,
                .z = z,
                .w = w,
            };
        }

        pub fn init_Vec3(v: @This()) @This() {
            return @This().init{
                .x = v.x,
                .y = v.y,
                .z = v.z,
                .w = 1,
            };
        }
    };
}
