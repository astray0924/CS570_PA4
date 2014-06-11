function onebyone( data )
%ONEBYONE Summary of this function goes here
%   Detailed explanation goes here

%% this function is already fully implemented
nClass = 3;
svms = cell(nClass, 1);

for i = 1:nClass    
    [localData, sup, w0, w] = svmonebyone(data, i, mod(i, nClass) + 1);
    svms{i}.data    = localData;
    svms{i}.sup     = sup;
    svms{i}.w       = w;
    svms{i}.w0      = w0;
end    

% draw plots and points and lines
drawfinalpicture(data,svms);

end

