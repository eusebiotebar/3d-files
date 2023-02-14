$fn= $preview ? 32 : 64;

pivotRadius=5;
baseThickness=3;
baseWidth=15;
hingeLength=30;
pinRadius=2;
pinTaper=0.25;
clearance=0.2;
tiny=0.005;
mountingHoleRadius=1.5;
mountingHoleEdgeOffset=4;
mountingHoleCount=3;

mountingHoleMoveIncrement=(hingeLength-2*mountingHoleEdgeOffset)/
    (mountingHoleCount-1);
hingeHalfExtrudeLength=hingeLength/2-clearance/2;


module hingeBaseProfile() {
  translate([pivotRadius,0,0]){
    square([baseWidth,baseThickness]);
  }
}


module hingeBodyHalf() {
  difference() {
    union() {
      linear_extrude(hingeHalfExtrudeLength){
        offset(1)offset(-2)offset(1){
          translate([0,pivotRadius,0]){
            circle(pivotRadius);
          }
          square([pivotRadius,pivotRadius]);
          hingeBaseProfile();
        }
      }
      linear_extrude(hingeLength){
        offset(1)offset(-1)hingeBaseProfile();
      }
    }
    plateHoles();
  }
}

// ... other module definitions above
module pin(rotateY, radiusOffset) {
  translate([0,pivotRadius,hingeHalfExtrudeLength+tiny]){
    rotate([0,rotateY,0]){
      cylinder(
        h=hingeLength/2+clearance/2, 
        r1=pinRadius+radiusOffset,
        r2=pinRadius+pinTaper+radiusOffset
        );
    }
  }
}

module hingeHalfFemale() {
  difference() {
    hingeBodyHalf();
      pin(rotateY=180, radiusOffset=clearance);
  }
}

module hingeHalfMale() {
  translate([0,0,hingeLength]) {
    rotate([0,180,0]) {
      hingeBodyHalf();
      pin(rotateY=0, radiusOffset=0);
    }
  }
}

module plateHoles() {
  for(i=[0:mountingHoleCount-1]){
    translate([
      baseWidth/2+pivotRadius,
      -baseThickness,
      i*mountingHoleMoveIncrement+mountingHoleEdgeOffset // <-- add offset
      ]){
      rotate([-90,0,0]){
        cylinder(r=mountingHoleRadius,h=baseThickness*4);
      }
    }
  }
}

hingeHalfFemale();
hingeHalfMale();
