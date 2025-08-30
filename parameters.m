
m_w= 33e-3; % ホイールの重さ [kg]
m_p= 193e-3; % 振子の重さ [kg]
r_w= 33e-3; % ホイールの半径 [m]
r_p= 70e-3; % 振子の重心までの距離 [m]
J_w= 0.477e-4; % ホイールのイナーシャ
J_p= 6.498e-4; % 振子のイナーシャ ??
J_m= 0.151e-7; % モータの回転子のイナーシャ
g= 9.8; % 重力加速度 [m/s^2]
n= 6; % 減速比
kt= 3.52e-3; %トルク定数 [Nm/A]
kn= 2710; % 回転数定数[rpm/V]
ke= 1 / (kn* 2*pi / 60); %起電力定数 [V/(rad/s)]
R= 2.9; %内部抵抗 [Ω]
t_md = 0; % 摩擦トルク[Nm]
V_offset = R * t_md / kt;
L = 0.045e-3; % 端子間インダクタンス[H]
Tm = 5.45e-3; % 定動トルク[Nm]
Nm = 12000; % 無負荷回転数 [rpm]
V = 4.5; % 定格電圧[V]

ground.dimensions = [1, 1, 0.01];

chassis.dimensions = [r_p/8, r_p, r_p*2];
tire.geometry.radius = r_w;
tire.geometry.length = 0.01;


spur_gear.geometry.radius = 0.01;
spur_gear.geometry.length = 0.005;

pinion_gear.geometry.radius = 0.005;
pinion_gear.geometry.length = 0.005;

% center_distance = spur_gear.geometry.radius+pinion_gear.geometry.radius;
center_distance = 0.02;
