/*
 * mode-glow.glsl - カーソル移動で火花が飛び散るシェーダー
 */

const int PARTICLE_COUNT = 12;
const float EXPLOSION_DURATION = 0.8;
const float SPARK_DISTANCE = 50.0;
const float SPARK_DISTANCE_RAND = 150.0;

// Cupertinoパステルカラー
const vec3 PASTEL_PINK = vec3(1.0, 0.6, 0.7);
const vec3 PASTEL_BLUE = vec3(0.6, 0.8, 1.0);
const vec3 PASTEL_GREEN = vec3(0.6, 1.0, 0.7);
const vec3 PASTEL_PURPLE = vec3(0.8, 0.6, 1.0);
const vec3 PASTEL_ORANGE = vec3(1.0, 0.75, 0.5);
const vec3 PASTEL_YELLOW = vec3(1.0, 1.0, 0.6);

float hash(float n) {
    return fract(sin(n) * 43758.5453);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 termColor = texture(iChannel0, uv);

    float timeSinceChange = iTime - iTimeCursorChange;
    vec2 cursorCenter = iCurrentCursor.xy + vec2(iCurrentCursor.z * 0.5, -iCurrentCursor.w * 0.5);

    if (timeSinceChange < EXPLOSION_DURATION) {
        float explosionProgress = timeSinceChange / EXPLOSION_DURATION;
        float timeSeed = fract(iTimeCursorChange * 0.123) * 1000.0;

        for (int i = 0; i < PARTICLE_COUNT; i++) {
            float fi = float(i);
            float seed = fi * 73.156 + timeSeed;
            float angle = hash(seed * 1.234) * 6.28318;
            float speed = SPARK_DISTANCE + hash(seed * 2.345) * SPARK_DISTANCE_RAND;
            float size = 4.0 + hash(seed * 3.456) * 6.0;

            vec2 particleDir = vec2(cos(angle), sin(angle));
            vec2 particlePos = cursorCenter + particleDir * speed * explosionProgress;

            float gravity = 40.0 + hash(seed * 4.567) * 80.0;
            particlePos.y -= gravity * explosionProgress * explosionProgress;

            float particleDist = distance(fragCoord, particlePos);
            float fade = 1.0 - explosionProgress;
            fade *= fade;

            if (particleDist < size * fade) {
                float colorChoice = hash(seed * 5.678);
                vec3 sparkColor;
                if (colorChoice < 0.166) sparkColor = PASTEL_PINK;
                else if (colorChoice < 0.333) sparkColor = PASTEL_BLUE;
                else if (colorChoice < 0.5) sparkColor = PASTEL_GREEN;
                else if (colorChoice < 0.666) sparkColor = PASTEL_PURPLE;
                else if (colorChoice < 0.833) sparkColor = PASTEL_ORANGE;
                else sparkColor = PASTEL_YELLOW;

                float brightness = 1.0 - (particleDist / (size * fade));
                sparkColor *= brightness * fade * 2.0;

                fragColor = vec4(termColor.rgb + sparkColor, termColor.a);
                return;
            }
        }
    }

    fragColor = termColor;
}
