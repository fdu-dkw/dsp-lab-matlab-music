%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% -- DSP大作业（选做部分） --
%
% 作者：复旦大学 微电子学院 2022级 邓开文
%
% 原曲：Funky Stars
% 链接：https://www.bilibili.com/video/BV1X4411h7Vt
%       https://modarchive.org/index.php?request=view_by_moduleid&query=66187
% 简介：“植物大战僵尸”游戏修改器的背景音乐，被评为最受欢迎的Keygen音乐。
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 计算
A  = 880 * 2 .^ ((-5:2) +  0/12);
As = 880 * 2 .^ ((-5:2) +  1/12);
B  = 880 * 2 .^ ((-5:2) +  2/12);
C  = 880 * 2 .^ ((-6:1) +  3/12);
Cs = 880 * 2 .^ ((-6:1) +  4/12);
D  = 880 * 2 .^ ((-6:1) +  5/12);
Ds = 880 * 2 .^ ((-6:1) +  6/12);
E  = 880 * 2 .^ ((-6:1) +  7/12);
F  = 880 * 2 .^ ((-6:1) +  8/12);
Fs = 880 * 2 .^ ((-6:1) +  9/12);
G  = 880 * 2 .^ ((-6:1) + 10/12);
Gs = 880 * 2 .^ ((-6:1) + 11/12);

fs = 44100; % 采样率
ticklen = 5089; % 节拍长度（130bpm）
melodylen = 32; % 每段旋律长度，相当于原曲半个pattern

% 主旋律1
a1 = [ ...
    Gs(6), Gs(6), 0    , 0    , Fs(7), Fs(7), 0    , 0    , ...
    Ds(7), Ds(7), 0    , 0    , 0    , 0    , E(7) , E(7) , ...
    0    , 0    , 0    , 0    , E(7) , E(7) , 0    , 0    , ...
    Cs(7), Cs(7), 0    , 0    , Fs(7), Fs(7), 0    , 0    , ...
    ];
a2 = [ ...
    0    , 0    , Ds(7), Ds(7), 0    , Gs(7), Gs(7), 0    , ...
    0    , 0    , As(7), As(7), 0    , 0    , 0    , 0    , ...
    Gs(6), Gs(6), 0    , 0    , 0    , Ds(7), Ds(7), 0    , ...
    0    , 0    , Ds(7), Ds(7), 0    , Gs(7), Gs(7), 0    , ...
    ];
a3 = [ ...
    0    , 0    , 0    , 0    , 0    , 0    , Gs(6), Gs(6), ...
    0    , 0    , 0    , 0    , B(7) , B(7) , 0    , 0    , ...
    0    , 0    , E(7) , E(7) , 0    , 0    , B(6) , B(6) , ...
    0    , 0    , 0    , 0    , 0    , 0    , Gs(6), Gs(6), ...
    ];
a4 = [ ...
    Gs(6), Gs(6), 0    , 0    , Fs(7), Fs(7), 0    , 0    , ...
    Ds(7), Ds(7), 0    , 0    , 0    , 0    , Cs(8), Cs(8), ...
    0    , 0    , 0    , 0    , As(7), As(7), 0    , 0    , ...
    Cs(7), Cs(7), 0    , 0    , Fs(7), Fs(7), 0    , 0    , ...
    ];
a5 = [ ...
    0    , 0    , Ds(7), Ds(7), 0    , Gs(7), Gs(7), 0    , ...
    0    , 0    , As(7), As(7), 0    , 0    , 0    , 0    , ...
    Gs(6), Gs(6), 0    , 0    , 0    , Ds(7), Ds(7), 0    , ...
    0    , 0    , Ds(7), Ds(7), 0    , As(7), As(7), 0    , ...
    ];
a6 = [ ...
    0    , 0    , 0    , 0    , 0    , 0    , Gs(6), Gs(6), ...
    0    , 0    , 0    , 0    , B(7) , B(7) , 0    , 0    , ...
    0    , 0    , Gs(7), Gs(7), 0    , 0    , Fs(7), Fs(7), ...
    0    , 0    , 0    , 0    , 0    , 0    , B(7) , B(7) , ...
    ];

% BASS
b1 = [Gs(3), Gs(4) * ones(1, melodylen-1)];
b2 = Gs(4) * ones(1, melodylen);
b3 = [Gs(4), Gs(5) * ones(1, melodylen-1)];
b4 = Gs(5) * ones(1, melodylen);
b5 = [Gs(5), Gs(6) * ones(1, melodylen-1)];
bvols = [ones(1, (melodylen-8) * ticklen), linspace(1, 0, 8 * ticklen)];
b6 = [ ...
    Gs(4), Gs(4), 0    , 0    , 0    , 0    , Gs(5), Gs(5), ...
    Gs(4), Gs(4), 0    , Gs(4), Gs(4), 0    , Ds(5), 0    , ...
    E(5) , E(5) , 0    , 0    , E(5) , 0    , Cs(5), Cs(5), ...
    Cs(5), 0    , Cs(5), Cs(5), Cs(5), 0    , Fs(5), 0    , ...
    ];
