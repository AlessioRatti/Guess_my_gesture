function matrix = data_extraction(filepath)
% Solution of Akira Agata from 'Trouble importing similar .txt files using 
% readtable (error: all lines must have the same number of delimiters)'

% The selected file is open
file_id = fopen(filepath,'r');

% Read data
str = textscan(file_id,'%s','Delimiter','\r');
str = str{1};
fclose(file_id);
% Delete the lines which starts with 'None'
idx = startsWith(str,'None');
str(idx) = [];
% Split each column and convert to double
matrix = (str2double(split(str)))';

end