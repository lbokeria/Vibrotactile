% get subject info
% exptdesign.debugmode = 0; % Does not work for now. keep this commented.
% if exptdesign.debugmode
%     number = '0000';
%     WARN = input('YOU ARE IN DEBUG MODE. ARE YOU SURE THIS IS RIGHT?');
% else
%     
% end
%name = '915';
%number = name;

number = input('\n\nEnter Subject ID:\n\n','s');
exptdesign.number = number;
if isempty(number)
    name = [datestr(now,'yyyy-mm-dd-HH-MM_') 'MR000'];
else
    name = [datestr(now,'yyyy-mm-dd-HH-MM_') number];
end
WaitSecs(0.25);

%check if subject has data on file
exptdesign.saveDir = ['./data_Untrained_Localizer/' number];
if ~exist(exptdesign.saveDir,'dir')
    mkdir(exptdesign.saveDir)
end

%Trial/Block/Run lengths
exptdesign.subjectName = name;
exptdesign.numBlocks = 5;              
exptdesign.numTrialsPerSession = 6;    
exptdesign.numRuns = 1;

%fixation location/duration
exptdesign.fixationDuration = 0.700;   
exptdesign.fixationImage = 'imgsscaled/fixation.bmp'; 
exptdesign.imageDirectory = 'imgsscaled/';   

% Decide which response mapping you are using
% if exptdesign.debugmode
%     exptdesign.response = 1;
%     exptdesign.responseBox = 0;
%     exptdesign.boxHandle = 2; % we still need this variable in the debug mode. 
% else
               % Controls whether we are using the keyboard or the response box for subj. responses.
% end

exptdesign.response = input('\n\nEnter response key profile (option 0 or 1):\n\n');
exptdesign.responseBox = 1;  

exptdesign.interTrialInterval = 0.7;                % amount of time between trials

%open com3 port for button boxes
if exptdesign.responseBox
    % Ensure button-box configuration is correct
    disp('Ensure dip switches are set to E-PRIME and 5+');
    input('Hit Enter to Continue...');
    exptdesign.boxHandle = CMUBox('Open', 'pst', 'COM3', 'norelease');
end

%open com2 port for stimulator
stimGenPTB('open')

for iRuns = 1:exptdesign.numRuns
    exptdesign.iRuns=iRuns;
    [trialOutput.runs] = untrainedOddballinScannerExperiment2(name,exptdesign);
end

%close com3 port
if exptdesign.responseBox
    CMUBox('Close',exptdesign.boxHandle);
    handle = ERRORDLG('Please ensure dip switches are set back to 4 and A');
    disp(handle);
end

%close com2 port 
stimGenPTB('close')