function [filepath, filename] = filepath_builder(cd)
names = {'Alessio','Alexa','Andrea','Benedetta','Debora','Federica',...
        'Federico','Giorgio','Giovanni','Hossein','Luca','Marco',...
        'Mattia','Raffaele','RiccardoA','RiccardoDV','Rosanna','Sara'};
gestures = {'ciao','piccolo','puntare','si','vieni','random'};
% consider adding controls on the existence of the selected subject/
% /gesture_repetition combination.
repetition = int2str((1:14)');

% Each subject performs one of the listed movement 14 times (file number 0
% is used as a checker of the system functioning and provides no useful
% info). The menus below let the user choose subject, gesture and
% repetition.
[name_index, ~] = listdlg('ListString',names,'PromptString',{'Select a folder.',...
                         'Only one folder can be selected at time.',''},...
                         'SelectionMode','single');
[gest_index, ~] = listdlg('ListString',gestures,'PromptString',{'Select a gesture.',...
                         'Only one gesture can be selected at time.',...
                         'Be sure to choose an existing movement for the selected subject',...
                         ''},'SelectionMode','single');                   
[rep_index, ~] = listdlg('ListString',repetition,'PromptString',{'Select an execution of the movement.',...
                         'Only one trial can be selected at time.',''},...
                         'SelectionMode','single');
                     
% The following conditions avoid errors caused by the different length of 1
% and 2 digits numbers.

if rep_index < 10
    filepath = fullfile(cd,names(name_index),(strcat(gestures(gest_index),...
              "_",repetition(rep_index,2),".txt")));
    filename = strcat(names(name_index),"\",gestures(gest_index),...
              "_",repetition(rep_index,2),".txt");
else
    filepath = fullfile(cd,names(name_index),(strcat(gestures(gest_index),...
              "_",repetition(rep_index,:),".txt")));
    filename = strcat(names(name_index),"\",gestures(gest_index),...
              "_",repetition(rep_index,:),"txt");
end

end