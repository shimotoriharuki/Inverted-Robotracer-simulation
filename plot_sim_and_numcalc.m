figure(1)
tiledlayout(2, 2)
nexttile
plot(t, x1);
title('$\theta_p$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角度 [rad]")
ylim([-0.6 0.01])

nexttile
plot(t, x2);
title('$\dot{\theta_{p}}$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角速度 [rad/s]")

nexttile
plot(t, x3);
title('$\theta_w$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角度 [rad]")

nexttile
plot(t, x4);
title('$\dot{\theta_w}$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角速度 [rad/s]")

sgtitle("状態方程式の数値計算シミュレーション結果")

figure(2)
x1_sim = out.simout.Data(:, 1);
x2_sim = out.simout.Data(:, 2);
x3_sim = out.simout.Data(:, 3);
x4_sim = out.simout.Data(:, 4);
tt = out.simout.Time;

tiledlayout(2, 2)
nexttile
plot(tt, x1_sim);
title('$\theta_p$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角度 [rad]")

nexttile
plot(tt, x2_sim);
title('$\dot{\theta_{p}}$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角速度 [rad/s]")

nexttile
plot(tt, x3_sim);
title('$\theta_w$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角度 [rad]")

nexttile
plot(tt, x4_sim);
title('$\dot{\theta_w}$', 'Interpreter', 'latex')
xlabel("時間 [s]")
ylabel("角速度 [rad/s]")

sgtitle("Simscapeのシミュレーション結果")

