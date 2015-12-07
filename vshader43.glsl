/***************************
 * File: vshader42.glsl:
 *   A simple vertex shader.
 *
 * - Vertex attributes (positions & colors) for all vertices are sent
 *   to the GPU via a vertex buffer object created in the OpenGL program.
 *
 * - This vertex shader uses the Model-View and Projection matrices passed
 *   on from the OpenGL program as uniform variables of type mat4.
 ***************************/

#version 150 // YJC: Comment/un-comment this line to resolve compilation errors
                 //      due to different settings of the default GLSL version

in  vec4 vPosition;
in  vec3 vNormal;
out vec4 color;

uniform int smooth_shading;
uniform mat4 model_view;
uniform mat4 projection;
uniform vec4 AmbientProduct, DiffuseProduct, SpecularProduct;
uniform vec3 distant_light_dir;
uniform mat3 Normal_Matrix;
//uniform vec4 LightPosition;   // Must be in Eye Frame
uniform float Shininess;


void main() 
{
	// Transform vertex  position into eye coordinates
    vec3 pos = (model_view * vPosition).xyz;
	
    vec3 L = normalize( distant_light_dir - pos );
    vec3 E = normalize( -pos );
    vec3 H = normalize( L +  E );
	vec3 N;
	if(smooth_shading == 0) N = normalize(Normal_Matrix * vNormal);
	else{
		N = Normal_Matrix * vPosition.xyz;
		N = normalize(N);
	}
	vec4 ambient = AmbientProduct;
	vec4 diffuse = DiffuseProduct;
	float s = pow( max(dot(N, H), 0.0), Shininess );
    vec4  specular = s * SpecularProduct;
	if( dot(L, N) < 0.0 ) {
		specular = vec4(0.0, 0.0, 0.0, 1.0);
    } 
    gl_Position = projection * model_view * vPosition;
	color = (ambient + diffuse + specular);
	
} 
