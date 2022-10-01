precision mediump float;
varying vec2 a_pos;
uniform float u_time;
uniform vec2 u_mouse;

float lerp(float a, float b, float t){
    return a + (b-a) * t;
}

float llerp(float t){
    return t;
}

float squaredlerp(float t){
    return t*t;
}

float quadlerp(float t){
    return 1.0 - (1.0 - t) * (1.0 - t);
}

float ss(float t){
    return lerp(quadlerp(t),squaredlerp(t),t);
}

float circle(vec2 uv, float r,float x, float y){
    return ss(lerp(0.0,1.0,ss(((uv.x-x)*uv.x)/r+((uv.y-y)*uv.y)/r)));
}

vec3 lerpcolor(vec3 a, vec3 b, float t){
    float abr = lerp(a.r,b.r,ss(t));
    float abg = lerp(a.g,b.g,ss(t));
    float abb = lerp(a.b,b.b,ss(t));
    return vec3(abr,abg,abb);
}
void mainImage( out vec4 c, in vec2 fc )
{
    vec2 uv = fc;;
    float s = 0.1;
    float l = lerp(0.0,1.0,ss(s));
    
    float ci = circle(uv,0.5,0.0,0.0);
    vec3 color = vec3(0.0);
    
    vec3 cmix1 = vec3(0.102, 1.0, 0.1922);
    vec3 cmix2 = vec3(0.0471, 0.3451, 0.9412);
    vec3 cres = lerpcolor(cmix1,cmix2,uv.x*uv.x*sin(u_time)+uv.y*uv.y*cos(u_time));
    
    color += 1.0-ci;
    color += cres;
    
    
    c = vec4(color,1.0);
}

void main(void) {

    vec2 uv = a_pos;
    mainImage(gl_FragColor, uv);
}