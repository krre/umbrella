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

    const exe = b.addExecutable(.{
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

    exe.entry = .disabled;
    exe.root_module.export_symbol_names = &[_][]const u8{
        "start",
        "resize",
        "mouseMove",
        "mouseClick",
        "mouseDoubleClick",
        "mouseDown",
        "mouseUp",
        "mouseWheel",
        "keyDown",
        "keyUp",
    };

    const web_dir = "web";

    const install_wasm = b.addInstallArtifact(exe, .{
        .dest_dir = .{ .override = .{ .custom = web_dir } },
        .dest_sub_path = "lib.wasm",
    });

    b.getInstallStep().dependOn(&install_wasm.step);

    const angie3d = "angie3d";

    const angie3d_dep = b.dependency(angie3d, .{
        .target = target,
        .optimize = optimize,
    });

    const install_web = b.addInstallDirectory(.{
        .source_dir = angie3d_dep.path("web"),
        .install_dir = .prefix,
        .install_subdir = web_dir,
    });

    b.getInstallStep().dependOn(&install_web.step);

    const install_icons = b.addInstallDirectory(.{
        .source_dir = b.path("src/web/icon"),
        .install_dir = .prefix,
        .install_subdir = web_dir,
    });

    b.getInstallStep().dependOn(&install_icons.step);

    exe.root_module.addImport(angie3d, angie3d_dep.module(angie3d));
}
