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

/* [Base parameters] */
// Base 
Base = 154.5; 
// Lateral Scroll
Scroll = 12.8; 
// Length
BaseLength = Base- Scroll; 
// Wide
Wide = 68.5; 
// Thickness
Thickness = 1; 
// Cube round
CubeRoundRadio = 1; 


/****************************************************************************
	Modules
****************************************************************************/

// Profile in 3D
module CubeProfile()
{

// Set coordinates
x = BaseLength/2 ;
y = Wide/2;
z = Thickness; 

// Calculate cube vortices
vertice = [
  [x, y, z],
  [-x -Scroll, y, z],
  [-x, -y, z],
  [x + Scroll, -y, z],
  [x, y, -z],
  [-x - Scroll, y, -z],
  [-x , -y, -z],
  [x + Scroll, -y, -z],
]; 

// Draw rounded cube. One sphere per vortice with radio r and applie hull operator
hull()
  for (pos = vertice)
    translate(pos)
      sphere(r = CubeRoundRadio, $fn = 20);
}

/****************************************************************************
	Render
****************************************************************************/


// projection()
Grid();
	CubeProfile();



/***************************************************************************/
/** @} */ /*	End of file */
/***************************************************************************/
