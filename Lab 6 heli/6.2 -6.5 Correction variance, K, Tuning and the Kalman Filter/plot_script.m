kalman = kalman_bus.signals.values;
encoder = encoder_bus.signals.values;
time = kalman_bus.time;
%for i = 1:length(kalman_bus.time)
%    kalman = [kalman; kalman_bus.signals.values(i, :)];
%    encoder = [encoder; encoder_bus.signals.values(i, :)];
%    time = [time; accelerometer_bus.time(i)];
%end

%Travel
figure(1);
plot(time, kalman(:, 1))
hold on;
plot(time, encoder(:, 1));
title('Travel')
legend('Kalman', 'Encoder');
xlabel('Time');
ylabel('Travel');
hold off;

%Travel rate
figure(2);
plot(time, kalman(:, 2))
hold on;
plot(time, encoder(:, 2));
title('Travel rate')
legend('Kalman', 'Encoder');
xlabel('Time');
ylabel('Travel rate');
hold off;

%Pitch
figure(3);
plot(time, kalman(:, 3))
hold on;
plot(time, encoder(:, 3));
title('Pitch')
legend('Kalman', 'Encoder');
xlabel('Time');
ylabel('Pitch');
hold off;

%Pitch rate
figure(4);
plot(time, kalman(:, 4))
hold on;
plot(time, encoder(:, 4));
title('Pitch rate')
legend('Kalman', 'Encoder');
xlabel('Time');
ylabel('Pitch rate');
hold off;

%Elevation
figure(5);
plot(time, kalman(:, 5))
hold on;
plot(time, encoder(:, 5));
title('Elevation')
legend('Kalman', 'Encoder');
xlabel('Time');
ylabel('Elevation');
hold off;

%Elevation rate
figure(6);
plot(time, kalman(:, 6))
hold on;
plot(time, encoder(:, 6));
title('Elevation rate')
legend('Kalman', 'Encoder');
xlabel('Time');
ylabel('Elevation rate');
hold off;
