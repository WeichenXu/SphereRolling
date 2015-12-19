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
in  vec4 vColor;

out vec4 color;
out vec4 ePosition; // position in eye frame
out vec4 oPosition; // position in world frame

uniform mat4 model_view;
uniform mat4 projection;

void main() 
{
    // YJC: Original, incorrect below:
    //      gl_Position = projection*model_view*vPosition/vPosition.w;
	oPosition = vPosition;
	ePosition = model_view*vPosition;
    gl_Position = projection * model_view * vPosition;
	color = vColor;
} 
