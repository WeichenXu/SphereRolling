#include "floor.h"

WCX_floor::WCX_floor(){
	vertex_size = _FLOOR_VERTICES;
	axis_vertex_size = _AXIS_VERTICES;
}

bool WCX_floor::setFloor(point4 topR, point4 downL){
	if(topR.y != downL.y)	return false;
	int y = topR.y;
	floor_points[0] = color4(topR.x,y,topR.z, 1.0);
	floor_points[1] = color4(topR.x,y,downL.z, 1.0);
	floor_points[2] = color4(downL.x,y,downL.z, 1.0);
	floor_points[3] = color4(topR.x,y,topR.z, 1.0);
	floor_points[4] = color4(downL.x,y,topR.z, 1.0);
	floor_points[5] = color4(downL.x,y,downL.z, 1.0);
	return true;
}
void WCX_floor::setColor(color4 color){
	for(int i=0; i<_FLOOR_VERTICES; i++){
		
		floor_colors[i] = color;
	}
}
void WCX_floor::generateAxis(){
	// axis x
	axis_points[0] = point4(0.0,0.0,0.0,1.0);	axis_colors[0] = color4(1.0,0.0,0.0,1.0);
	axis_points[1] = point4(10.0,0.0,0.0,1.0);	axis_colors[1] = color4(1.0,0.0,0.0,1.0);
	axis_points[2] = point4(0.0,0.0,0.0,1.0);	axis_colors[2] = color4(1.0,0.0,1.0,1.0);
	axis_points[3] = point4(0.0,10.0,0.0,1.0);	axis_colors[3] = color4(1.0,0.0,1.0,1.0);
	axis_points[4] = point4(0.0,0.0,0.0,1.0);	axis_colors[4] = color4(0.0,0.0,1.0,1.0);
	axis_points[5] = point4(0.0,0.0,10.0,1.0);	axis_colors[5] = color4(0.0,0.0,1.0,1.0);
}