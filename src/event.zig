const Application = @import("Application.zig").Application;

pub var app: *Application = undefined;

pub export fn resize(width: usize, height: usize) void {
    app.resize(width, height);
}

export fn mouseMove(x: i32, y: i32) void {
    app.mouseMove(x, y);
}

export fn mouseClick(x: i32, y: i32) void {
    app.mouseClick(x, y);
}

export fn mouseDoubleClick(x: i32, y: i32) void {
    app.mouseDoubleClick(x, y);
}

export fn mouseDown(x: i32, y: i32, button: u8) void {
    app.mouseDown(x, y, button);
}

export fn mouseUp(x: i32, y: i32, button: u8) void {
    app.mouseUp(x, y, button);
}

export fn mouseWheel(x: i32, y: i32, delta_y: i8) void {
    app.mouseWheel(x, y, delta_y);
}
