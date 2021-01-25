//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 invertColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	invertColor.rgb = 1.0 - invertColor.rgb;
	
	gl_FragColor = invertColor;
}
