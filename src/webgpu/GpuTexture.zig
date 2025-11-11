extern fn destroyTexture(id: usize) void;

pub const GpuTexture = struct {
    id: usize,

    pub fn init(id: usize) GpuTexture {
        return GpuTexture{
            .id = id,
        };
    }

    pub fn deinit(self: GpuTexture) void {
        destroyTexture(self.id);
    }
};
