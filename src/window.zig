const js = @import("js.zig");

pub fn width() u16 {
    return js.windowWidth();
}

pub fn height() u16 {
    return js.windowHeight();
}
