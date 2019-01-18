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
include <arc.scad>
/****************************************************************************
	Parameters
****************************************************************************/

/* [Hidden] */
$fa = 6;
$fs = 0.5;

height_front=16;
text_line1="E. Tébar";
text_line2="Knorr-Bremse";
font_size=5;

hookThickness	= 2;
MonitorHeight	= 17;
hookHeight 		= 40;
hookLength		= 30;
topLength 		= 2*hookHeight;
topBezel 		= 16;
r34 			= 10;
r56 			= 10;
r67 			= 16;
r89				= topBezel;
r1011			= 10;
r1213			= topBezel;

// arcUpCrochet	= 8*r56;
// angleUpCrochet	= 200;									// TODO link with hookLength and hookHeight
arcUpCrochet		= 80;
angleUpCrochet		= 200;
echo(arcUpCrochet,angleUpCrochet);

// arcDownCrochet		= 3.5*r56;
// angleDownCrochet	= 190;
arcDownCrochet		= 35;
angleDownCrochet	= 190;
echo(arcDownCrochet,angleDownCrochet);



/****************************************************************************
	Modules
****************************************************************************/
						
p1x = 0;												p1y = 0;											// echo("p1x  :",p1x ,"p1y :",p1y );	
p2x = p1x-topLength;									p2y = 0;											// echo("p2x  :",p2x ,"p2y :",p2y );	
p3x = p2x;												p3y = p2y - hookHeight;								// echo("p3x  :",p3x ,"p3y :",p3y );	
p4x = p3x - r34;										p4y = p3y - r34;									// echo("p4x  :",p4x ,"p4y :",p4y );	
p5x = p4x - hookLength;									p5y = p4y;											// echo("p5x  :",p5x ,"p5y :",p5y );	
p6x = p5x - r56;										p6y = p5y + r56;									// echo("p6x  :",p6x ,"p6y :",p6y );	
p7x = p5x;												p7y = p5y - (r67-r56);								// echo("p7x  :",p7x ,"p7y :",p7y );	
p8x = p2x;												p8y = p7y - r89;									// echo("p8x  :",p8x ,"p8y :",p8y );	
p9x = p8x + r89;										p9y = p7y;											// echo("p9x  :",p9x ,"p9y :",p9y );	
p10x = p9x;												p10y = -topBezel - r1011;							// echo("p10x :",p10x,"p10y:",p10y);	
p11x = p10x + r1011;									p11y = -topBezel ;									// echo("p11x :",p11x,"p11y:",p11y);	
p12x = p1x;												p12y = p11y;										// echo("p12x :",p12x,"p12y:",p12y);	
p13x = p1x + r1213;										p13y = 0;											// echo("p13x :",p13x,"p13y:",p13y);	

pUpCrochetCenterx = p4x - (1*hookLength/3);				pUpCrochetCentery = p6y + (hookHeight/4);			// echo("pUpCrochetCenterx :",pUpCrochetCenterx,"pUpCrochetCentery:",pUpCrochetCentery);	
pDownCrochetCenterx = p4x - (1*hookLength/3);			pDownCrochetCentery = - (8*hookHeight/9);			// echo("pDownCrochetCenterx :",pDownCrochetCenterx,"pDownCrochetCentery:",pDownCrochetCentery);	


Ux = p5x - pUpCrochetCenterx;																				// echo("Ux",Ux);
Uy = p5y - pUpCrochetCentery;																				// echo("Uy",Uy);
pUpCrochetRadio = sqrt((Ux*Ux)+(Uy*Uy));																	// echo("pDownCrochetRadio",pDownCrochetRadio);


Dx = p7x - pDownCrochetCenterx;																				// echo("Dx",Dx);
Dy = p7y - pDownCrochetCentery;																				// echo("Dy",Dy);
pDownCrochetRadio = sqrt((Dx*Dx)+(Dy*Dy));																	// echo("pDownCrochetRadio",pDownCrochetRadio);

// Side Profile in 2D
module Side_Profile() {

difference(){
	union(){
		polygon	([
				[p1x,p1y],	[p2x,p2y],	[p3x,p3y],	[p4x,p4y],	[p5x,p5y],	//[p6x,p6y],
				[p7x,p7y],	[p8x,p8y],	[p9x,p9y],	[p10x,p10y],[p11x,p11y],[p12x,p12y],
				[p13x,p13y]
				]);
		rotate(a = -90, v= [0,0,1])
			 arc180(r1213,90);

		translate([p8x,p9y,0])
			rotate(a = -90, v= [0,0,1])
				arc180(r89,90);

		Crochet();
		}
	translate([p4x,p3y,0])
		rotate(a = -90, v= [0,0,1])
			arc180(r34,90);

	translate([p11x,p10y,0])
		rotate(a = 90, v= [0,0,1])
			arc180(r1011,90);

	}
}

module Crochet(){

	difference(){
		 translate([pDownCrochetCenterx,pDownCrochetCentery,0])
		  	rotate(a = angleDownCrochet, v= [0,0,1])
		 	 	 arc180(pDownCrochetRadio,arcDownCrochet);

		translate([pUpCrochetCenterx,pUpCrochetCentery,0])
		 	rotate(a = angleUpCrochet, v= [0,0,1])
		 	 	 arc180(pUpCrochetRadio,arcUpCrochet);
		}
}

/****************************************************************************
	Render
****************************************************************************/
difference(){
	// Profile extruded
	linear_extrude(height = MonitorHeight) 
	 	Side_Profile();

	// Remove material
	translate([p2x+hookThickness,  p8y - hookThickness, hookThickness])
		cube([topLength+p13x,-p8y,MonitorHeight]);		//echo("cubo :",topLength+p13x,-p8y,MonitorHeight);

	// text on the board
 	rotate([0,180,0]){
		//text line 1
		translate ([0,0,-hookThickness-1]){
	    	translate([topLength-(2*hookThickness), -font_size-2]) {
	 		    linear_extrude(height = 2*hookThickness) {
	     			text(text_line1, font = "Liberation Sans",size=font_size,halign="right");
	 				}
	 			}
	    	//text line 2
	 		translate([topLength-(2*hookThickness), -font_size*2-2*2]) {
	 			linear_extrude(height = 2*hookThickness) {
	     			text(text_line2, font = "Liberation Sans",size=font_size,halign="right");
	 				}
	 			}
	 		}
		}
	}



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