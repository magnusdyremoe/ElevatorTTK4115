%Pitch, pitch rate
figure(1);
plot(encoder_bus.time, encoder_bus.signals.values(:, 1)) %Pitch
hold on;
plot(estimator_bus.time, estimator_bus.signals.values(:, 1)); %Pitch
hold on;
plot(encoder_bus.time, encoder_bus.signals.values(:, 2)); %Pitch rate
hold on;
plot(estimator_bus.time, estimator_bus.signals.values(:, 2)); %Pitch rate
title('Pitch, pitch rate')
legend('Pitch encoder', 'Pitch estimator', 'Pitch rate encoder', 'Pitch rate estimator');
xlabel('Time');
ylabel('Pitch, pitch rate');
hold off;

%Elevation, elevation rate
figure(2);
plot(encoder_bus.time, encoder_bus.signals.values(:, 3)) %Elevation
hold on;
plot(estimator_bus.time, estimator_bus.signals.values(:, 3)); %Elevation
hold on;
plot(encoder_bus.time, encoder_bus.signals.values(:, 4)); %Elevation rate
hold on;
plot(estimator_bus.time, estimator_bus.signals.values(:, 4)); %Elevation rate
title('Elevation, elevation rate')
legend('Elevation encoder', 'Elevation estimator', 'Elevation rate encoder', 'Elevation rate estimator');
xlabel('Time');
ylabel('Elevation, elevation rate');
hold off;

%Travel, travel rate
figure(3);
plot(encoder_bus.time, encoder_bus.signals.values(:, 5)) %Travel
hold on;
plot(estimator_bus.time, estimator_bus.signals.values(:, 5)); %Travel
hold on;
plot(encoder_bus.time, encoder_bus.signals.values(:, 6)); %Travel rate
hold on;
plot(estimator_bus.time, estimator_bus.signals.values(:, 6)); %Travel rate
title('Travel, travel rate')
legend('Travel encoder', 'Travel estimator', 'Travel rate encoder', 'Travel rate estimator');
xlabel('Time');
ylabel('Travel, travel rate');
hold off;