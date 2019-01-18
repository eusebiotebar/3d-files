//==============================================================================
// (C) COPYRIGHT 2018 TPSEC
// File: MyMonitorHook.scad
//
//
//=============================================================================

/** @defgroup MyMonitorHook Platform to hook the headphones in left/right side of monitor
 *  @ingroup MyMonitorHook
 *  @brief \n

	@details


	Written by Eusebio Tebar
	mailto:etebar AT tpsec DOT com DOT es

	Current version:
	v. 1.0:
 @{
 */

 /**
	@ingroup  MonitorHook
	Desing Status. This definition is used for design status traceability\n
	- Code	 -> State
	- 0x0000 -> Template
	- 0x0001 -> Preliminary
	- 0x0010 -> Debug
	- 0x0100 -> Test
	- 0x1000 -> Release
*/

//MyMonitorHook				(0x0000)

/****************************************************************************
	Parameters
****************************************************************************/

/****************************************************************************
	Modules
****************************************************************************/

module arc180(radius, angle){
	rotate(a = angle, v= [0,0,1])
	difference(){
		circle(radius);
		//rotate(a = angle, v= [0,0,1])
			translate([-radius,0,0])
				square([2*radius,radius],false);
		rotate(a = 90 - angle, v= [0,0,1])
			translate([-radius,-radius,0])
				square([radius,2*radius],false);
	}
}


/****************************************************************************
	Render
****************************************************************************/
// rotate(a = 10, v= [0,0,1])
// 	arc180(10,10);


/*
|| @changelog
|| | Issue		Date		Name			Comment
|| | --------	-----------	------------	---------------------------------
|| | 1.0.0.X 	17/01/2019 - E. Tebar : 	Initial Release
|| #
*/
/***************************************************************************/
/** @} */ /*	End of file */
/***************************************************************************/