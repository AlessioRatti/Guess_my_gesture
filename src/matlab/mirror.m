function [mirrored] = mirror(unmirrored)
% horizontal mirroring of the skeletal data
unmirrored = reshape(unmirrored', 3, []);
mirrored = (zeros(size(unmirrored,1), size(unmirrored,2))+[-1; 1; 1]).*unmirrored;
mirrored = reshape(mirrored, 75, [])';
end
