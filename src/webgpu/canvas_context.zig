extern fn canvasContext() usize;

pub const GpuCanvasContext = struct {
    id: usize,

    pub fn init() GpuCanvasContext {
        return GpuCanvasContext{
            .id = canvasContext(),
        };
    }
};
