extern fn windowWidth() u16;
extern fn windowHeight() u16;

pub fn width() u16 {
    return windowWidth();
}

pub fn height() u16 {
    return windowHeight();
}
