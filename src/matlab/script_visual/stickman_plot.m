function stickman_plot(joints, speed)
% This function plots a stickman, accordingly to the xyz coordinates of its
% joints specified in 'joints' in the order set by the Kinect joint map.
% Input data must be a 4 x something (even 1) matrix in which the first row
% are the timestamps and rows 2 to 4 are the xyz coordinates of the joints.
% If the second dimension of the input is greater than 1, the stickman
% moves.
% The speed input controls the visualization time of each "frame" of the
% "video".

% For each timestamp, data about the position of 25 joints are collected.
% With respect to the Kinect V2 joint map, every joint ID must be augmented
% by 1, since the joint ID start from 0, while the array indeces in Matlab
% start from 1.
right_leg = [0 16:19] + 1;
left_leg = [0 12:15] + 1;
trunk = [20 1 0] + 1;
right_arm = [20 8:11 23] + 1; % arm + hand
right_thumb = [10 24] + 1;
left_arm = [20 4:7 21] + 1; % arm + hand
left_thumb = [7 22] + 1;
neck_and_head = [3 2 20] + 1;

skeleton = figure();
% axis(gca,[min(min(joints(2:4,:)))-0.1 max(max(joints(2:4,:)))+0.1...
%           min(min(joints(2:4,:)))-0.1 max(max(joints(2:4,:)))+0.1...
%           min(min(joints(2:4,:)))-0.1 max(max(joints(2:4,:)))+0.1]);

for i = 0:(size(joints,2) - 25)/25 % for each timestamp, data about 25 joints are acquired
    % stop the simulation if the figure is closed
    if(~skeleton.isvalid)
       return
    end
    if(exist('misterious_graphical_obj','var'))
        misterious_graphical_obj.delete
    end
    
    axis(gca,[min(min(joints([2 3],:)))-0.1 max(max(joints([2 3],:)))+0.1...
              min(min(joints([2 3],:)))-0.1 max(max(joints([2 3],:)))+0.1]);
    axis(gca,'equal'); % set the axis as equal
    grid on;
    % Plot the joints properly connected by lines representing limbs
    hold on;
    plot3(joints(2,right_leg + i*25), joints(3,right_leg + i*25),...
          joints(4,right_leg + i*25),'-or');
    plot3(joints(2,left_leg + i*25), joints(3,left_leg + i*25),...
          joints(4,left_leg + i*25),'-or'); 
    plot3(joints(2,trunk + i*25), joints(3,trunk + i*25),...
          joints(4,trunk + i*25),'-om');
    plot3(joints(2,right_arm + i*25), joints(3,right_arm + i*25),...
          joints(4,right_arm + i*25),'-ob');
    plot3(joints(2,right_thumb + i*25), joints(3,right_thumb + i*25),...
          joints(4,right_thumb+ i*25),'-og'); 
    plot3(joints(2,left_arm + i*25), joints(3,left_arm + i*25),...
          joints(4,left_arm + i*25),'-ob');
    plot3(joints(2,left_thumb + i*25), joints(3,left_thumb + i*25),...
          joints(4,left_thumb+ i*25),'-og');
    plot3(joints(2,neck_and_head + i*25), joints(3,neck_and_head + i*25),...
          joints(4,neck_and_head + i*25),'-oc');
    
    txt = ['frame = ' num2str(i)];
    title(txt); % not the best solution, try 'test' instead 
    
    hold off;
    
    drawnow
    
    pause(0.1 / speed)
%     for time_waster = 1:(0.5*1e+08 / speed)
%     end
%     disp(i);
    misterious_graphical_obj = gca; 

    clf;
end

end