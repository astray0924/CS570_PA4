function [ data, sup, w0, w ] = svm( data, num )
%SVM Summary of this function goes here
%   Detailed explanation goes here

% data : data that used for this function
% w : w vector
% w0 : w0 vector
% sup : index of support vector

%% argument num
% class1 : if num == data(:, 3)
% class2 : if num ~= data(:, 3)
% if data has the same class as num argument, it is considered as a class 1
% else, data has the different class number with num argument, it is
% considered as a class 2

%% Code
N = size(data, 1);
M = size(data, 2) - 1;
modified_data = [];

% data preprocessing
for i = 1:N
   row = data(i, :);
    
   if num == row(3)
       row(3) = 1;
   else
       row(3) = -1;
   end
   
   modified_data(i, :) = row;
end

% perform optimization
H = [eye(M) zeros(M, 1); zeros(M, 1)' 0];
f = zeros(M+1, 1);
X = modified_data(:, 1:2);
Y = modified_data(:, 3);
A = -diag(Y)*[X ones(N, 1)];
c = -ones(N, 1);

opts = optimoptions('quadprog', 'Algorithm', 'active-set', 'Display', 'off');
result = quadprog(H, f, A, c, [], [], [], [], [], opts);

% return the results
% data = data;
w = result(1:2);
w0 = result(3);

sup_vals = [];
for j = 1:N
   sup_vals(j, 1) = Y(j)*(w'*X(j, :)' + w0);
end

sup = find((sup_vals - 1) <= 0.0001);

end

