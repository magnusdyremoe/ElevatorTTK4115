IMU2 = [];
encoder2 =  [];
for i=1:length(IMU.signals.values)
    if (~isnan(IMU.signals.values(i)))
        IMU2 = [IMU2; IMU.signals.values(i, :)];
        encoder2 = [encoder2; encoder.signals.values(i, :)];
    end
end