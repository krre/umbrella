const UI3D = @import("ui/UI3D.zig");
const Id = @import("types.zig").Id;

pub var ui: *UI3D = undefined;

// Events
export fn resize(width: u32, height: u32) void {
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

// Common
pub extern fn destroy(id: Id) void;
pub extern fn remove(id: Id) void;

// Window
pub extern fn windowWidth() u16;
pub extern fn windowHeight() u16;

// WebGPU
pub extern fn gpu() Id;
pub extern fn adapter() Id;
pub extern fn canvasContext() Id;
pub extern fn canvasContextGetCurrentTexture(id: Id) Id;
pub extern fn color(r: f32, g: f32, b: f32, a: f32) Id;
pub extern fn commandEncoderBeginRenderPass(id: Id, descriptor_id: Id) Id;
pub extern fn commandEncoderFinish(id: Id) Id;
pub extern fn device() Id;
pub extern fn deviceCreateCommandEncoder(id: Id) Id;
pub extern fn deviceQueue(id: Id) Id;
pub extern fn queueAddCommandBuffer(id: Id, command_buffer_id: Id) void;
pub extern fn queueSubmit(id: Id) void;
pub extern fn renderPassColorAttachment(view: Id, load_op: u8, store_op: u8, color_value: Id) Id;
pub extern fn renderPassDescriptor() Id;
pub extern fn addRenderPassColorAttachment(id: Id, attachment_id: Id) void;
pub extern fn renderPassEnd(id: Id) void;
pub extern fn destroyTexture(id: Id) void;
pub extern fn textureCreateView(id: Id) Id;
