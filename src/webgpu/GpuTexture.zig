const webgpu = @import("../webgpu.zig");
const GpuTextureView = @import("GpuTextureView.zig").GpuTextureView;

extern fn destroyTexture(id: usize) void;
extern fn textureCreateView(id: usize) usize;

pub const GpuTexture = struct {
    id: usize,

    pub fn init(id: usize) GpuTexture {
        return GpuTexture{
            .id = id,
        };
    }

    pub fn deinit(self: GpuTexture) void {
        webgpu.destroy(self.id);
    }

    pub fn createView(self: GpuTexture) GpuTextureView {
        return GpuTextureView.init(textureCreateView(self.id));
    }
};
