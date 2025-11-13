const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;

extern fn color(r: f32, g: f32, b: f32, a: f32) Id;

pub const GpuColor = struct {
    id: Id,
    r: f32,
    g: f32,
    b: f32,
    a: f32,

    pub fn init(r: f32, g: f32, b: f32, a: f32) GpuColor {
        return GpuColor{
            .id = color(r, g, b, a),
            .r = r,
            .g = g,
            .b = b,
            .a = a,
        };
    }

    pub fn deinit(self: GpuColor) void {
        webgpu.remove(self.id);
    }
};
