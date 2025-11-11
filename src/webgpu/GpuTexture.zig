const webgpu = @import("../webgpu.zig");
const Id = webgpu.Id;
const GpuTextureView = @import("GpuTextureView.zig").GpuTextureView;

extern fn destroyTexture(id: Id) void;
extern fn textureCreateView(id: Id) Id;

pub const GpuTexture = struct {
    id: Id,

    pub fn init(id: Id) GpuTexture {
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
