IMU2 = [];
encoder2 =  [];
for i=1:length(IMU.signals.values)
    if (~isnan(IMU.signals.values(i)))
        IMU2 = [IMU2; IMU.signals.values(i, :)];
        encoder2 = [encoder2; encoder.signals.values(i, :)];
    end
end

covar1 = cov(IMU2(:, 1), encoder2(:, 1))
covar2 = cov(IMU2(:, 2), encoder2(:, 2))
covar3 = cov(IMU2(:, 3), encoder2(:, 3))
covar4 = cov(IMU2(:, 4), encoder2(:, 4))
covar5 = cov(IMU2(:, 5), encoder2(:, 5))