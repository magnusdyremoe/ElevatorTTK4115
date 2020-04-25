IMU = [];
encoder = [];
for i=1:length(IMU_bus.signals.values)
    if (~isnan(IMU_bus.signals.values(i)))
        IMU = [IMU; IMU_bus.signals.values(i, :)];
        encoder = [encoder; encoder_bus.signals.values(i, :)];
    end
end

IMU(:, 5) = [];
encoder(:, 5) = [];

R = cov(IMU)