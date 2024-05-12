//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 in_texel;
uniform float pixel_width;
uniform vec4 color;

void main() {
	vec4 newColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 pixelSize = in_texel * pixel_width;
	
	if(texture2D(gm_BaseTexture, v_vTexcoord).a <= 0.0) {
		float alpha = 0.0;
		
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - pixelSize.x, v_vTexcoord.y) ).a);
		alpha += max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + pixelSize.x, v_vTexcoord.y) ).a);
		alpha += max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - pixelSize.y) ).a);
		alpha += max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + pixelSize.y) ).a);
		alpha += max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - pixelSize.x, v_vTexcoord.y - pixelSize.y) ).a);
		alpha += max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + pixelSize.x, v_vTexcoord.y + pixelSize.y) ).a);
		alpha += max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - pixelSize.x, v_vTexcoord.y + pixelSize.y) ).a);
		alpha += max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + pixelSize.x, v_vTexcoord.y - pixelSize.y) ).a);
		
		if (alpha > 0.0) {
			newColor = color;
		}
	}
	
	gl_FragColor = newColor;
}
