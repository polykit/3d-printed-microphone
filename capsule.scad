translate([0, 0, 0]) {
    difference() {   
        cylinder(h=45, r=22, $fn=100);
        translate([0, 0, 2]) {
            cylinder(h=50, r=19, $fn=100);
        }
        translate([0, 0, 40]) {
            cylinder(h=10, r=20, $fn=100);
        }
        translate([0, 0, 48]) {
            cube([2, 50, 20], true);
        }
        translate([0, 11, -5]) {
            cylinder(h=10, r=1.5, $fn=100);
        }        
    }
    
    difference() {   
        cylinder(h=8, r=9.5, $fn=100);
        translate([0, 0, 2]) {
            cylinder(h=20, r=7.5, $fn=100);
        }
    }
}
