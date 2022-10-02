precision mediump float;
varying vec2 a_pos;
uniform float u_time;
uniform vec2 u_mouse;



void mainImage( out vec4 c, in vec2 fc )
{
    vec2 uv = fc;
    vec3 color = vec3(0.0);
    float a = 0.2 + sin(126.90)*0.3;
    
    for(float i = 1.0; i < 15.0; i += 1.0){
        uv = abs(uv);
        uv -= 0.5;
        uv *= 1.9;
        uv *= mat2(sin(a),-sin(a),cos(a),sin(a));
        uv += 0.5;
    }
    
    color = vec3(length(uv.x)-length(uv.y)*length(uv));
    
    c = vec4(color,1.0);
}

void main(void) {
    vec2 uv = a_pos;
    mainImage(gl_FragColor, uv);
}