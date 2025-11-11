const GpuTexture = @import("GpuTexture.zig").GpuTexture;

extern fn canvasContext() usize;
extern fn canvasContextGetCurrentTexture(id: usize) usize;

pub const GpuCanvasContext = struct {
    id: usize,

    pub fn init() GpuCanvasContext {
        return GpuCanvasContext{
            .id = canvasContext(),
        };
    }

    pub fn getCurrentTexture(self: GpuCanvasContext) GpuTexture {
        return GpuTexture.init(canvasContextGetCurrentTexture(self.id));
    }
};
