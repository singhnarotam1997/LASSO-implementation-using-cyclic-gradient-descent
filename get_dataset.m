function [ data ] = get_dataset( foldername )
% returns the data train as well as th test data
% the last column of the data contains the labels

% fid = fopen([foldername '\ticdata2000.txt'], 'r');
% % crate a string with as many %d as you need
% fmt = [repmat('%f', 1, 86)];
% buffer = textscan(fid, fmt, 'Delimiter', ' ');
% train_data = [buffer{1:end}];
% fclose(fid);
% 
% fid = fopen([foldername '\ticeval2000.txt'], 'r');
% % crate a string with as many %d as you need
% fmt = [repmat('%f', 1, 85)];
% buffer = textscan(fid, fmt, 'Delimiter', ' ');
% test_data = [buffer{1:end}];
% fclose(fid);
% 
% fid = fopen([foldername '\tictgts2000.txt'], 'r');
% % crate a string with as many %d as you need
% fmt = [repmat('%f', 1,1)];
% buffer = textscan(fid, fmt, 'Delimiter', ' ');
% test_data =[test_data [buffer{1:end}]];
% fclose(fid);
%################################
% fid = fopen([foldername 'wpbc.data'], 'r');
% % crate a string with as many %d as you need
% fmt = ['%f,' '%c,'  repmat('%f,', 1,31) '%f'];
% buffer = textscan(fid,'%[^\n]');
% fclose(fid);
% data={};
% for i=1:size(buffer{1},1)
% data=[data;textscan(buffer{1}{i},fmt)];
% end
% train_data=data;
% test_data=data;
%#################################
% train_data=dlmread([foldername 'blogData_train.csv'],',',0,0);
% 
% test_data=train_data;
fid=fopen('abalone.data');
buffer= textscan(fid,'%[^\n]');
s=['%c,' repmat('%f,',1,8)];
data=[];
for i=1:size(buffer{1},1)
data=[data;textscan(buffer{1}{i},s)];
end
clc
k=1;
new=[];
for i=1:4177
if data{i,1}=='M'
new(k,:)=[1,0,0];
elseif data{i,1}=='I'
new(k,:)=[0,1,0];
elseif data{i,1}=='F'
new(k,:)=[0,0,1];
end
k=k+1;
end
data=[new, cell2mat(data(:,2:end))];
clc


end

