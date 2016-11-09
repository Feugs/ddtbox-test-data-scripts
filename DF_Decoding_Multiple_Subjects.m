% DF_Decoding_Multiple_Subjects.m
%
% This is an example script to run the decoding analysis on multiple
% subjects. 
%
% Written by DF 11/16
%
%


% Set which subjects datasets to decode
subjects = [1];

% Enter the name of the study (used to find config file)
study_name = 'DEMO_testdata';
version = 1;

% Determine the input mode (1 = Prompted input, 0 = Hard-coded variables)
inputMode = 0;

% Enter the number of the discrimination groups to use
% For Cross-trial decoding input two discrimination group indices in a
% vector. 
% Discrimination group is the session number.
discriminationGroup = [1];

% Decide whether to use cross-trial decoding, 1 = yes; 0 = no
crossConditionDecoding = 0;


for ID = subjects
    
    DECODING_ERP(study_name, version, inputMode, ID, discriminationGroup, crossConditionDecoding);
    
end