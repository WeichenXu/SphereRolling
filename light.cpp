#include "light.h"
void WCX_light::getProduct(WCX_light_products &lp){
	lp.ambient_product = (global_ambient+light_ambient)*lp.material_ambient;
	lp.diffuse_product = (light_diffuse)*lp.material_diffuse;
	lp.specular_product = (light_specular)*lp.material_shininess;
}