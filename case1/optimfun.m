function F = optimfun(param, b, modelName)

set_param([modelName '/V1'], 'Value', num2str(param(1)));
set_param([modelName '/K11'], 'Gain', num2str(param(2)));

[t, x, simulatedData] =sim(modelName, 0:0.5:12);

F = b - simulatedData;

figure(1);
subplot 212;
cla;
plot(b, 'r.');
hold on;
plot(simulatedData);
hold off;
ylim([min(b) max(b)]);

pause(0.3);