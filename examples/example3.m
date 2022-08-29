

% Example 3. Let see for Mw 7.0 magnitude event, how the source dimensions 
% vary across different faulting regimes.

%Mw = 7.2.*ones(1000,1);
Mw = 7.0.*ones(1000,1);


[L_rr, W_rr, ~] = mw2srcdim('Mw', Mw, 'fault', 'reverse',...
    'regime', 'crustal');
[L_int, W_int, ~] = mw2srcdim('Mw', Mw, 'fault', 'reverse',...
    'regime', 'interface');
[L_nn, W_nn, ~] = mw2srcdim('Mw', Mw, 'fault', 'normal');
[L_ss, W_ss, ~] = mw2srcdim('Mw', Mw, 'fault', 'strike-slip');

yy = 0:1:200;
subplot(4,2,1);
histogram(L_rr); hold on;
plot(median(L_rr).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
ylabel('Count')
% with old matlab other format necessary
title({'Rupture Length';'reverse crustal'})
%title({'Rupture Length'})
%subtitle('reverse crustal')

subplot(4,2,2);
histogram(W_rr); hold on;
plot(median(W_rr).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
% with old matlab other format necessary
title({'Rupture Width';'reverse crustal'})
%title({'Rupture Width'})
%subtitle('reverse crustal')

subplot(4,2,3);
histogram(L_int);  hold on;
plot(median(L_int).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
% with old matlab other format necessary
title({'reverse interface'})
ylabel('Count')
%subtitle('reverse interface')

subplot(4,2,4);
histogram(W_int);  hold on;
plot(median(W_int).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
% with old matlab other format necessary
title({'reverse interface'})
%subtitle('reverse interface')

subplot(4,2,5);
histogram(L_nn);  hold on;
plot(median(L_nn).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
ylabel('Count')
% with old matlab other format necessary
title({'normal fault'})
%subtitle('normal fault')

subplot(4,2,6);
histogram(W_nn);  hold on;
plot(median(W_nn).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
% with old matlab other format necessary
title({'normal fault'})
%subtitle('normal fault')

subplot(4,2,7);
histogram(L_ss); hold on;
plot(median(L_ss).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
ylabel('Count')
xlabel('Length [km]')
% with old matlab other format necessary
title({'strike-slip fault'})
%subtitle('strike-slip fault')

subplot(4,2,8);
histogram(W_ss); hold on;
plot(median(W_ss).*ones(size(yy)), yy, 'r--');
axis([0 100 0 200]);
xlabel('Width [km]')
% with old matlab other format necessary
title({'strike-slip fault'})
%subtitle('strike-slip fault')

%sgtitle({'Source dimensions for different faulting regimes','for Mw 7.0 event'}) 
