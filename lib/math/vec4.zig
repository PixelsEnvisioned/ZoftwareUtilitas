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
            // TODO: w == 0
            // TODO: overflow division
            var res: @This() = undefined;
            if (@typeInfo(T) == .int) {
                res = @This(){
                    .x = @divFloor(x, w),
                    .y = @divFloor(y, w),
                    .z = @divFloor(z, w),
                    .w = 1,
                };
            } else {
                res = @This(){
                    .x = x / w,
                    .y = y / w,
                    .z = z / w,
                    .w = 1,
                };
            }

            return res;
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
