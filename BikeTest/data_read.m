clear all; close all;
% Input the file name here
M = readmatrix('straight_line_high_speed.csv');

% Select one of below
TURN = 0;
STRAIGHT = 1;
% If straight is 1, select one of below for high speed or slow speed
SLOW = 0;
HIGH = 1;
%%
m = 30;
fork_angle = 70;


% Select the bias according to file name
%%
if(STRAIGHT)
    if(SLOW)
        bias = 0.095+0.08; % straight_line_slow_speed
    elseif(HIGH)
        bias = 0.17; % straight_line_high_speed
    end
elseif(TURN)
    bias = 0.22; % Turn2
end

%%
win = 100;
if(TURN)
    M = M(3239:end,:); % turn 2
end
time = M(:,1);
steer_angle = M(:,2);
gyro_x = M(:,3);
gyro_y = M(:,4);
gyro_z = M(:,5);
acc_x = movmean(M(:,6),win)-bias;
acc_y = movmean(M(:,7),win);
acc_z = movmean(M(:,8),win);

%%
vel_x =  cumtrapz(time,acc_x);
vel_y =  cumtrapz(time,acc_y);

speed = compute_accumulative(vel_x,vel_y);


%%
figure;plot(time,steer_angle*pi/180);grid on; hold on;
plot(time,acc_x); grid on;
plot(time,vel_x); grid on;
legend('SA(rad)','accx','velx'); title('Data from Bike'); xlabel('Time')
%%
if(TURN)

%turn2
s = 1951;
e = 2450;

SA = steer_angle(s:e)*pi/180;
SA_eff = SA*sind(fork_angle);
acc = acc_x(s:e);
vel = vel_x(s:e);
Ft = -m*acc;
Fs = 1.3015*vel;
Fd = Ft-Fs;
% figure;plot(steer_angle(s:e)*pi/180,[acc_x(s:e) vel_x(s:e)]);grid on;
% xlabel('SA(rad)');legend('accx','velx');grid on; title('SA vs accX, Turn3')
% figure; plot(abs(SA_eff),[Ft Fs Fd]); grid on;
% legend('Ftotal','Fstraight','Fdelta'); xlabel('Steering Angle (rad)');
% ylabel('Friction Forces (N)'); title('Compute Fdelta: Test 3')

% This figure is used in simulation verification
figure;plot(abs(SA_eff),vel_x(s:e),'LineWidth',2);grid on;xlabel('|\delta_{eff}| (rad)');
ylabel('velocity (m/s)'); title('Turn Test: Velocity vs Steering Angle')

% Final figure for turn test in report. Turn2 is used
figure; plot(abs(SA_eff),Fd,'*','LineStyle','None'); grid on;
legend('Fdelta'); xlabel('|\delta_{eff}| (rad)');
ylabel('F_{\delta} (N)'); title('Model for Turn friction force')
end

%%
if(STRAIGHT)
% Select the interval according to chosen file
if(SLOW)
%slow speed
    s = 5687;
    e = 6295;
elseif(HIGH)
    s = 3616;
    e = 4317;
end

figure; plot(vel_x(s:e),-m*acc_x(s:e),'*');grid on;xlabel('velocity (m/s)');
ylabel('Fstraight');title('Straight Tests')
end