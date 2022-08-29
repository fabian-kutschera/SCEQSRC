

% Example 2. Estimate the magnitude, given fault length for strike-slip 
% event and finite seismogenic width. 
 
 
% median prediction
%[Mw, ~] = srcdim2mw('length', 853, 'fault', 'strike-slip', ...
%    'seismogenic_width',18, 'scale', 'median');
%disp(Mw);
%[Mw, ~] = srcdim2mw('length', 100, 'fault', 'strike-slip', ...
%    'seismogenic_width',10, 'scale', 'median');
Zseis = 20; % km
dipAn = 40; % degrees
Wseis = Zseis/sind(dipAn) % seismogenic width
[Mw, ~] = srcdim2mw('length', 60, 'fault', 'normal', ...
    'seismogenic_width',Wseis, 'scale', 'median');
disp(Mw);

% examine effect of uncertain seismogenic width - 100 samples, for 
% seismogenic width described with lognormal-distributed errors  
 
res = lognrnd(0.05,0.3, 100,1); res=res-median(res);
%seismogenic_width = 18+res;
%seismogenic_width = 24+res;
seismogenic_width = Wseis+res;

 
%[Mw, stats] = srcdim2mw('length', 853.*ones(100,1), 'fault', 'strike-slip', ...
%    'seismogenic_width',seismogenic_width);
%[Mw, stats] = srcdim2mw('length', 100.*ones(100,1), 'fault', 'strike-slip', ...
%    'seismogenic_width',seismogenic_width);
[Mw, stats] = srcdim2mw('length', 60.*ones(100,1), 'fault', 'normal', ...
    'seismogenic_width',seismogenic_width);
 
plot(seismogenic_width, Mw, 'ko', 'markerfacecolor', [0.7 0.7 0.7]);

ylabel('magnitude (Mw)');
xlabel('seismogenic width (km)');
%title({'Magnitude estimates for normal fault, based on seismogenic depth of x km'})
title(["Magnitude estimates for normal fault","based on seismogenic depth of " + Zseis + " km"]) 