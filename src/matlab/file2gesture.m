function [gestures] = file2gesture(filenames)
% from an array of filenames extract the corresponding gestures
gestures = strings(length(filenames),1); % preallocate the array for the gestures of a member
for i=1:length(filenames)
    name = split(filenames(i), '_'); % split the filename on the underscores
    gestures(i) = name(1); % keep only the first element (gesture)
end
end