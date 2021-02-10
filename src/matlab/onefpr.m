function [newformat] = onefpr(Kformat)
% Change the sample from 25 rows per frame to 1 row per frame
% the input is the raw data from a file recorded with the Kinect (time
% included)
Kformat = transpose(Kformat); % time along the columns
Kformat(isnan(Kformat))=[]; % remove Nones
Kformat = reshape(Kformat, 4, []); % 4 rows, [] columns (initial format but transposed)
Kformat = Kformat(2:4,:); % remove first row (timestamp)
newformat = reshape(Kformat, 75, [])';  % 75 columns, [] rows (desired format)
end
