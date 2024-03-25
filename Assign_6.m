% SPDX-License-Identifier: MIT License
%
% Assign_5.m -- Assignment 06
% Copyright (C) 2024  Vaibhav Hariani <vaibhav.hariani@cooper.edu>

clc;
clear;
close all;

fs = 96*10.^3;
% #1
db2mag = @(x) 10.^(x./ 20);

% #2
T = 1/fs;
num_samples = 192 * 10.^3;
t = ((0:num_samples - 1) * T); 

freqs = [-20.48*10.^3; -360; 996; 19.84*10.^3];
db_mags = [14;-10;0;2];
mags = db2mag(db_mags);
comp_term = exp(1j * 2 * pi * (freqs .* t));
s = sum(mags .* comp_term);
noise = db2mag(-10) * randn(size(s));
s = s + noise;
S = fftshift(fft(s));

figure;
plot(fs / num_samples * (-1 / 2:1 / 2-1), mag2db(S));
xlabel('frequency, (HZ)');
ylabel("Signal, (dB)");

% #3
numerator = [0.76 + 0.64j; 0.69 + 0.71j; 0.87 + 0.57j;];
numerator = [numerator; conj(numerator)];
denominator = [0.57j + 0.78j; 0.85 + 0.48j; 0.24; 0.64];
denominator = [denominator; conj(denominator)];

[num,den] = zp2tf(numerator,denominator,0.53);
freqs_filter = [0, fs/2, 10.^3];
H = freqz(num,den,fs);
H_dB = mag2db(abs(H));
H_ph = unwrap(angle(H));

figure;
zplane(numerator, denominator);

figure;
sgtitle("Response Plots");

subplot(2,1,1);
plot(freqs_filter,H_dB);
title("Magnitude Response of Filter");
xlim([0,freqs_filter(end)]);
xlabel("Frequency, (HZ)");
ylabel("Magnitude, (dB)");

subplot(2,1,2);
plot(freqs_filter, H_ph);
title("Phase Response of Filter");
xlim([0,freqs_filter(end)]);
xlabel("Frequency, (HZ)");
ylabel("Phase, (rad)");
