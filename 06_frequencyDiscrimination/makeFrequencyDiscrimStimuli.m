f1=2.^([0:.1:2]+log2(25));

frequency = [f1(2) f1(8) f1(14) f1(20)];

channels = [1 13];
%channels = [2 14];

pair1 = [repmat(frequency(1),1,2);channels];
     
pair2 = [repmat(frequency(2),1,2); channels];
     
pair3 = [repmat(frequency(3),1,2); channels];
     
pair4 = [repmat(frequency(4),1,2); channels];

stimulator = [pair1 pair2 pair3 pair4];
  
%combine frequency combinations with position pairs 
stimuli = [repmat(pair1,1,4), repmat(pair2,1,6), repmat(pair3,1,6), repmat(pair4,1,4);...
           repmat(pair1,1,2), pair2, pair3, repmat(pair2,1,2), repmat(stimulator,1,2), repmat(pair3,1,2), repmat(pair4,1,2), pair2, pair3];

stimuli = repmat(stimuli,1,3);

% populate trial structure with 2 instances of the same stimulus
save ('frequencyDiscrimStimuli_0.mat','stimuli')

%save ('frequencyDiscrimStimuli_1.mat','stimuli')