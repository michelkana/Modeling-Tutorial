% simulate the Simulink model for 500 sec using 0.0109 time step.
% returns the SA node action potentials in the vector ActionPotentials
[t, x, ActionPotentials] =sim('HodkinHuxley_ecg', 0:0.0109:500);

% plot the action potentials
figure(2);
subplot(3,1,1)
plot(ActionPotentials)
title('Action Potentials');
hold on

% detect the highest global maxima, i.e. the biggest potential
index=0;
max=-100;
for i=1:1:length(ActionPotentials)
    if(ActionPotentials(i)>max)
        max=ActionPotentials(i);
        index=i;
    end
end
max=ActionPotentials(index);
limit=0.6*max;

% detect action potential picks
% a pick is the highest local maxima which is bigger than 60% of the
% highest global maxima
j=1;
for i=1:1:length(ActionPotentials)
    if(ActionPotentials(i)>limit)
        if(ActionPotentials(i-1)<ActionPotentials(i) && ActionPotentials(i)>ActionPotentials(i+1))
            peaks(j)=i;
            j=j+1;
        end
    end
end;

% calculate the heart rate in beats/min as 60 divided by the difference
% value of consecutive picks in seconds
hr = (60/1000)* diff(peaks);

% plot heart rate
subplot(3,1,2);
plot(hr);
title('Heart Rate');

% generate a synthetic 256 Hz ECG signal for the mean of heart rates
[s, ipeaks] = ecgsyn(256,256,0,mean(hr));

% plot the ECG signal
subplot(3,1,3);
plot(s(256:256*length(hr)));
title('Electrocardiogram');
