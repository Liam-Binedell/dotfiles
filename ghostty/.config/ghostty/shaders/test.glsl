// center of a cursor rect (y flipped, since fragCoord is bottom-left origin)
vec2 cursorCenter(vec4 c) {
  return c.xy + c.zw * vec2(0.5, -0.5);
}

// distance to a box (negative inside)
float sdBox(vec2 p, vec2 center, vec2 halfSize) {
  vec2 d = abs(p - center) - halfSize;
  return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

// distance to a line segment
float sdSegment(vec2 p, vec2 a, vec2 b) {
  vec2 pa = p - a, ba = b - a;
  float h = clamp(dot(pa, ba) / max(dot(ba, ba), 1e-5), 0.0, 1.0);
  return length(pa - ba * h);
}

float easeOutCubic(float t) {
  return 1.0 - pow(1.0 - t, 3.0);
}

const float DURATION = 0.25;

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
  vec2 uv = fragCoord / iResolution.xy;
  vec4 col = texture(iChannel0, uv);

  vec2 prev = cursorCenter(iPreviousCursor);
  vec2 cur = cursorCenter(iCurrentCursor);

  float t = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);

  vec2 head = mix(prev, cur, easeOutCubic(t)); // leads
  vec2 tail = mix(prev, cur, t * t); // lags

  float radius = iCurrentCursor.z * 0.2;
  float d = sdSegment(fragCoord, tail, head) - radius;
  float mask = 1.0 - smoothstep(0.0, 1.5, d);

  float fade = 1.0 - t;
  col.rgb = mix(col.rgb, iCurrentCursorColor.rgb, mask * fade * 0.7);
  fragColor = col;
}
