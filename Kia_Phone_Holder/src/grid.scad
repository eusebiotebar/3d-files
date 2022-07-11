//==============================================================================
// (C) COPYRIGHT 2022 TPSEC
// File: grid.scad
//
//
//=============================================================================

/** @defgroup grid Support visualizating
 *  @ingroup grid
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
//Grid				(0x0000)

/*
|| @changelog
|| | Issue		Date		Name			Comment
|| | --------	-----------	------------	---------------------------------
|| | 1.0.0.0 	11/07/2022 - E. Tebar : 	Initial Release
|| #
*/

/****************************************************************************
	Parameters
****************************************************************************/
// 
/* [Grid parameters] */
// N x N squares
// square size
SquareSize = 10; 
// grid spheres radio
SphereRadio = 0.5;
// square numbers (N x N)
SpheresNumer = 30;

/****************************************************************************
	Modules
****************************************************************************/

module Grid(){

// Grid total size
size = SpheresNumer * SquareSize;

// Drawing Grid
translate([-size / 2, -size / 2, 0]) // Center Grid
for (ix = [0:SpheresNumer])					 // spheres in x axle
  for (iy = [0:SpheresNumer]) 					//  spheres in y axle
    // Set sphere in the point (ix, iy)
	color("Gainsboro")
    	translate([ix * SquareSize, iy * SquareSize, 0])
			sphere(r = SphereRadio, $fn=20);
}

/****************************************************************************
	Render
****************************************************************************/
// Grid();



/***************************************************************************/
/** @} */ /*	End of file */
/***************************************************************************/