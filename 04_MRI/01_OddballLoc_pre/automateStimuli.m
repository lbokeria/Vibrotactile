% randomize stimuli creation

%% Define the session master matrix
clear;

nCond = 12;
nRuns = 6;

sessionMatrix = zeros(nCond,nRuns);
sessionMatrix(:,1:3) = 1;

% Randomize top half of the matrix
topRandomized = [];
while isempty(topRandomized)
    for iRow = 1:nCond/2
        if isequal(sum(sessionMatrix(1:nCond/2,:),1),[3 3 3 3 3 3])
            topRandomized = 1;
            fprintf('Randomized the top half\n');
            break
        else
            % randomize on
            topIdx = randperm(6);
            sessionMatrix(iRow,:) = sessionMatrix(iRow,topIdx);        
        end
    end
end

bottomRandomized = [];
while isempty(bottomRandomized)
    for iRow = nCond/2+1:nCond
        if isequal(sum(sessionMatrix(nCond/2+1:nCond,:),1),[3 3 3 3 3 3])
            bottomRandomized = 1;
            fprintf('Randomized the bottom half\n');
            break
        else
            % randomize on
            bottomIdx = randperm(6);
            sessionMatrix(iRow,:) = sessionMatrix(iRow,bottomIdx);        
        end
    end
end

% Do a final check
if isequal(sum(sessionMatrix,1),[6 6 6 6 6 6]) &&...
        isequal(sum(sessionMatrix,2),3*ones(1,nCond)')
    fprintf('Passed the final check!\n')
else 
    error = input('Did not pass final check\n');
end


%% Generate the raw matrix of stimuli for each run

% For responce = 0;
response = 0;
[stimuliAllRuns,f1,f2,oddChannels] = makeOddballStimuli(nRuns,response);

%% Populate the second columnt of each run matrix with oddballs

for iRun = 1:nRuns
    oddIdx = find(sessionMatrix(:,iRun) == 1);
    
    % Populate the second column with oddballs.
    for iOddIdx = 1:length(oddIdx)
        % Is the oddball clock f1 or f2 stimulus?
        if stimuliAllRuns{iRun}{oddIdx(iOddIdx),1}(1) == f1
            oddStimuli = [f2 f2 f2; oddChannels];
        else
            oddStimuli = [f1 f1 f1; oddChannels];
        end
        
        % Write the oddball stimuli in the second column of the run matrix.
        stimuliAllRuns{iRun}{oddIdx(iOddIdx),2} = oddStimuli;
    end
    
    % Now randomize the oddball position within blocks, until oddball is
    % repeated twice only on one trial positions. 
    oddballSpread = [];
    while isempty(oddballSpread)
        
        for iOddIdx = 1:length(oddIdx)
        oddBlock = oddIdx(iOddIdx);
%         sum(cellfun(@length,stimuliAllRuns{iRun}(:,2:6)),1)
           if ~ismember(48,sum(cellfun(@length,stimuliAllRuns{iRun}(:,2:6)),1))
               oddballSpread = 1;
               display('Oddball spread within blocks!')
               break
           else 
              trialIdx = randperm(5) + 1; % because we skip 1st column.
              stimuliAllRuns{iRun}(oddBlock,2:end) = ...
              stimuliAllRuns{iRun}(oddBlock,trialIdx);
           end
        end
    
    end
    
    % Finally. randomize the blocks, while making sure oddball occurrs in
    % the last 6 blocks at least once.
    blocksSpread = [];
    
    while isempty(blocksSpread)
       if ~isequal(12*ones(1,5),sum(cellfun(@length,stimuliAllRuns{iRun}(19:24,2:6)),1))
           blockSpread = 1;
           display('blocks spread too!')
           break 
       else
            blockIdx = randperm(24);
            stimuliAllRuns{iRun} = stimuliAllRuns{iRun}(blockIdx,:);
       end
    end
end




