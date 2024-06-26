% clear
clc

% パラメータ
R = 2.9; % モータの内部抵抗 [Ω]
L = 0.01; %モータのインダクタンス [H]
Jm = 0.1; % モータの慣性モーメント [g cm^2]
Jw = 0.1; % ホイールの慣性モーメント [g cm^2]
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
d_omega = 0; % モータの角速度 [rad/s]
omega = 0; % モータの角度

%シミュレーション初期化
dt = 0.001;
t_end = 0.1;
t = 0 : dt : t_end;
i = 0;

store_im = [];
store_d_omega = [];
store_omega = [];
store_theta = [];

%シミュレーション
for n = t
    i = i + 1;

    d_im = (1 / L) * (vm - R * im - ke * d_omega);
    d_omega = (1 / J) * (kt * im - D * d_omega);
    
    im = im + d_im * dt;
    omega = omega + d_omega * dt;
    theta = theta + omega * dt;
    
    store_im = [store_im im];
    store_d_omega = [store_d_omega d_omega];
    store_omega = [store_omega omega];
    store_theta = [store_theta theta];
end

figure(1)
subplot(4, 1, 1)
plot(t, store_im)
legend('im')
title('運動方程式のシミュレーション')

subplot(4, 1, 2)
plot(t, store_d_omega)
legend('d_omega')
title('運動方程式のシミュレーション')

subplot(4, 1, 3)
plot(t, store_omega)
legend('omega')
title('運動方程式のシミュレーション')

subplot(4, 1, 4)
plot(t, store_theta)
legend('theta')
title('運動方程式のシミュレーション')
