#include "floor.h"
#define axis_scale 10
WCX_floor::WCX_floor(){
	vertex_size = _FLOOR_VERTICES;
	axis_vertex_size = _AXIS_VERTICES;
}

bool WCX_floor::setFloor(point3 topR, point3 downL){
	if(topR.y != downL.y)	return false;
	int y = topR.y;
	floor_points[0] = color3(topR.x,y,topR.z);
	floor_points[1] = color3(topR.x,y,downL.z);
	floor_points[2] = color3(downL.x,y,downL.z);
	floor_points[3] = color3(topR.x,y,topR.z);
	floor_points[4] = color3(downL.x,y,topR.z);
	floor_points[5] = color3(downL.x,y,downL.z);
	return true;
}
void WCX_floor::setColor(color3 color){
	for(int i=0; i<_FLOOR_VERTICES; i++){
		
		floor_colors[i] = color;
	}
}
void WCX_floor::generateAxis(){
	// axis x
	axis_points[0] = point3(0.0,0.0,0.0)*axis_scale;	axis_colors[0] = color3(1.0,0.0,0.0);
	axis_points[1] = point3(1.0,0.0,0.0)*axis_scale;	axis_colors[1] = color3(1.0,0.0,0.0);
	axis_points[2] = point3(0.0,0.0,0.0)*axis_scale;	axis_colors[2] = color3(1.0,0.0,1.0);
	axis_points[3] = point3(0.0,1.0,0.0)*axis_scale;	axis_colors[3] = color3(1.0,0.0,1.0);
	axis_points[4] = point3(0.0,0.0,0.0)*axis_scale;	axis_colors[4] = color3(0.0,0.0,1.0);
	axis_points[5] = point3(0.0,0.0,1.0)*axis_scale;	axis_colors[5] = color3(0.0,0.0,1.0);
}