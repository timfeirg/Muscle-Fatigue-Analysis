function spectrum_analysis(signal,frequency)
% see plot_fft.m
figure
subplot(211)
signal_fft=fftshift(fft(signal));
frequency_bins=-frequency/2:frequency/(length(signal)-1):frequency/2;
plot(frequency_bins,abs(signal_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('{\bf 0-Centered Spectrum}');
subplot(212)
% power spectrum
signal_sp = 10*log10(signal_fft.^2);
plot(frequency_bins,signal_sp);
title('Power Spectrum Using Linear Scale')
xlabel('Frequency (MHz)')
ylabel('Relative Amplitude (linear)')
duration=size(signal,1);
freq_sum = cumsum(signal_sp(duration/2:end));
index=find(freq_sum>=freq_sum(end)/2,1);
median_freq=frequency_bins(duration-index);
% draw a vertical line to mark up median freq
hx = graph2d.constantline(median_freq, 'LineStyle','-.', 'Color',[1 0 0]);
changedependvar(hx,'x');