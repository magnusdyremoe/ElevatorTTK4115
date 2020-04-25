%Pitch
figure(1);
plot(x_imu.time, x_imu.signals.values)
hold on;
plot(y_imu.time, y_imu.signals.values)
hold on;
plot(z_imu.time, z_imu.signals.values)
title('Accelerometer')
legend('x', 'y', 'z');
xlabel('Time');
ylabel('Accelerometer');
hold off;