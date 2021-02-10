function [] = saveEZ(file,file_path)
fileID = fopen(file_path,'w');
for ii = 1:size(file,1)
    fprintf(fileID,'%.17f,',file(ii,:));
    fprintf(fileID,'\n');
    % fprintf(fileID,'\r');
end
fclose(fileID);
end
