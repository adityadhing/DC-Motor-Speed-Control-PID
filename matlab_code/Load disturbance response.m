% Load disturbance response
loadSpeedData = out.loadSpeedData;

tLoad = loadSpeedData(:,1);
yLoad = loadSpeedData(:,2);

figure('Color','w');
plot(tLoad, yLoad, 'b', 'LineWidth', 1.8);
hold on;
yline(1000, '--r', 'Reference Speed');

grid on;
xlabel('Time (s)');
ylabel('Motor Speed (RPM)');
title('DC Motor Speed Response Under Load Disturbance');
legend('Actual Speed', 'Reference Speed', ...
    'Location', 'best');

saveas(gcf, '03_Load_Disturbance_Response.png');
