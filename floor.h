/*
 * Struct for floor
 * Author: Weichen Xu
 * Date : 11/10/2015
 * Generate floor points & color
*/
#ifndef _WCX_floor
#define _WCX_floor
#include "Angel-yjc.h"
#define _FLOOR_VERTICES 2*3
#define _AXIS_VERTICES 3*2
typedef Angel::vec3  color3;
typedef Angel::vec3  point3;
class WCX_floor{
public:
	WCX_floor();
	GLuint floor_buffer;	/*vertex buffer object id for floor */
	GLuint axis_buffer;
	int vertex_size;
	int axis_vertex_size;
	bool fill_flag;
	point3 floor_points[_FLOOR_VERTICES];
	color3 floor_colors[_FLOOR_VERTICES];
	point3 axis_points[_AXIS_VERTICES];
	color3 axis_colors[_AXIS_VERTICES];
	bool setFloor(point3 topR, point3 downL);
	void setColor(color3 uniformColor);
	void generateAxis();
};
#endif