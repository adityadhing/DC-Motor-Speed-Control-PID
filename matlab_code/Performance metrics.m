% Performance metrics table
metrics = {
    'Rise Time (s)', info.RiseTime;
    'Settling Time (s)', info.SettlingTime;
    'Percentage Overshoot (%)', info.Overshoot
};

fig = figure('Color','w', 'Position',[300 300 560 220]);
uitable(fig, ...
    'Data', metrics, ...
    'ColumnName', {'Performance Parameter','Measured Value'}, ...
    'Units','normalized', ...
    'Position',[0.05 0.15 0.90 0.75], ...
    'ColumnWidth',{240 180});

sgtitle('DC Motor PID Performance Metrics');

saveas(fig, '04_Performance_Metrics.png');
    