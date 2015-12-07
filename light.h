/*
 * class for light
 * Author: Weichen Xu
 * Date : 12/07/2015
 * Store ambient, diffuse, specular light attributes
*/
#ifndef  _WCX_light
#define  _WCX_light
#include "Angel-yjc.h"
#include "light_products.h"
typedef Angel::vec4  color4;
typedef Angel::vec4  point4;
class WCX_light{
public:
	color4 global_ambient;
	color4 light_ambient;
    color4 light_diffuse;
    color4 light_specular;
    float const_att;
    float linear_att;
    float quad_att;
    point4 light_position; 
	point4 light_direction;

	color4 material_ambient;
    color4 material_diffuse;
    color4 material_specular;
	// function generate 
	// product light * material
	int smooth;
	void getProduct(WCX_light_products &lp);
};
#endif