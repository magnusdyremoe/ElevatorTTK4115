%Kjør saveFirstValues først!

accelerometerNoise2 = [];
for i=1:length(accelerometer_bus.signals.values)
    if (~isnan(accelerometer_bus.signals.values(i)))
        accelerometerNoise2 = [accelerometerNoise2; accelerometer_bus.signals.values(i, :)];
    end
end

if (length(accelerometerNoise1) > length(accelerometerNoise2))
    accelerometerNoise1 = accelerometerNoise1(1:length(accelerometerNoise2), :);
else
    accelerometerNoise2 = accelerometerNoise2(1:length(accelerometerNoise1), :);
end


%accelerometerNoise1
%accelerometerNoise2

covar1 = cov(accelerometerNoise1(:, 1), accelerometerNoise2(:, 1))
covar2 = cov(accelerometerNoise1(:, 2), accelerometerNoise2(:, 2))
covar3 = cov(accelerometerNoise1(:, 3), accelerometerNoise2(:, 3))
covar4 = cov(accelerometerNoise1(:, 4), accelerometerNoise2(:, 4))
covar5 = cov(accelerometerNoise1(:, 5), accelerometerNoise2(:, 5))