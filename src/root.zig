extern fn console_log(message: [*]const u8, length: u8) void;

export fn start() i32 {
    const log = "Hello World!";
    console_log(log, log.len);
    return 42;
}
