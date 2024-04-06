clc; clear; close all;
% Q1.a

n = 0:127;
x = cos(2*pi*7/128*n) + cos(2*pi*5/128*n);
y1 = x .* cos(2*pi*50/128*n); % y1[n] = x[n]cos(2pi*50n/128)

% DTFT of y1[n]
w = linspace(0, 2*pi, 1024); % 0 to 2pi with 1024 points
Y1 = zeros(1, 1024);
for k = 1:1024
    Y1(k) = sum(y1 .* exp(-1j*w(k)*n)); % sigma(y1[n]*exp(-j(2pik/1024)*n))
end

% DFT of y1[n]
Y1_dft = fft(y1, 128);

% Plots for y1[n]
figure;
subplot(2, 1, 1);
plot(w, abs(Y1));
xlabel('Frequency');
ylabel('Magnitude');
title('DTFT of y1[n]');

subplot(2, 1, 2);
stem(2*pi*(0:127)/128, abs(Y1_dft)); % 2pi*k/N
xlabel('Frequency'); % 2pi*k/N
ylabel('Magnitude'); 
title('DFT of y1[n]');

% Q1.b
n = 0:255;
x = cos(2*pi*7/128*n) + cos(2*pi*5/128*n); % x[n] = cos(2pi*7n/128) + cos(2pi*5n/128)
y = x .* cos(2*pi*50/128*n); % y[n] = x[n]cos(2pi*50n/128)
y2 = [y(1:180), zeros(1, 76)]; % y2[n] = y[n] for n = 0 to 179, 0 for n = 180 to 255

% DTFT of y2[n]
Y2 = zeros(1, 1024);
for k = 1:1024
    Y2(k) = sum(y2 .* exp(-1j*w(k)*n)); % sum(y2[n]*exp(-jw*n))
end

% DFT of y2[n]
Y2_dft = fft(y2, 256);

% Plots for y2[n]
figure;
subplot(2, 1, 1);
plot(w, abs(Y2));
xlabel('Frequency');
ylabel('Magnitude');
title('DTFT of y2[n]');

subplot(2, 1, 2);
stem(2*pi*(0:255)/256, abs(Y2_dft));
xlabel('Frequency'); % 2pi*k/N
ylabel('Magnitude');
title('DFT of y2[n]');