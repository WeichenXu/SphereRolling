/*****************************
 * File: fshader42.glsl
 *       A simple fragment shader
 *****************************/

#version 150  // YJC: Comment/un-comment this line to resolve compilation errors
                 //      due to different settings of the default GLSL version

in  vec4 color;
in	vec4 ePosition;
in	vec4 oPosition;
in  vec2 texCoord;
out vec4 fColor;
uniform int fog_mode;
// for texture
uniform int Texture_app_flag;
/*
 1: texture mapping for ground
 2: vertical in obj frame
 3: slanted in obj frame
 4: vertical in eye frame
 5: slanted in eye frame
 6-9: same as upper, but in tex 2D
*/
uniform sampler2D texture_2D;
uniform sampler1D texture_1D;

void main() 
{ 
	vec3 fogColor = vec3(0.7, 0.7, 0.7), fColor3;
	float density = 0.09, z = length(ePosition.xyz), f, s;
	vec4 colorAfterTexM;
	vec4 color_reddish = vec4(0.9, 0.1, 0.1, 1.0);
	vec2 st;

	// texture mapping
	switch(Texture_app_flag){
	case 1:
		// texture tiling for ground
		colorAfterTexM = color*texture( texture_2D, texCoord );
		break;
	case 2:
		// generate s coord for sphere texture
		s = 2.5*oPosition.x;
		colorAfterTexM = color*texture( texture_1D, s );
		break;
	case 3:
		// generate s coord for sphere texture
		s = 1.5*(oPosition.x+oPosition.y+oPosition.z);
		colorAfterTexM = color*texture( texture_1D, s );
		break;
	case 4:
		// generate s coord for sphere texture
		s = 2.5*ePosition.x;
		colorAfterTexM = color*texture( texture_1D, s );
		break;
	case 5:
		// generate s coord for sphere texture
		s = 1.5*(ePosition.x+ePosition.y+ePosition.z);
		colorAfterTexM = color*texture( texture_1D, s );
		break;
	case 6:
		st = vec2(0.75*(oPosition.x+1), 0.75*(oPosition.y+1));
		colorAfterTexM = color*texture( texture_2D, st);
		break;
	case 7:
		st = vec2(0.45*(oPosition.x+oPosition.y+oPosition.z), 0.45*(oPosition.x-oPosition.y+oPosition.z));
		colorAfterTexM = color*texture( texture_2D, st);
		break;
	case 8:
		st = vec2(0.75*(ePosition.x+1), 0.75*(ePosition.y+1));
		colorAfterTexM = color*texture( texture_2D, st);
		break;
	case 9:
		st = vec2(0.45*(ePosition.x+ePosition.y+ePosition.z), 0.45*(ePosition.x-ePosition.y+ePosition.z));
		colorAfterTexM = color*texture( texture_2D, st);
		break;
	default:
		colorAfterTexM = color;
		break;
	}
	// change tex color when sphere 2D texture mapping and color is green
	if(Texture_app_flag>=6 && Texture_app_flag <= 9){
		colorAfterTexM = colorAfterTexM.x == 0.0? color*color_reddish:colorAfterTexM;
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

