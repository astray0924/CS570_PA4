function [ output_args ] = drawfinalpicture( data, svms )
%DRAWFINALPICTURE Summary of this function goes here
%   Detailed explanation goes here

%% this function is already fully implemented
drawdata(data)

axis([min(data(:, 1))-1 max(data(:, 1))+1 min(data(:, 2))-1 max(data(:, 2))+1])

hold on;
for i = 1:size(svms, 1) 
    localData   = svms{i, 1}.data;
	sup         = svms{i, 1}.sup;
    w           = svms{i, 1}.w;
    w0          = svms{i, 1}.w0;
    
    plot(localData(sup, 1), localData(sup, 2), 'o', 'color', 'magenta');
    
    line(data(:, 1), -w(1, 1)*data(:, 1) / w(2, 1) - w0 / w(2, 1))
end
hold off;
