#pragma once
#include "Angel-yjc.h"
typedef Angel::vec4  color4;
struct WCX_light_products{
	color4 ambient_product;
    color4 diffuse_product;
    color4 specular_product;
	// material
	color4 material_ambient;
    color4 material_diffuse;
    color4 material_specular;
    float  material_shininess;
};