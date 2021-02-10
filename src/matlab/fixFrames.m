function [fixedLength] = fixFrames(recorded,nRows)
% extend or trim the recorded movement to a specific number of frames
if nRows<=size(recorded, 1) % if the file is too long trim it to size
    fixedLength = recorded(1:nRows, :);
    % a little check to see the how long the long files are
else % if the file is too short repeat the last row untill it reaches the desired size
    lastRow = recorded(end,:);
    add = zeros(nRows-size(recorded, 1), size(recorded,2))+lastRow;
    fixedLength = [recorded; add];
end
% check problematic outliers
% if (size(recorded, 1)<110 || size(recorded, 1)>130)
%     disp(size(recorded, 1)); % controllo sui file troppo lunghi o troppo corti
% end
end
