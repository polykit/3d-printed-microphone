$spokeCount = 40;
$spokeWidth = 0.5;

translate([0, 0, -0.2]) {
    difference() {   
        cylinder(h=5, r=20, $fn=100);
        translate([0, 0, -1]) {
            cylinder(h=10, r=18, $fn=100);
        }
    }

    difference() {
        cylinder(h=0.4, r=20, $fn=100);
        translate([0, 0, -1]) {
            cylinder(h=2, r=18, $fn=100);
        }
    }
    
    difference() {   
        cylinder(h=20, r=8.5, $fn=100);
        translate([0, 0, 0.4]) {
            cylinder(h=30, r=8, $fn=100);
        }
    }

}

spiralSpokes(38, 0.4, $spokeCount, $spokeWidth, 1, false);

module spiralSpokes( diameter, wheelWidth, number, spokeWidth, curvature, reverse ) {
	intersection() {
		cylinder( h=wheelWidth, r=diameter/2, center = true, $fn=100 ); 

		for (step = [0:number-1]) {
		    rotate( a = step*(360/number), v=[0, 0, 1])
			spiralSpoke( wheelWidth, spokeWidth, (diameter/4) * 1/curvature, reverse );
		}
	}
}
module spiralSpoke( wheelWidth, spokeWidth, spokeRadius, reverse=false ) {
	render() 
	intersection() {	
		translate ( [-spokeRadius, 0, 0] ) {
			difference() {
				cylinder( r=spokeRadius, h=wheelWidth, center=true, $fn=100 ); 
				cylinder( r=spokeRadius-(spokeWidth/2), h=wheelWidth+1, center=true, $fn=100 ); 
			}
		}
		if ( reverse ) 
			translate ( [-spokeRadius, -spokeRadius/2, 0] ) 
				cube( [spokeRadius*2,spokeRadius,wheelWidth+1], center=true ); 
		else 
			translate ( [-spokeRadius, spokeRadius/2, 0] ) 
				cube( [spokeRadius*2,spokeRadius,wheelWidth+1], center=true ); 
	}
}
