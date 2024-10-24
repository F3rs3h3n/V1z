// Attractor Noise Generator Testing

// Stop All
s.freeAll;

// Best
(
{
var freq, amp, noiseMod;
var x = 10, y = 28, z = 8/3;
var dt = 0.01;

    // Lorenz Attractor parameters
    var a = 10, b = 28, c = 8/3;

    // Lorenz equations
    x = x + dt * (a * (y - x));
    y = y + dt * (x * (b - z) - y);
    z = z + dt * (x * y - c * z);

    // Lower frequency for a softer tone
    freq = 100 + (x * 5);  // Lower the base frequency to 100Hz
    amp = z.abs * 0.1;     // Amplitude modulation

    // Modulate PinkNoise amplitude with subtle noise
    noiseMod = LFNoise2.kr(0.5).range(0.9, 1.1);  // Noise modulation for amplitude variation

    // Stereo output: left and right channels with slight differences in pitch and noise modulation
    [SinOsc.ar(freq, 0, amp) + PinkNoise.ar(amp * noiseMod),
     SinOsc.ar(freq * 1.01, 0, amp * 0.9 * noiseMod) + PinkNoise.ar(amp * 0.9 * noiseMod)]

}.play;
)

// Basic
(
{
var freq, amp;
// Lorenz Attractor
var x = 10, y = 28, z = 8/3;
var dt = 0.01;
var a = 10, b = 28, c = 8/3;

    // Lorenz equations
    x = x + dt * (a * (y - x));
    y = y + dt * (x * (b - z) - y);
    z = z + dt * (x * y - c * z);

    // Modulate frequency and amplitude with Lorenz values
    freq = 200 + (x * 10);  // Scale to audible frequency
    amp = z.abs * 0.1;      // Scale amplitude

    // Create stereo output by duplicating signal for left and right channels
    [SinOsc.ar(freq, 0, amp) + PinkNoise.ar(amp),
     SinOsc.ar(freq * 1.01, 0, amp * 0.9) + PinkNoise.ar(amp * 0.9)]

}.play;
)

(
{
var freq, amp;
var x = 10, y = 28, z = 8/3;
var dt = 0.01;

    // Modulate parameters with LFO (low frequency oscillators)
    var a = (0.1).range(8, 12);  // Varies between 8 and 12
    var b = SinOsc.kr(0.07).range(25, 30); // Varies between 25 and 30
    var c = SinOsc.kr(0.05).range(2, 4);   // Varies between 2 and 4

    // Lorenz equations
    x = x + dt * (a * (y - x));
    y = y + dt * (x * (b - z) - y);
    z = z + dt * (x * y - c * z);

    // Modulate frequency and amplitude with Lorenz values
    freq = 200 + (x * 10);  // Scale to audible frequency
    amp = z.abs * 0.1;      // Scale amplitude

    // Stereo sound
    [SinOsc.ar(freq, 0, amp) + PinkNoise.ar(amp),
     SinOsc.ar(freq * 1.01, 0, amp * 0.9) + PinkNoise.ar(amp * 0.9)]

}.play;
)

// Progressive
(
{
var freq, amp;
var x = 10, y = 28, z = 8/3;
var dt = 0.01;

    // Use LFSaw for modulation
    var a = LFSaw.kr(0.1).range(8, 12);  // 0.1Hz のノコギリ波でモジュレーション
    var b = LFTri.kr(0.07).range(25, 30); // 三角波
    var c = LFNoise2.kr(0.05).range(2, 4); // 滑らかなノイズで変動

    // Lorenz equations
    x = x + dt * (a * (y - x));
    y = y + dt * (x * (b - z) - y);
    z = z + dt * (x * y - c * z);

    // Modulate frequency and amplitude with Lorenz values
    freq = 200 + (x * 10);
    amp = z.abs * 0.1;

    // Stereo sound
    [SinOsc.ar(freq, 0, amp) + PinkNoise.ar(amp),
     SinOsc.ar(freq * 1.01, 0, amp * 0.9) + PinkNoise.ar(amp * 0.9)]

}.play;
)

(
{
var freq, amp;
var x = 10, y = 28, z = 8/3;
var dt = 0.01;

    // Use small modulation range for pitch
    var a = SinOsc.kr(0.1).range(9.5, 10.5);  // ピッチの変動範囲を9.5から10.5に抑える
    var b = LFTri.kr(0.07).range(27, 29); // 小さな範囲での三角波変動
    var c = LFNoise2.kr(0.05).range(2.9, 3.1); // 小さな範囲で滑らかなノイズ変動

    // Lorenz equations
    x = x + dt * (a * (y - x));
    y = y + dt * (x * (b - z) - y);
    z = z + dt * (x * y - c * z);

    // Keep the pitch relatively constant (small changes only)
    freq = 200 + (x * 2);  // 小さなピッチ変動 (±2Hz)
    amp = z.abs * 0.5;     // 振幅を大きく変動させる

    // Stereo sound with minimal pitch modulation
    [SinOsc.ar(freq, 0, amp) + PinkNoise.ar(amp),
     SinOsc.ar(freq * 1.005, 0, amp * 0.9) + PinkNoise.ar(amp * 0.9)]

}.play;
)

(
{
var freq, amp;
var x = 10, y = 28, z = 8/3;
var dt = 0.01;

    // Lorenz Attractor
    var a = 10, b = 28, c = 8/3;

    // Lorenz equations
    x = x + dt * (a * (y - x));
    y = y + dt * (x * (b - z) - y);
    z = z + dt * (x * y - c * z);

    // Keep the frequency relatively stable
    freq = 200 + (x * 5);  // 小さな変動
    amp = z.abs * 0.1;     // 振幅を使った変動

    // Create stereo output by duplicating signal for left and right channels
    [SinOsc.ar(freq, 0, amp) + PinkNoise.ar(amp),
     SinOsc.ar(freq * 1.01, 0, amp * 0.9) + PinkNoise.ar(amp * 0.9)]

}.play;
)

(
{
var freq, amp, noiseMod;
var x = 10, y = 28, z = 8/3;
var dt = 0.01;

    // Lorenz Attractor parameters
    var a = 10, b = 28, c = 8/3;

    // Lorenz equations
    x = x + dt * (a * (y - x));
    y = y + dt * (x * (b - z) - y);
    z = z + dt * (x * y - c * z);

    // Frequency and amplitude
    freq = 200 + (x * 5);  // Small pitch variation
    amp = z.abs * 0.1;     // Amplitude modulation

    // Modulate PinkNoise amplitude with subtle noise
    noiseMod = LFNoise2.kr(0.5).range(0.9, 1.1);  // Noise modulation for amplitude variation

    // Stereo output: left and right channels with slight differences in pitch and noise modulation
    [SinOsc.ar(freq, 0, amp) + PinkNoise.ar(amp * noiseMod),
     SinOsc.ar(freq * 1.01, 0, amp * 0.9 * noiseMod) + PinkNoise.ar(amp * 0.9 * noiseMod)]

}.play;
)
