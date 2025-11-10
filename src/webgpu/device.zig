extern fn device() usize;

pub const GpuDevice = struct {
    id: usize,

    pub fn init() GpuDevice {
        return GpuDevice{
            .id = device(),
        };
    }
};
