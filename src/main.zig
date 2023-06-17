const std = @import("std");
pub const timestamp = @import("timestamp");
const Timestamp = timestamp.Timestamp;
pub const ansi = @import("ansi");

pub const Level = enum(u8) {
    Debug = 0,
    Info,
    Warning,
    Error,
    Critical
};

pub var level: Level = .Info;
pub var clean_exit = false;

pub fn debug(comptime title: []const u8, title_args: anytype) void {
    debugFull(title, title_args, "", .{});
}

pub fn debugFull(comptime title: []const u8, title_args: anytype, comptime msg: []const u8, msg_args: anytype) void {
    if (@enumToInt(level) <= @enumToInt(Level.Debug)) {
        const stdout = std.io.getStdOut().writer();
        const datetime = Timestamp.now_local();

        std.fmt.format(stdout, "{}{}{} DEBUG   {}{} ", .{
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(40, 40, 70),
            ansi.Background.rgb(140, 180, 255),
            ansi.Background.default(),
            ansi.Foreground.rgb(140, 180, 255)
        }) catch unreachable;
        std.fmt.formatInt(datetime.date.year, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 4
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(@enumToInt(datetime.date.month), 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(datetime.date.month_day, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(" ") catch unreachable;
        std.fmt.formatInt(datetime.time.hour, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.minute, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.second, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        std.fmt.format(stdout, " {} {}{}{} ", .{
            ansi.Background.rgb(140, 180, 255),
            ansi.Graphics.reset(),
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(140, 180, 255)
        }) catch unreachable;
        std.fmt.format(stdout, title, title_args) catch unreachable;
        if (msg.len != 0) {
            std.fmt.format(stdout, "\n{}{}", .{
                ansi.Graphics.reset(),
                ansi.Foreground.rgb(140, 180, 255)
            }) catch unreachable;
            std.fmt.format(stdout, msg, msg_args) catch unreachable;
        }
        std.fmt.format(stdout, "{}\n\n", .{ansi.Graphics.reset()}) catch unreachable;
    }
}

pub fn info(comptime title: []const u8, title_args: anytype) void {
    infoFull(title, title_args, "", .{});
}

pub fn infoFull(comptime title: []const u8, title_args: anytype, comptime msg: []const u8, msg_args: anytype) void {
    if (@enumToInt(level) <= @enumToInt(Level.Info)) {
        const stdout = std.io.getStdOut().writer();
        const datetime = Timestamp.now_local();

        std.fmt.format(stdout, "{}{}{} INFO    {}{} ", .{
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(40, 40, 70),
            ansi.Background.rgb(150, 215, 150),
            ansi.Background.default(),
            ansi.Foreground.rgb(150, 215, 150)
        }) catch unreachable;
        std.fmt.formatInt(datetime.date.year, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 4
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(@enumToInt(datetime.date.month), 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(datetime.date.month_day, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(" ") catch unreachable;
        std.fmt.formatInt(datetime.time.hour, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.minute, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.second, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        std.fmt.format(stdout, " {} {}{}{} ", .{
            ansi.Background.rgb(150, 215, 150),
            ansi.Graphics.reset(),
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(150, 215, 150)
        }) catch unreachable;
        std.fmt.format(stdout, title, title_args) catch unreachable;
        if (msg.len != 0) {
            std.fmt.format(stdout, "\n{}{}", .{
                ansi.Graphics.reset(),
                ansi.Foreground.rgb(150, 215, 150)
            }) catch unreachable;
            std.fmt.format(stdout, msg, msg_args) catch unreachable;
        }
        std.fmt.format(stdout, "{}\n\n", .{ansi.Graphics.reset()}) catch unreachable;
    }
}

pub fn warn(comptime title: []const u8, title_args: anytype) void {
    warnFull(title, title_args, "", .{});
}

pub fn warnFull(comptime title: []const u8, title_args: anytype, comptime msg: []const u8, msg_args: anytype) void {
    if (@enumToInt(level) <= @enumToInt(Level.Warning)) {
        const stdout = std.io.getStdOut().writer();
        const datetime = Timestamp.now_local();

        std.fmt.format(stdout, "{}{}{} WARNING {}{} ", .{
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(40, 40, 70),
            ansi.Background.rgb(255, 230, 140),
            ansi.Background.default(),
            ansi.Foreground.rgb(255, 230, 140)
        }) catch unreachable;
        std.fmt.formatInt(datetime.date.year, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 4
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(@enumToInt(datetime.date.month), 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(datetime.date.month_day, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(" ") catch unreachable;
        std.fmt.formatInt(datetime.time.hour, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.minute, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.second, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        std.fmt.format(stdout, " {} {}{}{} ", .{
            ansi.Background.rgb(255, 230, 140),
            ansi.Graphics.reset(),
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(255, 230, 140)
        }) catch unreachable;
        std.fmt.format(stdout, title, title_args) catch unreachable;
        if (msg.len != 0) {
            std.fmt.format(stdout, "\n{}{}", .{
                ansi.Graphics.reset(),
                ansi.Foreground.rgb(255, 230, 140)
            }) catch unreachable;
            std.fmt.format(stdout, msg, msg_args) catch unreachable;
        }
        std.fmt.format(stdout, "{}\n\n", .{ansi.Graphics.reset()}) catch unreachable;
    }
}

pub fn err(comptime title: []const u8, title_args: anytype) void {
    errFull(title, title_args, "", .{});
}

pub fn errFull(comptime title: []const u8, title_args: anytype, comptime msg: []const u8, msg_args: anytype) void {
    if (@enumToInt(level) <= @enumToInt(Level.Warning)) {
        const stdout = std.io.getStdOut().writer();
        const datetime = Timestamp.now_local();

        std.fmt.format(stdout, "{}{}{} ERROR   {}{} ", .{
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(40, 40, 70),
            ansi.Background.rgb(255, 160, 140),
            ansi.Background.default(),
            ansi.Foreground.rgb(255, 160, 140)
        }) catch unreachable;
        std.fmt.formatInt(datetime.date.year, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 4
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(@enumToInt(datetime.date.month), 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll("-") catch unreachable;
        std.fmt.formatInt(datetime.date.month_day, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(" ") catch unreachable;
        std.fmt.formatInt(datetime.time.hour, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.minute, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        stdout.writeAll(":") catch unreachable;
        std.fmt.formatInt(datetime.time.second, 10, std.fmt.Case.lower, .{
            .fill = '0',
            .width = 2
        }, stdout) catch unreachable;
        std.fmt.format(stdout, " {} {}{}{} ", .{
            ansi.Background.rgb(255, 160, 140),
            ansi.Graphics.reset(),
            ansi.Graphics.bold(),
            ansi.Foreground.rgb(255, 160, 140)
        }) catch unreachable;
        std.fmt.format(stdout, title, title_args) catch unreachable;
        if (msg.len != 0) {
            std.fmt.format(stdout, "\n{}{}", .{
                ansi.Graphics.reset(),
                ansi.Foreground.rgb(255, 160, 140)
            }) catch unreachable;
            std.fmt.format(stdout, msg, msg_args) catch unreachable;
        }
        std.fmt.format(stdout, "{}\n\n", .{ansi.Graphics.reset()}) catch unreachable;
    }
}

pub fn fatal(comptime title: []const u8, title_args: anytype) noreturn {
    fatalFull(title, title_args, "", .{});
}

pub fn fatalFull(comptime title: []const u8, title_args: anytype, comptime msg: []const u8, msg_args: anytype) noreturn {
    const stdout = std.io.getStdOut().writer();
    const datetime = Timestamp.now_local();

    std.fmt.format(stdout, "{}{}{} FATAL   {}{} ", .{
        ansi.Graphics.bold(),
        ansi.Foreground.rgb(40, 40, 70),
        ansi.Background.rgb(255, 140, 180),
        ansi.Background.default(),
        ansi.Foreground.rgb(255, 140, 180)
    }) catch unreachable;
    std.fmt.formatInt(datetime.date.year, 10, std.fmt.Case.lower, .{
        .fill = '0',
        .width = 4
    }, stdout) catch unreachable;
    stdout.writeAll("-") catch unreachable;
    std.fmt.formatInt(@enumToInt(datetime.date.month), 10, std.fmt.Case.lower, .{
        .fill = '0',
        .width = 2
    }, stdout) catch unreachable;
    stdout.writeAll("-") catch unreachable;
    std.fmt.formatInt(datetime.date.month_day, 10, std.fmt.Case.lower, .{
        .fill = '0',
        .width = 2
    }, stdout) catch unreachable;
    stdout.writeAll(" ") catch unreachable;
    std.fmt.formatInt(datetime.time.hour, 10, std.fmt.Case.lower, .{
        .fill = '0',
        .width = 2
    }, stdout) catch unreachable;
    stdout.writeAll(":") catch unreachable;
    std.fmt.formatInt(datetime.time.minute, 10, std.fmt.Case.lower, .{
        .fill = '0',
        .width = 2
    }, stdout) catch unreachable;
    stdout.writeAll(":") catch unreachable;
    std.fmt.formatInt(datetime.time.second, 10, std.fmt.Case.lower, .{
        .fill = '0',
        .width = 2
    }, stdout) catch unreachable;
    std.fmt.format(stdout, " {} {}{}{} ", .{
        ansi.Background.rgb(255, 140, 180),
        ansi.Graphics.reset(),
        ansi.Graphics.bold(),
        ansi.Foreground.rgb(255, 140, 180)
    }) catch unreachable;
    std.fmt.format(stdout, title, title_args) catch unreachable;
    if (msg.len != 0) {
        std.fmt.format(stdout, "\n{}{}", .{
            ansi.Graphics.reset(),
            ansi.Foreground.rgb(255, 140, 180)
        }) catch unreachable;
        std.fmt.format(stdout, msg, msg_args) catch unreachable;
    }
    std.fmt.format(stdout, "{}\n\n", .{ansi.Graphics.reset()}) catch unreachable;
    std.os.exit(if (clean_exit) 0 else 1);
}

pub fn main() !void {
    // Set the log level
    level = Level.Debug;

    // If set to true, it will exit with 0, otherwise with 1
    clean_exit = true;

    debugFull("Title", .{}, "{s}", .{"This is a debug message!"});
    infoFull("Title", .{}, "{s}", .{"This is an information!"});
    warnFull("Title", .{}, "{s}", .{"This is a warning!"});
    errFull("Title", .{}, "{s}", .{"This is an error!"});
    fatalFull("Title", .{}, "{s}", .{"This is a fatal error!"});

    // Other alternatives (won't run because of the `fatalFull`)
    debug("Title", .{});
    info("Title", .{});
    warn("Title", .{});
    err("Title", .{});
    fatal("Title", .{});
}