% Example 1. For given uncertain magnitude defined by probability distribution  
% (mean and standard deviation), estimate the corresponding rupture width and 
% rupture length for subduction/crustal interface event.
% 

% get the distibution of magnitudes
%Mw      = 8.0+ 0.2*randn(100,1); % 100 sample would be good!
Mw      = 6.8+ 0.2*randn(100,1); % 100 sample would be good!

% estimate the source dimensions
%[L, W, stats] = mw2srcdim('Mw', Mw, 'fault', 'reverse',...
%    'regime', 'interface');  
[L, W, stats] = mw2srcdim('Mw', Mw, 'fault', 'strike-slip',...
    'regime', 'crustal');  

% plot the results
figure(1)
subplot(2,1,1);
plot(Mw, log10(W), 'ko', 'markerfacecolor', [0.7 0.7 0.7]);
hold on;
plot(Mw, log10(stats.medianW), 'r-');

xlabel('magnitude (Mw)'); ylabel('log_1_0(W)');
%axis([7 9 1.5 3]);
axis([6 7.8 0.5 2]);
title('Prob. distribution around Mw 6.8 for crustal strike-slip fault')


subplot(2,1,2);
plot(Mw, log10(L), 'ko', 'markerfacecolor', [0.7 0.7 0.7]);
hold on;
plot(Mw, log10(stats.medianL), 'r-');
xlabel('magnitude (Mw)'); ylabel('log_1_0(L)');
%axis([7 9 1.5 3]);
axis([6 7.8 1 2.5]);

