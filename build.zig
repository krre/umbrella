const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .wasm32,
        .os_tag = .freestanding,
    });

    const optimize = b.standardOptimizeOption(.{});

    const mod = b.addModule("umbrella", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
    });

    const lib = b.addExecutable(.{
        .name = "lib",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/root.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "umbrella", .module = mod },
            },
        }),
    });

    lib.entry = .disabled;
    lib.out_filename = "../../web/lib.wasm";
    lib.root_module.export_symbol_names = &[_][]const u8{
        "start",
    };

    b.installArtifact(lib);
}
