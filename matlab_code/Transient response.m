% Transient response graph
figure('Color','w');

plot(t, y, 'b', 'LineWidth', 1.8);
hold on;
yline(reference, '--r', 'Reference = 1000');
xline(1, ':k', 'Reference step at 1 s');

grid on;
xlabel('Time (s)');
ylabel('Motor Speed (RPM)');
title('Transient Response of DC Motor PID Control');

legend('Actual Speed', 'Reference Speed', ...
    'Step Time', 'Location', 'best');

% Display measured performance metrics
txt = sprintf(['Rise Time: %.6f s\n' ...
    'Settling Time: %.6f s\n' ...
    'Overshoot: %.4f%%'], ...
    info.RiseTime, info.SettlingTime, info.Overshoot);

annotation('textbox', [0.17 0.65 0.25 0.16], ...
    'String', txt, 'FitBoxToText', 'on', ...
    'BackgroundColor', 'white');

saveas(gcf, '02_Transient_Response.png');
