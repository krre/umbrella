const Size2D = @import("geometry.zig").Size2D;
const js = @import("js.zig");

pub fn size() Size2D {
    return .{ .width = js.windowWidth(), .height = js.windowHeight() };
}
