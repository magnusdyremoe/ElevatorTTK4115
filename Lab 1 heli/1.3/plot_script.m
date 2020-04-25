%Pitch
figure(1);
plot(pitch.time, pitch.signals.values)
hold on;
plot(pitch_encoder.time, pitch_encoder.signals.values);
title('Pitch')
legend('Model', 'Encoder');
xlabel('Time');
ylabel('Pitch');
hold off;

%Elevation
figure(2)
plot(elevation.time, elevation.signals.values)
hold on;
plot(elevation_encoder.time, elevation_encoder.signals.values);
title('Elevation')
legend('Model', 'Encoder');
xlabel('Time');
ylabel('Elevation');
hold off;

%Travel
figure(3)
plot(travel.time, travel.signals.values)
hold on;
plot(travel_encoder.time, travel_encoder.signals.values);
title('Travel')
legend('Model', 'Encoder');
xlabel('Time');
ylabel('Travel');
hold off;