b7 = [ ...
    Gs(4), Gs(4), 0    , 0    , 0    , 0    , Gs(5), Gs(5), ...
    Gs(4), Gs(4), 0    , Gs(4), Gs(4), 0    , Ds(5), 0    , ...
    E(5) , E(5) , 0    , 0    , E(5) , 0    , Fs(5), Fs(5), ...
    Fs(5), 0    , Fs(5), Fs(5), Fs(5), 0    , Ds(5), 0    , ...
    ];

% 滴滴滴音
cv1 = linspace(1, 0, ticklen);
cv2 = .1 * ones(1, ticklen);
cv3 = ones(1, ticklen);
cvols = [ ...
    cv1, cv1, cv2, cv3, cv1, cv1, cv3, cv2, ...
    cv2, cv1, cv1, cv2, cv3, cv1, cv3, cv2, ...
    cv1, cv1, cv2, cv3, cv1, cv1, cv3, cv2, ...
    cv2, cv1, cv1, cv2, cv3, cv1, cv3, cv2, ...
    ];
cduty1 = [ ...
    .50, .50, .50, .50, .54, .54, .54, .54, ...
    .54, .58, .58, .58, .58, .62, .62, .62, ...
    .62, .66, .66, .66, .66, .70, .70, .70, ...
    .70, .70, .74, .74, .74, .74, .78, .78, ...
    ];
cduty2 = [ ...
    .78, .78, .82, .82, .82, .82, .86, .86, ...
    .86, .86, .86, .90, .90, .90, .94, .94, ...
    .94, .94, .94, .94, .90, .90, .90, .90, ...
    .90, .86, .86, .86, .82, .82, .82, .82, ...
    ];
cduty3 = [ ...
    .78, .78, .78, .78, .74, .74, .74, .74, ...
    .74, .82, .82, .82, .82, .86, .86, .86, ...
    .90, .90, .90, .94, .94, .94, .90, .90, ...
    .90, .90, .90, .86, .86, .86, .82, .82, ...
    ];
cduty4 = [ ...
    .82, .78, .78, .78, .74, .74, .70, .70, ...
    .70, .70, .70, .66, .66, .66, .66, .62, ...
    .62, .62, .58, .58, .58, .54, .54, .54, ...
    .54, .50, .50, .50, .54, .58, .58, .58, ...
    ];

% 鼓点
d1 = [ ...
    1, 0, 2, 0, 3, 0, 1, 0, ...
    1, 0, 2, 0, 3, 0, 2, 3, ...
    1, 0, 2, 0, 3, 0, 2, 0, ...
    1, 1, 2, 1, 3, 0, 2, 3, ...
    ];
d2 = [ ...
    1, 0, 2, 0, 3, 0, 1, 0, ...
    1, 0, 2, 0, 3, 0, 2, 3, ...
    1, 0, 2, 0, 3, 0, 2, 0, ...
    1, 1, 2, 1, 3, 3, 2, 3, ...
    ];

% 静音旋律
silence = zeros(1, melodylen * ticklen);

% 主旋律前半截，三角波，低八度
melody0 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody0(ns) = melody0(ns) + trianglewave(a1(i)/2, ns, fs) / 3 ...
        + trianglewave(a2(i)/2, ns, fs) / 3 ...
        + trianglewave(a3(i)/2, ns, fs) / 3;
end

% 主旋律，三角波
melody1 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody1(ns) = melody1(ns) + trianglewave(a1(i), ns, fs) / 3 ...
        + trianglewave(a2(i), ns, fs) / 3 ...
        + trianglewave(a3(i), ns, fs) / 3;
end
melody2 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody2(ns) = melody2(ns) + trianglewave(a4(i), ns, fs) / 3 ...
        + trianglewave(a5(i), ns, fs) / 3 ...
        + trianglewave(a6(i), ns, fs) / 3;
end

% 主旋律，正弦波
melody3 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody3(ns) = melody3(ns) + sinwave(a1(i), ns, fs) / 3 ...
        + sinwave(a2(i), ns, fs) / 3 ...
        + sinwave(a3(i), ns, fs) / 3;
end
melody4 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody4(ns) = melody4(ns) + sinwave(a4(i), ns, fs) / 3 ...
        + sinwave(a5(i), ns, fs) / 3 ...
        + sinwave(a6(i), ns, fs) / 3;
end

% 方波bass，嗡嗡音
melody5 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody5(ns) = squarewave(b1(i)/2, ns, fs);
end
melody6 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody6(ns) = squarewave(b2(i)/2, ns, fs);
end
melody7 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody7(ns) = (squarewave(b2(i)/2, ns, fs) ...
        + squarewave(b3(i)/2, ns, fs));
end
melody8 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody8(ns) = (squarewave(b2(i)/2, ns, fs) ...
        + squarewave(b4(i)/2, ns, fs) ...
        + squarewave(b5(i)/2, ns, fs)) .* bvols(ns);
