SA = [10 15 20 25 30];

Vel = 1;

t = 1:0.00500000000010914:10;

for s = 1:length(SA)
    % No steer
    velocity_in = Vel*ones(1,length(t));
    velocity_in = velocity_in';
    data1 = [t'  velocity_in];
    steering_angle = zeros(1,length(t));
    steering_angle = steering_angle';
    data2 = [t' steering_angle];
    clear steer
    clear no_steer
    clear out
    
    out = sim('Simulation',t)
    no_steer = out.withComp;
    
    % steer
    velocity_in = Vel*ones(1,length(t));
    velocity_in = velocity_in';
    data1 = [t'  velocity_in];
    steering_angle = zeros(1,length(t));
    steering_angle(1:end) = SA(s)*pi/180;
    steering_angle = steering_angle';
    data2 = [t' steering_angle];

    clear out
    out = sim('Simulation',t)
    steer = out.withComp;
    
    figure;plot(no_steer.Time, no_steer.Data)
    hold on;
    plot(steer.Time,steer.Data,'r'); grid;
    title('Angle:',num2str(SA(s)*pi/180));
    legend('No steer','steer');
    
end

