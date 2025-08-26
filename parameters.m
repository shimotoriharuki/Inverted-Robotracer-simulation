

m_w= 16e-3; % ホイールの重さ [kg]
m_p= 348e-3; % 振子の重さ [kg]
r_w= 30.5e-3; % ホイールの半径 [m]
r_p= 83e-3; % 振子の重心までの距離 [m]
J_w= 12.5e-6; % ホイールとタイヤのイナーシャ[kg m^2]
J_p= 1.117e-3; % 振子のイナーシャの半分[kg m^2]
J_m= 1.51e-8; % モータの回転子のイナーシャ[kg m^2]
g= 9.8; % 重力加速度 [m/s^2]
n= 6; % 減速比
kt= 3.52e-3; %トルク定数 [Nm/A]
kn= 2710; % 回転数定数[rpm/V] 2710 410
ke= 60 / (kn* 2*pi); %起電力定数 [V/(rad/s)]
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

center_distance = 0.02;
