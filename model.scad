/*
 * 3D model of limiter frame for eMMC BGA socket adapter
 *
 * Written in 2020 by Vladimir Berlev
 *
 * To the extent possible under law, the author(s) have dedicated all copyright
 * and related and neighboring rights to this software to the public domain worldwide.
 * This software is distributed without any warranty.
 *
 * You should have received a copy of the CC0 Public Domain Dedication along
 * with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
 */

$fn = 50;

horizontal_size = 26.9;
vertical_size = 4;
plenty = 100;

frame();

module frame() {
  difference() {
    frame_base();
    chip_hole(wx=16, wy=12);
  }
}

module chip_hole(wx, wy) {
  cube([wx, wy, plenty], center=true);
  translate([0,  5.75, -plenty / 2]) cylinder(r=4, h=plenty);
  translate([0, -5.75, -plenty / 2]) cylinder(r=4, h=plenty);
}

module frame_base() {
  difference() {
    rcube();
    screw_holes();
    dent1();
    dent2();
    material_safers();
  }
  anchors1();
  anchors2();
}

module rcube() {
  r = 2;
  d = horizontal_size / 2 - r;
  h = vertical_size;
  
  hull() {
    translate([ d,  d, 0]) cylinder(r=r, h=h);
    translate([ d, -d, 0]) cylinder(r=r, h=h);
    translate([-d,  d, 0]) cylinder(r=r, h=h);
    translate([-d, -d, 0]) cylinder(r=r, h=h);
  }
}

module screw_holes() {
  dx = horizontal_size / 2 - 3.5;
  dy = horizontal_size / 2 - 3;
  translate([ dx,  dy, 0]) screw_hole();
  translate([-dx, -dy, 0]) screw_hole();
}

module screw_hole() {
  union() {
    cylinder(r=1, h=plenty);
    translate([0, 0, 0.8]) cylinder(r1=1.85, r2=1, h=1.4);
    translate([0, 0, -1])cylinder(r=1.85, h=1.8);
  }
}

module dent1() {
  dx = 22.02;
  dy = 18.6;
  translate([-dx / 2, -dy / 2, 2.2]) cube([dx, dy, 10]);
}

module dent2() {
  dx = 24;
  dy = 5;
  translate([-dx / 2, -dy / 2, 1.6]) cube([dx, dy, 10]);
}

module anchors1() {
  dx = (18.93 + 1) / 2;
  dy = (6.95  + 1) / 2;
  h = 3.2;
  r = 0.5;
  translate([ dx,  dy, 0]) cylinder(r=r, h=h);
  translate([ dx, -dy, 0]) cylinder(r=r, h=h);
  translate([-dx,  dy, 0]) cylinder(r=r, h=h);
  translate([-dx, -dy, 0]) cylinder(r=r, h=h);
}

module anchors2() {
  dx = horizontal_size / 2 - 2.5;
  dy = horizontal_size / 2 - 2;
  h = 5.5;
  r = 1;
  translate([ dx, -dy, 0]) cylinder(r=r, h=h);
  translate([-dx,  dy, 0]) cylinder(r=r, h=h);
}

module material_safers() {
  wy = 2.5;
  wx = horizontal_size - 11;
  dy = horizontal_size / 2 - wy - 0.8;
  translate([-wx / 2, dy, 1]) cube([wx, wy, plenty]);
  translate([-wx / 2, -dy - wy, 1]) cube([wx, wy, plenty]);
}