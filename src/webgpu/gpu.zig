extern fn gpu() usize;

pub const Gpu = struct {
    id: usize,

    pub fn init() Gpu {
        return Gpu{
            .id = gpu(),
        };
    }
};
