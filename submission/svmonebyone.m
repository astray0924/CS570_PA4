function [ data, sup, w0, w ] = svmonebyone( data, num1, num2 )
% SVMONEBYONE Summary of this function goes here
%   Detailed explanation goes here

% data : data that used for this function
% w : w vector
% w0 : w0 vector
% sup : index of support vector

%% this function is svm one by one function (you can easily make this by using svm)
N = size(data, 1);
filtered_data = [];
for i = 1:N
   d = data(i, :); 
   
   if (d(3) == num1) || (d(3) == num2)
      filtered_data = [filtered_data ; d];
   end
end

[data, sup, w0, w] = svm(filtered_data, num1);
end

