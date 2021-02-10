% This script is intended as a tool for Kinect skeleton data visualization,
% receiving as input a .txt file containing a 4-by-inf matrix in which the
% first column accounts for the timestamp of the joint data and the columns
% two to four for the xyz coordinates of the joints, in the order shown in
% the Kinect V2 joint ID map.
clear all;
clc;

%%
% Insert the path to the 'Dataset_Lab' folder on your computer.
cd = "C:\Users\Luca\Desktop\PoliMI\AS201920-1\Neuroengineering\DT_embodied_mirroring\DTembodiedmirroring\Dados\Dataset_lab";
% Subject, gesture and repetition selection
[filepath, filename] = filepath_builder(cd);
% The subject, gesture and repetition selected are displayed for control
% purposes.
disp(filename);

%%
% Extract joints' coordinates from the specified file.
% The function first scans the file to recognize lines containing 'None'
% instead of numerical values and then extract only valid data.
joints = data_extraction(filepath);
                                          
%%
% Plot the moving stickman
animation_velocity = 5; % <1 to slow down the video wrt default setting
                        % >1 to speed up the video wrt default setting
stickman_plot(joints, animation_velocity);
