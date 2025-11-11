pub const GpuTextureView = struct {
    id: usize,

    pub fn init(id: usize) GpuTextureView {
        return GpuTextureView{
            .id = id,
        };
    }
};
