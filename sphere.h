/*
 * Struct for sphere
 * Author: Weichen Xu
 * Date : 11/10/2015
 * init & load information for sphere
 * Rolling attribute and function
*/
#ifndef  _WCX_sphere
#define  _WCX_sphere
#include "Angel-yjc.h"
#include <string>
#include <iostream>
#include <fstream>
#define _MAX_SPHERE_VERTICES	1000
#define PI 3.1415
typedef Angel::vec3  color3;
typedef Angel::vec3  point3;
class WCX_sphere{
private:
	float rollingSpeed, radius;	// speed radian per frame
	vec3 rollingDirection, rollingAxis; // rotation direction: point B->A, rotation axis, Y cross dir
	vec3 rollingStart;	// start point of the current rolling seg
	mat4 accumuRollingM;	// Accumulated rolling matrix
public:
	WCX_sphere();
	GLuint sphere_buffer;	/*vertex buffer object id for sphere */
	bool fill_flag;
	int vertex_size;
	point3 sphere_points[_MAX_SPHERE_VERTICES];
	color3 sphere_colors[_MAX_SPHERE_VERTICES];
	void initColor(color3 uniformColor);
	
	//----------------------------------------------
	//functions for rolling
	void loadSphereFromFile();
	void setRadius(float rad){this->radius = rad;}
	int rollingFromAToB(point3 A, point3 B, mat4 lastRotateM); // rolling sphere from A to B
	mat4 rollingFramePosition(int frame); // get rolling translate matrix at frame n
	//vec3 getRollingAxis(){return this->rollingAxis;} 
	mat4 rollingFrameRotate(int frame); // get rolling rotation matrix at frame n
	
};
#endif