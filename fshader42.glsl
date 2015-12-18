/*****************************
 * File: fshader42.glsl
 *       A simple fragment shader
 *****************************/

#version 150  // YJC: Comment/un-comment this line to resolve compilation errors
                 //      due to different settings of the default GLSL version

in  vec4 color;
in	vec4 ePosition;
in  vec2 texCoord;
out vec4 fColor;
uniform int fog_mode;
// for texture
uniform int Texture_app_flag;
uniform sampler2D texture_2D;

void main() 
{ 
	vec3 fogColor = vec3(0.7, 0.7, 0.7), fColor3;
	float density = 0.09, z = length(ePosition.xyz), f;
	vec4 colorAfterTexM;

	// texture mapping
	switch(Texture_app_flag){
	case 1:
		// texture tiling for ground
		colorAfterTexM = color*texture( texture_2D, texCoord );
		break;
	default:
		colorAfterTexM = color;
		break;
	}

	// fog
	switch(fog_mode){
	case 0:
		f = 1.0;
		break;
	case 1:
		// end-z/end-start
		f = (18.0-z)/(18.0-0.0);
		break;
	case 2:
		f = exp(-density*z);
		break;
	case 3:
		f = exp(-pow(density*z,2));
		break;
	}
	f = clamp(f, 0.0, 1.0);
	fColor3 = mix(fogColor, colorAfterTexM.xyz, f);
	fColor = vec4(fColor3, colorAfterTexM.w);

	

} 

