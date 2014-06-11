function [ output_args ] = drawdata( data )
%DRAWDATA Summary of this function goes here
%   Detailed explanation goes here
%% this function is already fully implemented

figure;
hold on;
for i = 1:size(data, 1)
    color = zeros(1, 3);
    color(1, data(i, 3)) = 1;
    plot(data(i, 1), data(i, 2), 'o', 'Color', color)
end
hold off;





end


