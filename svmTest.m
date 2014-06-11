% this script will be used to grade your homework
% you can also check your results with this function

warning off;

filename = 'data.dat';
delimiter = ' ';
headersIn = 1;

data_dat = importdata('data.dat', delimiter, headersIn);
data = data_dat.data;

onebyone(data);
onebyall(data);




