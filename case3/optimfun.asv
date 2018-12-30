function F = optimfun(param, b, modelName)

set_param([modelName '/V1'], 'Value', num2str(param(1)));
set_param([modelName '/K12'], 'Value', num2str(param(2)));
set_param([modelName '/K21'], 'Value', num2str(param(3)));
set_param([modelName '/K13'], 'Value', num2str(param(4)));
set_param([modelName '/K31'], 'Value', num2str(param(5)));
set_param([modelName '/K22'], 'Value', num2str(param(6)));
t = 0:1:36;
[t, x, simulatedData] =sim(modelName, t);

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