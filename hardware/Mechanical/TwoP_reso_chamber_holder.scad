
tol = 0.01;
height = 10;
outer_diameter = 31;
pathRadius=25;
num=9;

module petridish(){
    union(){
        translate([0, 0, 1])cylinder(13, 25, 26, center = false, $fn=500);
        translate([0, 0, -1])cylinder(3, 24, 24, center = false, $fn=500);
    }
}

module mould(h, od){
    cylinder(h, od, od, center = false, $fn=500);
}
module scharte(){
    union(){
        translate([0,-1.5,1])cube([2,3,1]);
        translate([1,0,1.5])rotate([0,90,0])cylinder(5,1.5,1.5,center = false, $fn=500);
        difference(){
            translate([5,0,1.5])rotate([0,90,0])cylinder(2,2,2,center = false, $fn=500);
            translate([5,-1.5,-1])cube([2,3,1]);
        }
    }
}
module schiessscharte(pr, n){
    for (i=[1:n+1]){
       translate([pr*cos(i*(180/n)),pr*sin(i*(180/n)),1]) rotate([0,0,(i*(180/n))])scharte();
    }
}
    



difference(){
    mould(height, outer_diameter);
    scale([(1+tol), (1+tol),1])petridish();
    schiessscharte(pathRadius, num);
}