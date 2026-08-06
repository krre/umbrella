const Color = @import("angie3d").ui.Color;
const js = @import("../../js.zig");
const Id = @import("angie3d").types.Id;

const GpuColor = @This();

id: Id,

pub fn init(color: Color) GpuColor {
    return GpuColor{
        .id = js.color(color.r, color.g, color.b, color.a),
    };
}

pub fn deinit(self: GpuColor) void {
    js.remove(self.id);
}
