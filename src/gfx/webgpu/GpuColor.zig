const Color = @import("../../ui/Color.zig").Color;
const js = @import("../../js.zig");
const Id = @import("../../types.zig").Id;

pub const GpuColor = struct {
    id: Id,

    pub fn init(color: Color) GpuColor {
        return GpuColor{
            .id = js.color(color.r, color.g, color.b, color.a),
        };
    }

    pub fn deinit(self: GpuColor) void {
        js.remove(self.id);
    }
};
