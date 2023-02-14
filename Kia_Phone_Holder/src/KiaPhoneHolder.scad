//==============================================================================
// (C) COPYRIGHT 2022 TPSEC
// File: KiaPhoneHolder.scad
//
//
//=============================================================================

/** @defgroup KiaPhoneHolder Platform to set phone holder
 *  @ingroup KiaPhoneHolder
 *  @brief \n

	@details


	Written by Eusebio Tebar
	mailto:etebar AT tpsec DOT com DOT es

	Current version:
	See @changelog
 @{
 */

 /**
	@ingroup  Ring
	Desing Status. This definition is used for design status traceability\n
	- Code	 -> State
	- 0x0000 -> Template
	- 0x0001 -> Preliminary
	- 0x0010 -> Debug
	- 0x0100 -> Test
	- 0x1000 -> ReleaseGrid
*/

//KiaPhoneHolder				(0x0001)


// @changelog
//      | Issue		Date		Name			Comment
//      | --------	-----------	------------	---------------------------------
//
/* [Hidden] */
version = "0.1.1" ;	// 05/07/2022 - E. Tebar : 	Initial Release
// #

include <grid.scad>

/****************************************************************************
	Parameters
****************************************************************************/
$fn= $preview ? 32 : 64;

/* [Pad 1 parameters] */
rotatePad1 = 9;
pad1Width = 28;
pad1Thickness = 6;
pad1Deep = 5;
pad1X = 34;
pad1Y = 25;

/* [Pad 2 parameters] */
pad2Width = 20.9;
pad2X = 107;
pad2Y = 30;


/* [BaseProfile parameters] */
pivotRadius=5;
// Base 
Base = 154.5; 
// Lateral Scroll
Scroll = 12.8; 
baseThickness= 1;
baseWidth = 68.5; 
baseLength = Base ;
pinRadius=2;
pinTaper=0.25;
clearance=0.2;
tiny=0.005;

// Set coordinates
x = -baseLength/2 ;
y = -baseWidth/2;
z = 0; 
HalfExtrudeLength=baseLength-clearance/2;

/****************************************************************************
	Modules
****************************************************************************/
module pad(rotateZ, padWidth, padThickness){
	rotate([0,0,rotateZ])
		{
    	square([padWidth,padThickness]);
		}
}

module HalfBaseScroll(){
	path_pts = [
		[0, 0],
		[Scroll, 0],
		[0, baseWidth]
		];
    polygon(path_pts);
}

module BaseProfile() {

	union() 
		{
		difference()
			{
			square([baseLength,baseWidth]);
			HalfBaseScroll();
			}
			translate([baseLength,0,0])
				{
				HalfBaseScroll();
				}
		}
}

module Body() {

//	union() 
	difference()
		{
		linear_extrude(baseThickness)
		  	{
			offset(1)offset(-2)offset(1)
				{
				BaseProfile();
				}
			}		
		#linear_extrude(pad1Deep)
			{
			offset(1)offset(-1)
				{
				translate([pad1X,pad1Y,0])
					{
					pad(rotatePad1,pad1Width,pad1Thickness);
					}
				}
			}
		#linear_extrude(pad1Deep)
			{
			offset(1)offset(-1)
				{
				translate([pad2X,pad2Y,0])
					{
					pad(rotatePad1,pad2Width,pad1Thickness);
					}
				}
			}
		}

}

/****************************************************************************
	Render
****************************************************************************/


projection()
	translate([x,y,z])
		{
		Body();
		}
*Grid();


/***************************************************************************/
/** @} */ /*	End of file */
/***************************************************************************/
