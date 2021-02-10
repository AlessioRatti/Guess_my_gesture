function [] = savedata(filenames, path_old, processed_db, nFrames, SNR, DA_mirror)
global counts
% rewite all the files in path_old to processed_db
gestures_arr = file2gesture(filenames);
for i=1:length(filenames)
    % readmatrix still preserves 17 digits (MATLAB easily supports only 16)
    path_in = path_old+filenames{i};
    sample = readmatrix(path_in);
    newformat = onefpr(sample); % one frame per row
    fixedLength = fixFrames(newformat, nFrames); % trim or extend the data to nFrames
    % differentiates filename and count increment depending on the gesture
    switch gestures_arr(i)
        case 'ciao'
            file_path = processed_db+gestures_arr(i)+'_'+...
                num2str(counts.ciao, '%03.f');
            counts.ciao = counts.ciao+1;
        case 'piccolo'
            file_path = processed_db+gestures_arr(i)+'_'+...
                num2str(counts.piccolo, '%03.f');
            counts.piccolo = counts.piccolo+1;
        case 'puntare'
            file_path = processed_db+gestures_arr(i)+'_'+...
                num2str(counts.puntare, '%03.f');
            counts.puntare = counts.puntare+1;
        case  'random'
            file_path = processed_db+gestures_arr(i)+'_'+...
                num2str(counts.random, '%03.f');
            counts.random = counts.random+1;
        case 'si'
            file_path = processed_db+gestures_arr(i)+'_'+...
                num2str(counts.si, '%03.f');
            counts.si = counts.si+1;
        case 'vieni'
            file_path = processed_db+gestures_arr(i)+'_'+...
                num2str(counts.vieni, '%03.f');
            counts.vieni = counts.vieni+1;
    end
    %section for data augmentation w gaussian noise or mirroring
    if(SNR > 0)
        w_Gnoise = addNoise(fixedLength, SNR);
        file_path_snr = file_path + 'N.txt';
        saveEZ(w_Gnoise,file_path_snr);
    end
    if (DA_mirror==1)
        mirrored = mirror(fixedLength);
        file_path_mirr = file_path + 'M.txt';
        saveEZ(mirrored,file_path_mirr);
    end
    if (SNR>0 && DA_mirror==1)
        noisy_mirror = addNoise(mirrored, SNR);
        file_path_snr = file_path + 'NM.txt';
        saveEZ(noisy_mirror,file_path_snr);
    end
    % add default extension
    file_path = file_path+'.txt';
    % save on HDD the final standard result
    saveEZ(fixedLength,file_path);
end
end
