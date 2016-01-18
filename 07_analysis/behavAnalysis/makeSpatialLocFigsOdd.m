function makeSpatialLocFigsOdd(sub,cfg)
    
    % patrick malone pmalone333@gmail.com 11/23/15
    % passed args: sub must be string (i.e '900' for subj 900), if
    % cfg isn't passed it is created using config_subjects_VT.m 
    
    if exist('cfg','var') % if cfg was passed, use it; else, create one
        cfg = config_subjects_VT(cfg);
    else
        cfg = config_subjects_VT;
    end
    
    % change preTrain to post for post training figs
    data_path = dir(fullfile(cfg.dirs.behav_dir,sub,'preTrain','spatialLoc'));
    load(fullfile(cfg.dirs.behav_dir,sub,'preTrain','spatialLoc',data_path(4).name));

    %% plot overall accuracy by block
    plot([mean(trialOutput(1).accuracy) mean(trialOutput(2).accuracy) mean(trialOutput(3).accuracy) ...
          mean(trialOutput(4).accuracy) mean(trialOutput(5).accuracy) mean(trialOutput(6).accuracy) ...
          mean(trialOutput(7).accuracy)]);
    xlabel('Block');
    ylabel('Accuracy');
    ylim([0.4 1])
    hline = refline([0 0.5]);
    hline.Color = 'r';
    title(['Sub ' sub ' overall spatial localization acc']);
    print(fullfile(cfg.dirs.behav_dir,sub,'preTrain','spatialLoc',['sub' sub '_spatialLoc_OverallBlockAcc']),'-dpng');
    
    %% plot accuracy by freq
    % plot low freq by block 
    plot([mean(trialOutput(1).accuracy(floor(trialOutput(1).stimuli(2,:)) == 26)) mean(trialOutput(2).accuracy(floor(trialOutput(2).stimuli(2,:)) == 26)) ...
          mean(trialOutput(3).accuracy(floor(trialOutput(3).stimuli(2,:)) == 26)) mean(trialOutput(4).accuracy(floor(trialOutput(4).stimuli(2,:)) == 26)) ... 
          mean(trialOutput(5).accuracy(floor(trialOutput(5).stimuli(2,:)) == 26)) mean(trialOutput(6).accuracy(floor(trialOutput(6).stimuli(2,:)) == 26)) ... 
          mean(trialOutput(7).accuracy(floor(trialOutput(7).stimuli(2,:)) == 26))])
    xlabel('Block');
    ylabel('Accuracy');
    ylim([0.4 1])
    hline = refline([0 0.5]);
    hline.Color = 'r';
    title(['Sub ' sub ' low freq spatial localization acc']);
    print(fullfile(cfg.dirs.behav_dir,sub,'preTrain','spatialLoc',['sub' sub '_spatialLoc_lowFreqBlockAcc']),'-dpng');
    
    % plot high freq by block 
    plot([mean(trialOutput(1).accuracy(floor(trialOutput(1).stimuli(2,:)) == 93)) mean(trialOutput(2).accuracy(floor(trialOutput(2).stimuli(2,:)) == 93)) ...
          mean(trialOutput(3).accuracy(floor(trialOutput(3).stimuli(2,:)) == 93)) mean(trialOutput(4).accuracy(floor(trialOutput(4).stimuli(2,:)) == 93)) ... 
          mean(trialOutput(5).accuracy(floor(trialOutput(5).stimuli(2,:)) == 93)) mean(trialOutput(6).accuracy(floor(trialOutput(6).stimuli(2,:)) == 93)) ... 
          mean(trialOutput(7).accuracy(floor(trialOutput(7).stimuli(2,:)) == 93))])
    xlabel('Block');
    ylabel('Accuracy');
    ylim([0.4 1])
    hline = refline([0 0.5]);
    hline.Color = 'r';
    title(['Sub ' sub ' high freq spatial localization acc']);
    print(fullfile(cfg.dirs.behav_dir,sub,'preTrain','spatialLoc',['sub' sub '_spatialLoc_highFreqBlockAcc']),'-dpng');
    
    %% same condition - plot by channel
    pos1 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 1 & trialOutput(1).stimuli(3,:) == 1) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 1 & trialOutput(2).stimuli(3,:) == 1) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 1 & trialOutput(3).stimuli(3,:) == 1) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 1 & trialOutput(4).stimuli(3,:) == 1) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 1 & trialOutput(5).stimuli(3,:) == 1) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 1 & trialOutput(6).stimuli(3,:) == 1) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 1 & trialOutput(7).stimuli(3,:) == 1)]);
    pos3 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 3 & trialOutput(1).stimuli(3,:) == 3) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 3 & trialOutput(2).stimuli(3,:) == 3) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 3 & trialOutput(3).stimuli(3,:) == 3) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 3 & trialOutput(4).stimuli(3,:) == 3) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 3 & trialOutput(5).stimuli(3,:) == 3) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 3 & trialOutput(6).stimuli(3,:) == 3) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 3 & trialOutput(7).stimuli(3,:) == 3)]);
    pos5 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 5 & trialOutput(1).stimuli(3,:) == 5) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 5 & trialOutput(2).stimuli(3,:) == 5) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 5 & trialOutput(3).stimuli(3,:) == 5) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 5 & trialOutput(4).stimuli(3,:) == 5) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 5 & trialOutput(5).stimuli(3,:) == 5) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 5 & trialOutput(6).stimuli(3,:) == 5) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 5 & trialOutput(7).stimuli(3,:) == 5)]);
    pos9 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 9 & trialOutput(1).stimuli(3,:) == 9) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 9 & trialOutput(2).stimuli(3,:) == 9) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 9 & trialOutput(3).stimuli(3,:) == 9) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 9 & trialOutput(4).stimuli(3,:) == 9) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 9 & trialOutput(5).stimuli(3,:) == 9) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 9 & trialOutput(6).stimuli(3,:) == 9) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 9 & trialOutput(7).stimuli(3,:) == 9)]);
    pos11 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 11 & trialOutput(1).stimuli(3,:) == 11) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 11 & trialOutput(2).stimuli(3,:) == 11) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 11 & trialOutput(3).stimuli(3,:) == 11) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 11 & trialOutput(4).stimuli(3,:) == 11) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 11 & trialOutput(5).stimuli(3,:) == 11) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 11 & trialOutput(6).stimuli(3,:) == 11) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 11 & trialOutput(7).stimuli(3,:) == 11)]);
    pos13 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 13 & trialOutput(1).stimuli(3,:) == 13) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 13 & trialOutput(2).stimuli(3,:) == 13) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 13 & trialOutput(3).stimuli(3,:) == 13) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 13 & trialOutput(4).stimuli(3,:) == 13) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 13 & trialOutput(5).stimuli(3,:) == 13) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 13 & trialOutput(6).stimuli(3,:) == 13) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 13 & trialOutput(7).stimuli(3,:) == 13)]);
    bar([pos1 pos3 pos5 pos9 pos11 pos13])
    xlabel('Position');
    ylabel('Accuracy');
    ylim([0.3 1])
    hline = refline([0 0.5]);
    hline.Color = 'r';
    title(['Sub ' sub ' same condition acc by position']);
    set(gca,'XTickLabel',[1 3 5 9 11 13])
    print(fullfile(cfg.dirs.behav_dir,sub,'preTrain','spatialLoc',['sub' sub '_spatialLoc_sameCondByPos']),'-dpng');
    
    %% diff condition - plot by position pair 
    pos1_3 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 1 & trialOutput(1).stimuli(3,:) == 3) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 1 & trialOutput(2).stimuli(3,:) == 3) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 1 & trialOutput(3).stimuli(3,:) == 3) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 1 & trialOutput(4).stimuli(3,:) == 3) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 1 & trialOutput(5).stimuli(3,:) == 3) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 1 & trialOutput(6).stimuli(3,:) == 3) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 1 & trialOutput(7).stimuli(3,:) == 3) ... 
           trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 3 & trialOutput(1).stimuli(3,:) == 1) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 3 & trialOutput(2).stimuli(3,:) == 1) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 3 & trialOutput(3).stimuli(3,:) == 1) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 3 & trialOutput(4).stimuli(3,:) == 1) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 3 & trialOutput(5).stimuli(3,:) == 1) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 3 & trialOutput(6).stimuli(3,:) == 1) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 3 & trialOutput(7).stimuli(3,:) == 1)]);
    pos1_5 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 1 & trialOutput(1).stimuli(3,:) == 5) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 1 & trialOutput(2).stimuli(3,:) == 5) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 1 & trialOutput(3).stimuli(3,:) == 5) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 1 & trialOutput(4).stimuli(3,:) == 5) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 1 & trialOutput(5).stimuli(3,:) == 5) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 1 & trialOutput(6).stimuli(3,:) == 5) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 1 & trialOutput(7).stimuli(3,:) == 5) ... 
           trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 5 & trialOutput(1).stimuli(3,:) == 1) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 5 & trialOutput(2).stimuli(3,:) == 1) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 5 & trialOutput(3).stimuli(3,:) == 1) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 5 & trialOutput(4).stimuli(3,:) == 1) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 5 & trialOutput(5).stimuli(3,:) == 1) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 5 & trialOutput(6).stimuli(3,:) == 1) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 5 & trialOutput(7).stimuli(3,:) == 1)]);
    % why no reverse positions for 2 and 10?
    pos1_9 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 1 & trialOutput(1).stimuli(3,:) == 9) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 1 & trialOutput(2).stimuli(3,:) == 9) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 1 & trialOutput(3).stimuli(3,:) == 9) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 1 & trialOutput(4).stimuli(3,:) == 9) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 1 & trialOutput(5).stimuli(3,:) == 9) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 1 & trialOutput(6).stimuli(3,:) == 9) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 1 & trialOutput(7).stimuli(3,:) == 9)]);
    pos3_5 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 3 & trialOutput(1).stimuli(3,:) == 5) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 3 & trialOutput(2).stimuli(3,:) == 5) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 3 & trialOutput(3).stimuli(3,:) == 5) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 3 & trialOutput(4).stimuli(3,:) == 5) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 3 & trialOutput(5).stimuli(3,:) == 5) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 3 & trialOutput(6).stimuli(3,:) == 5) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 3 & trialOutput(7).stimuli(3,:) == 5) ... 
           trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 5 & trialOutput(1).stimuli(3,:) == 3) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 5 & trialOutput(2).stimuli(3,:) == 3) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 5 & trialOutput(3).stimuli(3,:) == 3) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 5 & trialOutput(4).stimuli(3,:) == 3) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 5 & trialOutput(5).stimuli(3,:) == 3) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 5 & trialOutput(6).stimuli(3,:) == 3) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 5 & trialOutput(7).stimuli(3,:) == 3)]);
    pos3_9 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 3 & trialOutput(1).stimuli(3,:) == 9) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 3 & trialOutput(2).stimuli(3,:) == 9) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 3 & trialOutput(3).stimuli(3,:) == 9) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 3 & trialOutput(4).stimuli(3,:) == 9) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 3 & trialOutput(5).stimuli(3,:) == 9) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 3 & trialOutput(6).stimuli(3,:) == 9) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 3 & trialOutput(7).stimuli(3,:) == 9)]);
    pos5_9 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 5 & trialOutput(1).stimuli(3,:) == 9) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 5 & trialOutput(2).stimuli(3,:) == 9) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 5 & trialOutput(3).stimuli(3,:) == 9) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 5 & trialOutput(4).stimuli(3,:) == 9) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 5 & trialOutput(5).stimuli(3,:) == 9) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 5 & trialOutput(6).stimuli(3,:) == 9) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 5 & trialOutput(7).stimuli(3,:) == 9) ... 
           trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 9 & trialOutput(1).stimuli(3,:) == 5) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 9 & trialOutput(2).stimuli(3,:) == 5) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 9 & trialOutput(3).stimuli(3,:) == 5) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 9 & trialOutput(4).stimuli(3,:) == 5) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 9 & trialOutput(5).stimuli(3,:) == 5) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 9 & trialOutput(6).stimuli(3,:) == 5) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 9 & trialOutput(7).stimuli(3,:) == 5)]);
    pos5_11 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 11 & trialOutput(1).stimuli(3,:) == 5) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 11 & trialOutput(2).stimuli(3,:) == 5) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 11 & trialOutput(3).stimuli(3,:) == 5) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 11 & trialOutput(4).stimuli(3,:) == 5) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 11 & trialOutput(5).stimuli(3,:) == 5) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 11 & trialOutput(6).stimuli(3,:) == 5) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 11 & trialOutput(7).stimuli(3,:) == 5)]);
    pos5_13 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 13 & trialOutput(1).stimuli(3,:) == 5) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 13 & trialOutput(2).stimuli(3,:) == 5) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 13 & trialOutput(3).stimuli(3,:) == 5) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 13 & trialOutput(4).stimuli(3,:) == 5) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 13 & trialOutput(5).stimuli(3,:) == 5) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 13 & trialOutput(6).stimuli(3,:) == 5) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 13 & trialOutput(7).stimuli(3,:) == 5)]);
    pos9_11 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 9 & trialOutput(1).stimuli(3,:) == 11) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 9 & trialOutput(2).stimuli(3,:) == 11) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 9 & trialOutput(3).stimuli(3,:) == 11) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 9 & trialOutput(4).stimuli(3,:) == 11) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 9 & trialOutput(5).stimuli(3,:) == 11) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 9 & trialOutput(6).stimuli(3,:) == 11) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 9 & trialOutput(7).stimuli(3,:) == 11) ... 
           trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 11 & trialOutput(1).stimuli(3,:) == 9) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 11 & trialOutput(2).stimuli(3,:) == 9) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 11 & trialOutput(3).stimuli(3,:) == 9) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 11 & trialOutput(4).stimuli(3,:) == 9) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 11 & trialOutput(5).stimuli(3,:) == 9) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 11 & trialOutput(6).stimuli(3,:) == 9) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 11 & trialOutput(7).stimuli(3,:) == 9)]);
    pos9_13 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 9 & trialOutput(1).stimuli(3,:) == 13) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 9 & trialOutput(2).stimuli(3,:) == 13) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 9 & trialOutput(3).stimuli(3,:) == 13) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 9 & trialOutput(4).stimuli(3,:) == 13) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 9 & trialOutput(5).stimuli(3,:) == 13) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 9 & trialOutput(6).stimuli(3,:) == 13) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 9 & trialOutput(7).stimuli(3,:) == 13) ... 
           trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 13 & trialOutput(1).stimuli(3,:) == 9) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 13 & trialOutput(2).stimuli(3,:) == 9) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 13 & trialOutput(3).stimuli(3,:) == 9) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 13 & trialOutput(4).stimuli(3,:) == 9) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 13 & trialOutput(5).stimuli(3,:) == 9) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 13 & trialOutput(6).stimuli(3,:) == 9) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 13 & trialOutput(7).stimuli(3,:) == 9)]);
    pos11_13 = mean([trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 11 & trialOutput(1).stimuli(3,:) == 13) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 11 & trialOutput(2).stimuli(3,:) == 13) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 11 & trialOutput(3).stimuli(3,:) == 13) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 11 & trialOutput(4).stimuli(3,:) == 13) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 11 & trialOutput(5).stimuli(3,:) == 13) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 11 & trialOutput(6).stimuli(3,:) == 13) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 11 & trialOutput(7).stimuli(3,:) == 13) ... 
           trialOutput(1).accuracy(trialOutput(1).stimuli(1,:) == 13 & trialOutput(1).stimuli(3,:) == 11) trialOutput(2).accuracy(trialOutput(2).stimuli(1,:) == 13 & trialOutput(2).stimuli(3,:) == 11) ... 
           trialOutput(3).accuracy(trialOutput(3).stimuli(1,:) == 13 & trialOutput(3).stimuli(3,:) == 11) trialOutput(4).accuracy(trialOutput(4).stimuli(1,:) == 13 & trialOutput(4).stimuli(3,:) == 11) ... 
           trialOutput(5).accuracy(trialOutput(5).stimuli(1,:) == 13 & trialOutput(5).stimuli(3,:) == 11) trialOutput(6).accuracy(trialOutput(6).stimuli(1,:) == 13 & trialOutput(6).stimuli(3,:) == 11) ... 
           trialOutput(7).accuracy(trialOutput(7).stimuli(1,:) == 13 & trialOutput(7).stimuli(3,:) == 11)]);
    bar([pos1_3 pos1_5 pos1_9 pos3_5 pos3_9 pos5_9 pos5_11 pos5_13 pos9_11 pos9_13 pos11_13])
    xlabel('Position pair');
    ylabel('Accuracy');
    ylim([0.3 1])
    hline = refline([0 0.5]);
    hline.Color = 'r';
    title(['Sub ' sub ' diff condition acc by position pair']);
    set(gca,'XTickLabel',{'1+3','1+5','1+9','3+5','3+9','5+9','5+11','5+13','9+11','9+13','11+13'})
    print(fullfile(cfg.dirs.behav_dir,sub,'preTrain','spatialLoc',['sub' sub '_spatialLoc_diffCondByPosPair']),'-dpng');
    
end
  