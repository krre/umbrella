extern fn adapter() usize;

pub const GpuAdapter = struct {
    id: usize,

    pub fn init() GpuAdapter {
        return GpuAdapter{
            .id = adapter(),
        };
    }
};
