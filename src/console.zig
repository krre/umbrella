extern fn console_log(message: [*]const u8, length: usize) void;

pub fn log(message: []const u8) void {
    console_log(message.ptr, message.len);
}