end

% 三角波bass
melody9 = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melody9(ns) = trianglewave(b6(i)/2, ns, fs);
end
melodyA = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melodyA(ns) = trianglewave(b7(i)/2, ns, fs);
end

% 方波滴滴滴
melodyB = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melodyB(ns) = squarewave(Gs(6), ns, fs, cduty1(i)) .* cvols(ns);
end
melodyC = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melodyC(ns) = squarewave(Gs(6), ns, fs, cduty2(i)) .* cvols(ns);
end
melodyD = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melodyD(ns) = squarewave(Gs(6), ns, fs, cduty3(i)) .* cvols(ns);
end
melodyE = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1) * ticklen + (1:ticklen);
    melodyE(ns) = squarewave(Gs(6), ns, fs, cduty4(i)) .* cvols(ns);
end

% 鼓点
kick = linspace(1, 0, ticklen);
melodyF = zeros(1, melodylen * ticklen);
melodyF((melodylen - 4) * ticklen + (1:ticklen * 2)) ...
    = melodyF((melodylen - 4) * ticklen + (1:ticklen * 2)) + noise(2 * ticklen) .* [kick kick];
melodyG = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1)*ticklen + (1:ticklen);
    switch d1(i)
        case 1
            melodyG(ns) = (sinwave(F(3), ns, fs) * 18 + 0.1 * noise(ns)) .* kick;
        case 2
            melodyG(ns) = (sinwave(C(4), ns, fs) + 2*noise(ns)) .* kick;
        case 3
            melodyG(ns) = 2*noise(ns) .* kick;
        otherwise
    end
end
melodyH = zeros(1, melodylen * ticklen);
for i = 1:melodylen
    ns = (i - 1)*ticklen + (1:ticklen);
    switch d2(i)
        case 1
            melodyH(ns) = (sinwave(F(3), ns, fs) * 18 + 0.1 * noise(ns)) .* kick;
        case 2
            melodyH(ns) = (sinwave(C(4), ns, fs) + 2*noise(ns)) .* kick;
        case 3
            melodyH(ns) = 2*noise(ns) .* kick;
        otherwise
    end
end

% 组合
leading = zeros(1, ticklen);
ending = zeros(1, 10*ticklen);
ch0 = 0.4*[leading melody0 melody0 silence silence silence silence silence silence silence silence ending]; % 三角波主旋律，intro，有混响
for i = ticklen+1:length(ch0) % 混响
    ch0(i) = ch0(i) + 0.3*ch0(i-ticklen);
end
ch1 = 0.2*[leading silence silence melody1 melody1 melody1 melody2 melody1 melody1 melody1 melody2 ending]; % 三角波主旋律
ch2 = 0.2*[leading silence silence silence silence silence silence melody3 melody3 melody3 melody4 ending]; % 正弦波主旋律
ch3 = 0.008*[leading silence silence melody5 melody6 melody7 melody8 silence silence silence silence ending]; % 方波bass
ch4 = 0.2*[leading silence silence silence silence silence silence melody9 melodyA melody9 melodyA ending]; % 三角波bass
ch5 = 0.04*[leading silence silence melodyB melodyC melodyD melodyE melodyB melodyC melodyD melodyE ending]; % 方波滴滴滴
ch6 = 0.01*[leading silence silence silence silence silence melodyF melodyG melodyH melodyG melodyH ending]; % 噪波鼓点
result = ch0 + ch1 + ch2 + ch3 + ch4 + ch5 + ch6;
for i = length(result)-length(ending):length(result) % 结尾再混响一次
    result(i) = result(i) + 0.5*result(i-ticklen);
end

%% 输出
audiowrite('Funky_Stars_20241209_dkw.wav', result, fs);
% sound(result, fs);

%% 辅助函数
function y = sinwave(f, n, fs) % 正弦波
if isscalar(n)
    t = (0 : n - 1) / fs;
else
    t = n / fs;
end
y = sin(2 * pi * f * t);
end

function y = squarewave(f, n, fs, duty) % 方波
if nargin < 4
    duty = 0.5;
end
if isscalar(n)
    t = (0 : n - 1) / fs;
else
    t = n / fs;
end
period = 1 / f;
high_duration = period * duty;
y = (t - floor(t / period) * period < high_duration) * 2 - 1;
end

function y = trianglewave(f, n, fs) % 三角波
if isscalar(n)
    t = (0 : n - 1) / fs;
else
    t = n / fs;
end
period = 1 / f;
y = 2 * abs(mod(t / period, 1) - 0.5) - 1;
end

function y = sawtoothwave(f, n, fs) % 锯齿波，没用上
if isscalar(n)
    t = (0 : n - 1) / fs;
else
    t = n / fs;
end
period = 1 / f;
y = 2 * mod(t / period, 1) - 1;
end

function y = noise(n) % 噪波
if isscalar(n)
    y = randn(1, n) * 2 - 1;
else
    y = randn(size(n)) * 2 - 1;
end
end