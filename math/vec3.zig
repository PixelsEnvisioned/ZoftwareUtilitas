pub fn Vec3(comptime T: type) type {
    return struct {
        const self = @This();
        x: T,
        y: T,
        z: T,

        pub fn init(x: T, y: T, z: T) self {
            return .{
                .x = x,
                .y = y,
                .z = z,
            };
        }
    };
}

//const Vec3 = union {
//    const _ = struct {
//        x: i32,
//        y: i32,
//        z: i32,
//
//        fn init(x: i32, y: i32, z: i32) Vec3 {
//            return Vec3{
//                .x = x,
//                .y = y,
//                .z = z,
//            };
//        }
//    };
//    arr: [3]i32,
//};
