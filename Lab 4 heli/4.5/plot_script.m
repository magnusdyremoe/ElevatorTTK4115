%Pitch
figure(1);
plot(pitch_imu.time, pitch_imu.signals.values)
hold on;
plot(pitch_encoder.time, pitch_encoder.signals.values);
title('Pitch')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Pitch');
hold off;

%Elevation
figure(2)
plot(elevation_imu.time, elevation_imu.signals.values)
hold on;
plot(elevation_encoder.time, elevation_encoder.signals.values);
title('Elevation')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Elevation');
hold off;

%Travel
figure(3)
plot(travel_imu.time, travel_imu.signals.values)
hold on;
plot(travel_encoder.time, travel_encoder.signals.values);
title('Travel')
legend('IMU', 'Encoder');
xlabel('Time');
ylabel('Travel');
hold off;