%SPDX-License-Identifier: MIT License
%
% mud.m -- Solution to the first problem set for 
% ECE210 in the Spring of 2024
% Copyright (C) 2024 Vaibhav Hariani <vaibhav.hariani@cooper.edu>

u = [11, 13, 17];

v = [-1; 
    -1; 
    -1];

A = [-1*u; 
    2*u; 
    7*u];

B = [A.', v];
c = exp((j * pi)/4);
d = sqrt(j);
l = floor((8.4108 * 10^6)^2.1);
k = floor(100*log(2)) + ceil(exp(7.5858));

A_1 = [1, -11, -3;
    1, 1, 0;
    2, 5, 1];
b = [-37;
    -1;
    10];
%I would like to make it clear that this feels... wrong.
sol = (A_1\b);
