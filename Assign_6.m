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
xlabel('f [HZ]');
ylabel("Signal, DB");


% #3
H = @(z) 
