clc; clear ;close all
addpath( 'Method');
images_dir='test';
listing = cat(1, dir(fullfile(images_dir, '*.jpg')));
% The final output will be saved in this directory:
results_dir = fullfile(images_dir, 'Result');
% Preparations for saving resultss.
if ~exist(results_dir, 'dir'), mkdir(results_dir); end

for i_img = 1:1:length(listing)
    Input = imread(fullfile(images_dir,listing(i_img).name));  
    [~, img_name, ~] = fileparts(listing(i_img).name);
    img_name = strrep(img_name, '_input', '');
    
    %%  Piecewise Color Correction 
    CC= PCC(Input);
    %% Dual Prior Optimized Contrast Enhancement
    Result= PCDE(CC);
    
    imwrite(uint8(Result), fullfile(results_dir, [img_name, '_PCDE.jpg']));

end

