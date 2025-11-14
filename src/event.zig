const Ui3d = @import("ui/Ui3d.zig").Ui3d;

pub var ui: *Ui3d = undefined;

pub export fn resize(width: usize, height: usize) void {
    ui.resize(width, height);
}

export fn mouseMove(x: i32, y: i32) void {
    ui.mouseMove(x, y);
}

export fn mouseClick(x: i32, y: i32) void {
    ui.mouseClick(x, y);
}

export fn mouseDoubleClick(x: i32, y: i32) void {
    ui.mouseDoubleClick(x, y);
}

export fn mouseDown(x: i32, y: i32, button: u8) void {
    ui.mouseDown(x, y, button);
}

export fn mouseUp(x: i32, y: i32, button: u8) void {
    ui.mouseUp(x, y, button);
}

export fn mouseWheel(x: i32, y: i32, delta_y: i8) void {
    ui.mouseWheel(x, y, delta_y);
}

export fn keyDown(code: u32) void {
    ui.keyDown(code);
}

export fn keyUp(code: u32) void {
    ui.keyUp(code);
}
