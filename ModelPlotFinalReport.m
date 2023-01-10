v = [0 0.4645 0.832 1.195 1.76 2.58];
Fs = [0 0.987 1.98 2.95 3.95 4.965];

figure; plot(v,Fs); grid on; xlabel('velocity(m/s)');ylabel('Friction Force Fs(N)');
title('Straight Line Friction Model')

% Fs = compute_straight_fric(v,lin);
lin = 1;
Steer_angle = [10 15 20 25 30]*pi/180;

Ft = [1.16 1.23 1.316 1.41 1.5184];
Fd = Ft - compute_straight_fric(0.4645,lin);

figure;plot(Steer_angle,Fd,'s','MarkerSize',14); grid on; xlabel('Steer Angle (rad)'); ylabel('Fdelta');
title('Friction due to steering angle')
hold on;

Ft = [2.356363636 2.468571429 2.728421053 2.88 3.049411765];
Fd = Ft - compute_straight_fric(0.832,lin);
plot(Steer_angle,Fd,'x','MarkerSize',14);

Ft = [3.475 3.790909091 3.971428571 4.276923077 4.508108108];
Fd = Ft - compute_straight_fric(1.195,lin);
plot(Steer_angle,Fd,'^','MarkerSize',14);


Ft = [4.8 5.067 5.3647 5.7 6.08];
Fd = Ft - compute_straight_fric(1.76,lin);
plot(Steer_angle,Fd,'o','MarkerSize',14);

Ft = [5.8 6.327272 6.96 7.326315 7.733];
Fd = Ft - compute_straight_fric(2.58,lin);
plot(Steer_angle,Fd,'*','MarkerSize',14);

legend('vel = 1','vel = 2','vel = 3','vel = 4','vel = 5')
