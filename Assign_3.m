% SPDX-License-Identifier: MIT License
%
% Assign_3.m -- Assignment 03
% Copyright (C) 2024  Vaibhav Hariani <vaibhav.hariani@cooper.edu>

clc;
clear;
close all;

ITERATIONS = 1e6;
CREWMATES = 6;
ROUNDS = 12;
CREWMATE_SIDES = 4;
IMPOSTER_ROLLS = 2;
IMPOSTER_SIDES = 2;

rng(0x73757300);
% #1
sus = sum(randi(IMPOSTER_SIDES,IMPOSTER_ROLLS,ITERATIONS));
crewmates = randi(CREWMATE_SIDES,CREWMATES,ITERATIONS);
targets = randi(CREWMATES,ROUNDS,ITERATIONS);

% #2
% This was confusing at first, but it makes sense now
kills = zeros(size(crewmates));
rowmat = targets(:);
colmat = repmat(1:ITERATIONS, ROUNDS, 1);
colmat = colmat(:);
ind = sub2ind(size(kills),rowmat,colmat);
kills(ind) = 1;

%% #3
dead = (sus > crewmates) & kills;
survivors = ~dead;

%% #4
remaining = sum(survivors);
losses = remaining <= 1;
loss_rate = mean(losses);

%% Alternative definition in a single line
%% loss_rate = mean(sum(survivors) <= 1);