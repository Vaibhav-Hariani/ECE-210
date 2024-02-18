% SPDX-License-Identifier: MIT License
%
% mud.m -- Solution to the first problem set for
% ECE210 in the Spring of 2024
% Copyright (C) 2024 Vaibhav Hariani <vaibhav.hariani@cooper.edu>

u = [-4:2:4];
v = [0:pi / 4:pi];
f = prod(1:9);
A = zeros(2, 4);
A(1, 1) = 1;
A(2, 3) = 1;
B = reshape(reshape([1:16], [2, 8])', [4, 4]);

a = (1:2:101)';
t = linspace(-pi, pi, 1000);

s = sum(sin(a .* t) ./ a);
plot(t, s);
