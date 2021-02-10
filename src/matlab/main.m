%% Define the old data location and the location for the new data
% change these to match your "input" and "output" folders for the files
db_with_cuts = "C:\Users\aless\Desktop\Gesture_recognition\db_with_cuts\";
processed_data_X = "C:\Users\aless\Desktop\Gesture_recognition\final_db\X\";
processed_data_Y = "C:\Users\aless\Desktop\Gesture_recognition\final_db\Y";

% sets the number of frames per file (1 frame = 1/25 sec)
nFrames = 125;
% set data augmentation (0/1)
DA_mirror = 1;
SNR = 30;

% gen member names
% Hardocded (but actually fixed in any case)
members = ["Alessio" "Alexa" "Andrea" "Benedetta" "Debora" "Federica" ...
           "Federico" "Giorgio" "Giovanni" "Hossein" "Luca" "Marco" ...
           "Mattia" "Raffaele" "RiccardoA" "RiccardoDV" "Rosanna" "Sara"];

% Generate and save the new database "online" + labels file by file
% starts from the old one
% (new cuts and files deleted supported)

% keeps count of how many gestures (per gesture) were already processed
% (it's a pretty global cyan variable)
global counts
counts = struct('ciao',1,'piccolo',1,'puntare',1,'random',1,'si',1,'vieni',1);
tic
for i = 1:length(members) % one cycle per member
    path_old = db_with_cuts+members(i)+'\';
    listing = dir(path_old);
    filenames = {listing.name};
    filenames = filenames(3:end); % pure filenames in an array of strings
    % saves on the HDD the new data at the new location
    % must return the count of the processed files 
    savedata(filenames, path_old, processed_data_X, nFrames, SNR, DA_mirror);
    disp(counts);
end
toc

% Get labels from the new dataset and save them in a .txt
listing = dir(processed_data_X);
filenames = {listing.name};
filenames = filenames(3:end);
labels = split(filenames, '_');
labels = string(labels(:, :, 1))';
writematrix(labels, processed_data_Y+'\labels.txt');
