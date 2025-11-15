const Color = @import("../../ui/Color.zig").Color;
const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

extern fn color(r: f32, g: f32, b: f32, a: f32) Id;

pub const GpuColor = struct {
    id: Id,

    pub fn init(c: Color) GpuColor {
        return GpuColor{
            .id = color(c.r, c.g, c.b, c.a),
        };
    }

    pub fn deinit(self: GpuColor) void {
        webgpu.remove(self.id);
    }
};
