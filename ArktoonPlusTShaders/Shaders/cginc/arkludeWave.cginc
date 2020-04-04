// 波のタイプと経過時間より-1.0から1.0の値を返す
float getWave(int type, float time, sampler2D map) {
    switch (type) {
        // コサイン波
        case 1:
            return cos(time * 2.0 * 3.14);
        // 三角波
        case 2:
            return abs(time - 0.5) * 4.0 - 1.0;
        // 矩形波
        case 3:
            return time >= 0.5 ? 1.0 : -1.0;
        // ノコギリ波
        case 4:
            return time * 2.0 - 1.0;
        // カスタム波
        case 5:
            return tex2Dlod(map, float4(time,0,0,0)).r * 2.0 - 1.0;
        default:
            return 1.0;
    }
}

// 小数点をできる限り切り捨て
float ceilDecimal(float value, float power) {
    float digit = pow(10.0, power);
    return round(value * digit) / digit;
}

// UnisonMapの値の返却
int floatToInt(float value, int divide) {
    if (value >= 1.0) {
        return divide - 1;
    } else {
        return int(floor(value * float(divide)));
    }
}

// 線形補間
float linearstep(float a, float b, float x) {
  float t = clamp(((x - a)/(b - a)), 0.0, 1.0) ;
  return t;
}

// バイアス
float bias(float x, float y) {
    return pow(x, log(y) / log(0.5));
}

// ゲイン
float gain(float x, float y) {
    float g = 1.0 - y;
    if (x < 0.5) {
        return bias(1.0 - g, 2.0 * x) / 2.0;
    } else {
        return 1.0 - bias(1.0 - g, 2.0 - 2.0 * x) / 2.0;
    }
}
