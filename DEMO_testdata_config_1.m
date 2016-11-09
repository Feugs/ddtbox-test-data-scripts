function DEMO_config_testdata
%__________________________________________________________________________
% DDTBOX script written by Stefan Bode 01/03/2013
%
% The toolbox was written with contributions from:
% Daniel Bennett, Jutta Stahl, Daniel Feuerriegel, Phillip Alday
%
% The author further acknowledges helpful conceptual input/work from: 
% Simon Lilburn, Philip L. Smith, Carsten Murawski, Carsten Bogler,
% John-Dylan Haynes
%__________________________________________________________________________
%
% This script is the configuration script for the DDTBOX. All
% study-specific information for decoding, regression and groupl-level
% analyses are specified here.

global SLIST
global SBJTODO
global CALL_MODE;

%% GENERAL STUDY PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

savemode=0;

bdir='/Users/danielfeuerriegel/Desktop/DDTBOX Project/MVPA_WORKSHOP';
output_dir='/Users/danielfeuerriegel/Desktop/DDTBOX Project/MVPA_WORKSHOP/DECODING_RESULTS/preanalysed/';

% subject codes/names
sbj_code = {...
    
    ['DATA/DDTBox Test Dataset/ID1'];... %1
    ['DATA/DDTBox Test Dataset/ID2'];... %2 
    ['DATA/DDTBox Test Dataset/ID3'];... %3
    ['DATA/DDTBox Test Dataset/ID4'];... %4
    ['DATA/DDTBox Test Dataset/ID5'];... %5
    ['DATA/DDTBox Test Dataset/ID7'];... %6
    ['DATA/DDTBox Test Dataset/ID8'];... %7
    ['DATA/DDTBox Test Dataset/ID9'];... %8
    ['DATA/DDTBox Test Dataset/ID10'];... %9
    ['DATA/DDTBox Test Dataset/ID11'];... %10
    ['DATA/DDTBox Test Dataset/ID12'];... %11 
    ['DATA/DDTBox Test Dataset/ID14'];... %12
    ['DATA/DDTBox Test Dataset/ID16'];... %13
    ['DATA/DDTBox Test Dataset/ID17'];... %14
    ['DATA/DDTBox Test Dataset/ID18'];... %15
    ['DATA/DDTBox Test Dataset/ID19'];... %16
    ['DATA/DDTBox Test Dataset/ID20'];... %17
    ['DATA/DDTBox Test Dataset/ID21'];... %18
    ['DATA/DDTBox Test Dataset/ID22'];... %19 
    };

nsbj=size(sbj_code,1);


%% CREATE SLIST %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

SLIST=[];
sn=SBJTODO;
   
    % subject parameters
    SLIST.number=sn;
    SLIST.sbj_code=sbj_code{sn};
    SLIST.output_dir=output_dir;
    SLIST.data_struct_name='eeg_sorted_cond';
    
    % channels    
    SLIST.nchannels=64;
    SLIST.channels='channel_labels';
    SLIST.channel_names_file='channel_inf.mat';
    SLIST.channellocs=[bdir 'locations\'];
    SLIST.eyes=[];
    SLIST.extra=0;
    
    % sampling rate and baseline
    SLIST.sampling_rate=1000;
    SLIST.pointzero=100; % corresponds to zero (time-locked to this event, in ms)
     
        
%% CREATE DCGs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

    % decoding: conditions and classes 
    SLIST.cond_labels{1}='Faces';
    SLIST.cond_labels{2}='Chairs';
     
    % discrimination groups
    SLIST.dcg{1}=[1 2]; % 
              
    SLIST.dcg_labels{1}='Faces vs Chairs';
    
    SLIST.ndcg=size(SLIST.dcg,2);
    SLIST.nclasses=size(SLIST.dcg{1},2);      
    SLIST.ncond=size(SLIST.cond_labels,2);
    
    SLIST.data_open_name=[bdir (sbj_code{sn}) '.mat'];
    SLIST.data_save_name=[bdir (sbj_code{sn}) '_data.mat'];
    
    
%% SAVE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

if savemode==1
    
    save(SLIST.data_save_name,'eeg_sorted_cond','SLIST');
    
end  

