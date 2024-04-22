% SPDX-License-Identifier: MIT License
%
% Assign_8.m
% Copyright (C) 2024  Vaibhav Hariani <vaibhav.hariani@cooper.edu>

clc;
clear;
close all;

syms Ic Is Vbe Vt Ae Nb Wb Dn ni q;

eqn1 = Ic == Is * exp(Vbe / Vt);
Is = solve(eqn1, Is);
eqn2 = Is == (Ae * q * Dn * ni^2) / (Nb * Wb);
Ae = solve(eqn2, Ae);

syms R C Vc(t) Vs(t);
eqn3 = R * C * diff(Vc, t) + Vc == Vs;
ySol(t) = dsolve(eqn3);

digitsOld = digits(floor(1000 * pi));
mu_0 = vpa(4 * pi * 10e-7);
digits(digitsOld);
