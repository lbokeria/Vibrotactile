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


%% 









