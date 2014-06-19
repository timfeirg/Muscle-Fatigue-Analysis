function spectrum_analysis(signal,frequency)
% see plot_fft.m
figure
subplot(211)
signal_fft=abs(fftshift(fft(signal)));
frequency_bins=-frequency/2:frequency/(length(signal)-1):frequency/2;
plot(frequency_bins,signal_fft);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('{\bf 0-Centered Spectrum}');
subplot(212)
% power spectrum
signal_sp = 10*log10(abs(signal_fft).^2);
plot(frequency_bins,signal_sp);
title('Power Spectrum Using Linear Scale')
xlabel('Frequency (MHz)')
ylabel('Relative Amplitude (linear)')

freq_sum = cumsum(signal_sp);
index=find(freq_sum>=freq_sum(end)/2,1);
median_freq=frequency_bins(index);
% draw a vertical line to mark up median freq
hx = graph2d.constantline(median_freq, 'LineStyle','-.', 'Color',[1 0 0]);
changedependvar(hx,'x');