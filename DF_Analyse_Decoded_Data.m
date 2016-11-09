% DF_Analyse_Decoded_Data.m
%
% This is an example script to run the statistical testing and plotting of
% the decoding results.
%
% Written by DF 09/15

% housekeeping
clear all;
close all;


% Set which subjects' data I want to decode
subjects = [1:19];

% Enter the name of the study (used to find config file)
study_name = 'DEMO_testdata';
version = 1;

% Enter the number of the discrimination groups to use
discriminationGroup = [1];

% Determine the input mode
inputMode = 0; % 0 = Hard-coded variables, 1 = Promped input
    
ANALYSE_DECODING_ERP(study_name, version, inputMode, subjects, discriminationGroup);

