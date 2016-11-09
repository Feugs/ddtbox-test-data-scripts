% convert_eeglab_data_ddtbox
%
% Converts the DDTBox test dataset into files compatible with DDTBox. 
%
% Written by DF 2016
%
% You're welcome
%
% Note: EEGLab datasets have been epoched using ERPLab.
% Bin indices are: 1 = Faces; 2 = Chairs
% 250Hz sampling rate, -100ms to +250ms epoch duration
% Total of 250 epochs, should be at least 100 epochs for each condition in
% each participant dataset.
%
% 

% Housekeeping
clear all;
close all;

% Select which subject datasets to convert
IDs_to_process = [1:5 7:12 14 16:22]; % Full dataset [1:5 7:12 14 16:22]

% Select from which bins to extract epochs
% 1 = Faces
% 2 = Chairs
bins_to_extract = [1, 2];

save_dir_name = 'DDTBox Data';



% Create directory for file saving
if ~exist(save_dir_name, 'dir')
   mkdir(save_dir_name);
end 

% Loop through IDs and extract data
for ID = IDs_to_process
    
    % Reset array
    eeg_sorted_cond = {};
   
    % Load EEG dataset
    EEG = pop_loadset('filename', ['ID' int2str(ID) '.set']);
    
    % Get a vector of bin indices by epoch
    bin_inds_by_epoch = zeros(size(EEG.data, 3), 1); % preallocate

    % Check whether event field has extraneous events
    if length(EEG.event) ~= size(EEG.data, 3)
        warning(['There may be extra events for ID ' int2str(ID) '. Number of events does not match number of epochs'])
    end
    
    for epoch_no = 1:size(EEG.data, 3)
        bin_inds_by_epoch(epoch_no) = EEG.event(epoch_no).bini;
    end % of for epoch_no
    
    % Copy epochs from each condition into the DDTBox-compatible array
    for condition = bins_to_extract  
        eeg_sorted_cond{1, condition}(:,:,:) = EEG.data(:,:, bin_inds_by_epoch == condition);  
    end % of for condition
    
    % Save resulting dataset
    save([save_dir_name, '/ID', int2str(ID)], 'eeg_sorted_cond');
    
    
end % of for ID







