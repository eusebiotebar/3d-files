//==============================================================================
// (C) COPYRIGHT 2018 TPSEC
// File: MatteoRing.scad
//
//
//=============================================================================

/** @defgroup MatteoRing Platform to hook the headphones in left/right side of monitor
 *  @ingroup MatteoRing
 *  @brief \n

	@details


	Written by Eusebio Tebar
	mailto:etebar AT tpsec DOT com DOT es

	Current version:
	v. 2.0:
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
	- 0x1000 -> Release
*/

//MatteoRing				(0x0001)

/****************************************************************************
	Parameters
****************************************************************************/
RingDiameter = 30;
RingHole = 20;
RingHeight = 7;

/****************************************************************************
	Modules
****************************************************************************/

/****************************************************************************
	Render
****************************************************************************/
/*
cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
Parameters
	h : height of the cylinder or cone
	r  : radius of cylinder. r1 = r2 = r.
	r1 : radius, bottom of cone.
	r2 : radius, top of cone.
	d  : diameter of cylinder. r1 = r2 = d /2.
	d1 : diameter, bottom of cone. r1 = d1 /2
	d2 : diameter, top of cone. r2 = d2 /2
		(NOTE: d,d1,d2 require 2014.03 or later. Debian is currently known to be behind this)
	center
		false (default), z ranges from 0 to h
		true, z ranges from -h/2 to +h/2
	$fa : minimum angle (in degrees) of each fragment.
	$fs : minimum circumferential length of each fragment.
	$fn : fixed number of fragments in 360 degrees. Values of 3 or more override $fa and $fs
	$fa, $fs and $fn must be named. click here for more details,.
 */
difference() {
	cylinder( $fn = 200, h = RingHeight, d = RingDiameter);
	translate([0,0,-RingHeight/2]) 
		cylinder( $fn = 200, h = 2*RingHeight, d = RingHole);
}
/*
|| @changelog
|| | Issue		Date		Name			Comment
|| | --------	-----------	------------	---------------------------------
|| | 1.0.0.X 	30/01/2019 - E. Tebar : 	Initial Release
|| #
*/
/***************************************************************************/
/** @} */ /*	End of file */
/***************************************************************************/
