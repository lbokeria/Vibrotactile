f1=2.^([0:.1:2]+log2(25));

frequency = [f1(2) f1(5) f1(8) f1(14) f1(17) f1(20)];

channels = [7 13];

proto1 = [frequency(1) frequency(6) channels(1) channels(2)]';   
proto2 = [frequency(2) frequency(5) channels(1) channels(2)]';    
proto3 = [frequency(3) frequency(4) channels(1) channels(2)]';     
proto4 = [frequency(4) frequency(3) channels(1) channels(2)]';
proto5 = [frequency(5) frequency(2) channels(1) channels(2)]';
proto6 = [frequency(6) frequency(1) channels(1) channels(2)]';
  
%generate same and different stimuli 
stimuliSame = [repmat(proto1,1,5), repmat(proto2,1,5), repmat(proto3,1,5), repmat(proto4,1,5), repmat(proto5,1,5), repmat(proto6,1,5);  
               repmat(proto1,1,5), repmat(proto2,1,5), repmat(proto3,1,5), repmat(proto4,1,5), repmat(proto5,1,5), repmat(proto6,1,5)];

stimuliDifferent = [repmat(proto1,1,5),                     repmat(proto2,1,5),                     repmat(proto3,1,5),                    repmat(proto4,1,5),                    repmat(proto5,1,5),                    repmat(proto6,1,5)
                    proto2, proto3, proto4,proto5,proto6    proto1, proto3, proto4,proto5,proto6    proto1, proto2, proto4,proto5,proto6   proto1, proto2, proto3,proto5,proto6   proto1,proto2,proto3,proto4,proto6    proto1,proto2,proto3,proto4,proto5  ];
                 
stimuli = [stimuliSame, stimuliDifferent];
stimuli = repmat(stimuli,1,2);

save ('frequencyDiscrimStimuli3.mat','stimuli')