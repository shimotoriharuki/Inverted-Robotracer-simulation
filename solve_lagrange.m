clear
clc

%%% 車輪のエネルギ %%%
syms t x_w(t) y_w(t) r_w theta_p(t) theta_w(t) m_w J_w

%車軸の位置
f_x_w = x_w == r_w * (theta_p + theta_w); 
f_y_w = y_w == 0; 

%車軸の速度
df_x_w = diff(f_x_w, t);
df_y_w = diff(f_y_w, t);

%車輪の並進方向のエネルギ
K_w1 = (1/2) * m_w * df_x_w^2 + (1/2) * m_w * df_y_w^2;

%車輪の回転方向のエネルギ
K_w2 = (1/2) * J_w * (diff(theta_p, t) + diff(theta_w, t))^2;

%車輪の位置エネルギ
U_w = 0;

%%% 振子のエネルギ %%%
syms r_p x_p(t) y_p(t) m_p J_p g

%振子の重心位置
f_x_p = f_x_w + r_p * sin(theta_p);
f_y_p = r_p * cos(theta_p);

%振子の重心速度
df_x_p = diff(f_x_p, t);
df_y_p = diff(f_y_p, t);

%振子の重心の並進方向のエネルギ
K_p1 = (1/2) * m_p * df_x_p^2 + (1/2) * m_p * df_y_p^2;

%振子の重心の回転方向のエネルギ
K_p2 = (1/2) * J_p * diff(theta_p, t)^2;

%振子の重心の位置エネルギ
U_p = m_p * g * y_p;

%ラグランジアン
L = (K_w1 + K_w2 + K_p1 + K_p2) - (U_w - U_p);

%振子の角度theta_pに関するラグランジュの運動方程式
del_L_dtheta_p = diff(L, diff(theta_p, t));
del_L_theta_p = diff(L, theta_p);
f_p = diff(del_L_dtheta_p, t) - del_L_theta_p == 0;
f_p = simplify(f_p);
% latex(f_p);

%車輪の角度theta_wに関するラグランジュの運動方程式
syms tau_w
del_L_dtheta_w = diff(L, diff(theta_w, t));
del_L_theta_w = diff(L, theta_w);
f_w = diff(del_L_dtheta_w, t) - del_L_theta_w == tau_w;
f_w = simplify(f_w);
% latex(f_w);

%tau_wにモータの式を代入
syms n J_m k_t k_e R V t_m_dash
f_w = subs(f_w, tau_w, -n^2 * J_m * diff(diff(theta_w, t), t) ...
    - n^2 * (k_t * k_e / R) * diff(theta_w, t)) ...
    + n * (k_t / R) * (V - (R / k_t) * t_m_dash);
f_w = simplify(f_w);
% latex(f_w);

%線形化
f_p = subs(f_p, sin(theta_p(t)), 0);
f_p = subs(f_p, cos(theta_p(t)), 1);

f_w = subs(f_w, sin(theta_p(t)), 0);
f_w = subs(f_w, cos(theta_p(t)), 1);

%係数をまとめる
f_p = collect(f_p, diff(diff(theta_p, t))); %ddtheta_p
f_p = collect(f_p, diff(diff(theta_w, t))); %ddtheta_w
f_p = collect(f_p, theta_p); %theta_p

f_w = collect(f_w, diff(diff(theta_p, t))); %ddtheta_p
f_w = collect(f_w, diff(diff(theta_w, t))); %ddtheta_w
f_w = collect(f_w, theta_p); %theta_p


latex(f_p)
latex(f_w)