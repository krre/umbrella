const Color = @import("angie3d").ui.Color;
const angie3d = @import("angie3d");
const js = angie3d.js;
const Id = angie3d.types.Id;

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
