function [w_noise] = addNoise(wo_noise, snr)
% add white gaussian noise with zero mean
w_noise = awgn(wo_noise',snr, 'measured')';
end
