function fatigue_analysis(filename)
% This function does the whole deal
close all;
% first import data
frequency = 1000;
hugeData = lvm_import(filename);
hugeData = hugeData.Segment1.data;
time = hugeData(:,1);
volts = hugeData(:,2);
clear hugeData

%perform a truncation over all data
figure(1)
clf
plot(volts);
title('preview')
[x, y] = ginput;
x = floor(x); clear y;
time = time(x(1):x(end));
volts = volts(x(1):x(end));

% calculate and plot
duration=size(time,1);
median_frequency=[];
for i=1:1000:duration-999
    subplot(211)
    median_temp=psd_analysis(volts(1:i+999),frequency);
    median_frequency=[median_frequency median_temp];
    subplot(212)
    plot(median_frequency,'--rs');
    hold on;
    pause(.01)
end
hold off;
plot(time(1:1000:duration-999),median_frequency,'--rs')
title('median frequency across the action')
xlabel('time/s')
ylabel('frequency/Hz')
saveas(gca,strcat(filename,'_median.png'));
close all;

% plot signal on time domain
figure(2)
subplot(211)
plot(time,volts)
title('Time Domain')
xlabel('time/s')
ylabel('volts/mV')
% RMS
volts_RMS=[];
subplot(212)
for i=1:1000:duration-999
    volts_power=volts.^2;
    rms_sample=sum(volts_power(i:i+999))/(time(i+999)-time(i));
    volts_RMS=[volts_RMS rms_sample];
end
plot(time(1:1000:duration-999),volts_RMS,'--rs')
title('RMS')
xlabel('time/s')
saveas(gca,strcat(filename,'_RMS.png'));

close all