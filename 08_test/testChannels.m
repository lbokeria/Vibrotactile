% FrequencyDiscrimWrapper
% Wrapper, calls frequencyDiscrimExperiment.m
% Courtney Sprouse cs1471@georgetown.edu && Patrick Malone pmalone333@gmail.com && 
% Levan Bokeria levan.bokeria@georgetown.edu

%get subject info
number = input('\n\nEnter Subject NUMBER:\n\n','s');
exptdesign.number = number;

if isempty(number)
    name = 'MR000';
else
    name = ['MR' number];
end
WaitSecs(0.25);

exptdesign.subjectName = name;

%check if the subject has a directory in data.  If not, make it.
if exist(['./data/' number],'dir')
else
    mkdir(['./data/' number])
end

exptdesign.numBlocks = 1;              % number of blocks
exptdesign.numTrialsPerSession = 12;

exptdesign.practiceType = 1; % added this manualy. Should be an input? 

if exptdesign.practiceType == '0'
    exptdesign.StimPresentationWindow = .3;
else
    exptdesign.StimPresentationWindow = .5;
end

exptdesign.fixationImage  = 'imgScaled/fixation.bmp';  % image for the fixation cross
exptdesign.stimBoardImages = dir('imgScaled/stimBoard*.bmp');

stimGenPTB('open')
testChannelsExperiment(exptdesign);
stimGenPTB('close')