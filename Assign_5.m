% SPDX-License-Identifier: MIT License
%
% Assign_5.m -- Assignment 05
% Copyright (C) 2024  Vaibhav Hariani <vaibhav.hariani@cooper.edu>

clc;
clear;
close all;

% #1
ip = @(x,y) sum(x.*conj(y));
ip_norm =@(x) sqrt(ip(x,x));

% #4
S = [1, 2+3j, -1 + 7j;
     1j  , 3j,  6 + 10j;
     2-1j, 1-1j, 11 - 4j;
     -1 ,  2j,  3 + 4j; 
];
S = [i, 0, 0;
    0, i, 0;
    0, i, i];

U = gram_schmidt(S,ip,ip_norm);
orthogonal = zeros(size(U));
for head = 1:size(orthogonal,2)
    for loop= 1:size(orthogonal,2)
        orthogonal(head,loop) = ...
        isorthogonal(U(:,head),U(:,loop),ip);
    end
end




% #2
function out_mat = gram_schmidt(mat,prod,norm)
    proj_u_v = @(u,v) u.* (prod(u,v)/norm(u)^2);
    out_mat = zeros(size(mat));
    for col = 1:size(out_mat,2)
        out_mat(:,col) = mat(:,col);
        for back_col = 1:(col-1)
            out_mat(:,col) = out_mat(:,col) - proj_u_v(out_mat(:,back_col),out_mat(:,col));
        end
    end
    out_mat = out_mat ./ norm(out_mat);
end

% #3
function out = isorthogonal(v1,v2,prod)
    out = prod(v1,v2) - eps(prod(v1,v2)) <= 0;
end
