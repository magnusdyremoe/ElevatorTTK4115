accelerometer = [];
encoder = [];
time = [];
for i = 1:length(accelerometer_bus.time)
    if (~isnan(accelerometer_bus.signals.values(i,1)))
        accelerometer = [accelerometer; accelerometer_bus.signals.values(i, :)];
        encoder = [encoder; encoder_bus.signals.values(i, :)];
        time = [time; accelerometer_bus.time(i)];
    end
end

%Pitch rate
figure(1);
plot(time, accelerometer(:, 1))
hold on;
plot(time, encoder(:, 1));
title('Pitch rate')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Pitch rate');
hold off;

%Elevation rate
figure(2);
plot(time, accelerometer(:, 2))
hold on;
plot(time, encoder(:, 2));
title('Elevation rate')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Elevation rate');
hold off;

%Travel rate
figure(3);
plot(time, accelerometer(:, 3))
hold on;
plot(time, encoder(:, 3));
title('Travel rate')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Travel rate');
hold off;

%Pitch
figure(4);
plot(time, accelerometer(:, 4))
hold on;
plot(time, encoder(:, 4));
title('Pitch')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Pitch');
hold off;

%Elevation
figure(5);
plot(time, accelerometer(:, 5))
hold on;
plot(time, encoder(:, 5));
title('Elevation')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Elevation');
hold off;
