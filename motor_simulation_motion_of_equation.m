% clear
clc

% パラメータ
R = 2.9; % モータの内部抵抗 [Ω]
L = 0.0453; %モータのインダクタンス [H]
Jm = 0.141; % モータの慣性モーメント [g cm^2]
Jw = 0.2; % ホイールの慣性モーメント [g cm^2]
J = Jm + Jw; % ホイールとモータの慣性モーメント
D = 0; % 粘性減衰係数 [Nm/(rad/s)]
we = 2710 * 2*pi / 60; % 回転数定数 [rad/V]
ke = 1 / we; %起電力定数 [V/rad]
kt = 3.52e-3; %トルク定数 [Nm/A]

% 初期値
vm = 1; % 印加電圧 [V]

ve = 0; % 逆起電力 [V]
tm = 0; % モータトルク [Nm]

im = 0; % モータの電流 [A]
d_theta = 0; % モータの角速度 [rad/s]
theta = 0; % モータの角度

%シミュレーション初期化
dt = 0.001;
t = 0 : dt : 0.1;
i = 0;

store_im = [];
store_d_theta = [];
store_theta = [];

%シミュレーション
for n = t
    i = i + 1;

    d_im = (1 / L) * (vm - R * im - ke * d_theta);
    d_theta = (1 / J) * (kt * im - D * d_theta);
    
    im = im + d_im * dt;
    theta = theta + d_theta * dt;
    
    store_im = [store_im im];
    store_d_theta = [store_d_theta d_theta];
    store_theta = [store_theta theta];
end

figure(1)
subplot(2, 1, 1)
plot(t, store_im)
legend('im')
title('運動方程式のシミュレーション')

subplot(2, 1, 2)
plot(t, store_theta)
legend('theta')
title('運動方程式のシミュレーション')