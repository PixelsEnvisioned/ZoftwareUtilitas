const std = @import("std");

// temp, for compatability
pub fn Vec3(comptime T: type) type {
    return struct {
        x: T,
        y: T,
        z: T,
        pub fn init(x: T, y: T, z: T) Vec3(T) {
            return Vec3(T){
                .x = x,
                .y = y,
                .z = z,
            };
        }
    };
}

pub fn Vec4(comptime T: type) type {
    return struct {
        const Self = @This();

        x: T,
        y: T,
        z: T,
        w: T,

        pub fn init(x: T, y: T, z: T, w: T) Vec4(T) {
            // TODO: w == 0
            // TODO: overflow division
            var res: Vec4(T) = undefined;
            if (@typeInfo(T) == .int) {
                res = .{
                    .x = @divFloor(x, w),
                    .y = @divFloor(y, w),
                    .z = @divFloor(z, w),
                    .w = 1,
                };
            } else {
                res = .{
                    .x = x / w,
                    .y = y / w,
                    .z = z / w,
                    .w = 1,
                };
            }

            return res;
        }

        pub fn init_Vec3(v: Vec3(T)) Vec4(T) {
            return Vec4(T).init{
                .x = v.x,
                .y = v.y,
                .z = v.z,
                .w = 1,
            };
        }
    };
}
