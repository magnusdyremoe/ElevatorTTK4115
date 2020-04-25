
function ret = troll(IMU_flying, encoder_flying)
    imu = IMU_flying;
    enc = encoder_flying;

    %imu nedover
    %enc bortover
    hei = [cov(imu(:, 1), enc(:, 1)'), cov(imu(:, 1), enc(:, 2)'), cov(imu(:, 1), enc(:, 3)'), cov(imu(:, 1), enc(:, 4)'), cov(imu(:, 1), enc(:, 5)');
     cov(imu(:, 2), enc(:, 1)'), cov(imu(:, 2), enc(:, 2)'), cov(imu(:, 2), enc(:, 3)'), cov(imu(:, 2), enc(:, 4)'), cov(imu(:, 2), enc(:, 5)');
     cov(imu(:, 3), enc(:, 1)'), cov(imu(:, 3), enc(:, 2)'), cov(imu(:, 3), enc(:, 3)'), cov(imu(:, 3), enc(:, 4)'), cov(imu(:, 3), enc(:, 5)');
     cov(imu(:, 4), enc(:, 1)'), cov(imu(:, 4), enc(:, 2)'), cov(imu(:, 4), enc(:, 3)'), cov(imu(:, 4), enc(:, 4)'), cov(imu(:, 4), enc(:, 5)');
     cov(imu(:, 5), enc(:, 1)'), cov(imu(:, 5), enc(:, 2)'), cov(imu(:, 5), enc(:, 3)'), cov(imu(:, 5), enc(:, 4)'), cov(imu(:, 5), enc(:, 5)')];
    
    ret = [];
    for i = 1:5
        for j = 1:5
           ret(i, j) = hei(2*i, 2*j-1); 
        end
    end
end