%% DC Motor PID - Performance Analysis

% Extract high-resolution simulation data
t = out.speed.time;
y = squeeze(out.speed.signals.values);

t = t(:);
y = y(:);

% Remove duplicate timestamps
[t, idx] = unique(t, 'last');
y = y(idx);

% Reference and step time from your simulation
reference = 1000;
stepTime = 0.5;

% Analyse response after the reference step
idx = t >= stepTime;
tResponse = t(idx) - stepTime;
yResponse = y(idx);

% Calculate performance metrics
info = stepinfo(yResponse, tResponse, reference, ...
    'SettlingTimeThreshold', 0.02);

% Steady-state error using the final 5% of samples
n = numel(yResponse);
nTail = max(1, ceil(0.05*n));
finalSpeed = mean(yResponse(end-nTail+1:end));
steadyStateError = reference - finalSpeed;

% Display results
fprintf('\nDC MOTOR PID PERFORMANCE\n');
fprintf('Rise Time: %.6f s\n', info.RiseTime);
fprintf('Settling Time: %.6f s\n', info.SettlingTime);
fprintf('Overshoot: %.4f %%\n', info.Overshoot);
fprintf('Final Speed: %.4f\n', finalSpeed);
fprintf('Steady-State Error: %.4f\n', steadyStateError);

% Plot response
figure('Color','w');
plot(t, y, 'b', 'LineWidth', 1.5);
hold on;
yline(reference, '--r', 'Reference = 1000');
xline(stepTime, ':k', 'Step at 0.5 s');
grid on;

xlabel('Time (s)');
ylabel('Motor Speed (verify units)');
title('DC Motor PID Speed Response');
legend('Actual Speed', 'Reference', 'Step Time', ...
    'Location','best');

% Save graph in the results folder, if it exists
resultsFolder = fullfile(fileparts(pwd), ...
    '02_Results_and_Graphs');

if isfolder(resultsFolder)
    exportgraphics(gcf, ...
        fullfile(resultsFolder,'02_Transient_Response.png'));
    fprintf('\nTransient response graph saved successfully.\n');
else
    fprintf('\nResults folder not found. Save the graph manually.\n');
end
