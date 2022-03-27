%% ImplicitAdaptationFigures
% This code is used to statistically analyze data output by BUMProcessor.m,
% and produce raw figures for data presentation
%
% By Charles Xu @ UCSD
%
%% Figure 1 - dot plot for relative error of exp 1 and 2
% Used data: allFinal allTarget
f1dot = figure('Name','dot plot for relative error of exp 1 and 2','NumberTitle','off');
hold on

% Plot exp 1
for i = 1:8
    x = linspace(1,210,210);
    y = allFinal{1,1}{1,i} - allTarget{1,1}{1,i};
    p1 = plot(x,y,'.','Color','#0072BD','MarkerSize',10);
end

% Plot exp 2
for i = 1:8
    x = linspace(1,210,210);
    y = allFinal{1,2}{1,i} - allTarget{1,2}{1,i};
    p2 = plot(x,y,'.b','Color','#D95319','MarkerSize',10);
end

xline([60 90],'--')
yline(0,'--')
xlim([0 210])
ylim([-70 70])
legend([p1,p2],{'Experiment 1','Experiment 2'})
hold off

%% Figure 1 - line plot for absolute error of exp 1 and 2
% Used data: allFinal allTarget
f1line = figure('Name','line plot for absolute error of exp 1 and 2','NumberTitle','off');
hold on

% Plot exp 1
y = zeros(1,210);
for i = 1:8
    y = y + abs(allFinal{1,1}{1,i} - allTarget{1,1}{1,i});
end
x = linspace(1,210,210);
y = y/8;
p1 = plot(x,y,'.-','Color','#0072BD','MarkerSize',10);

clear x y

% Plot exp 2
y = zeros(1,210);
for i = 1:8
    y = y + abs(allFinal{1,2}{1,i} - allTarget{1,2}{1,i});
end
x = linspace(1,210,210);
y = y/8;
p2 = plot(x,y,'.-','Color','#D95319','MarkerSize',10);

clear x y

xline([60 90],'--')
yline(0,'--')
xlim([0 210])
ylim([0 35])
legend([p1,p2],{'Experiment 1','Experiment 2'})
hold off

%% Figure 1 - distribution of relative error test phase of exp 1 and 2
% Used data
f1histRel = figure('Name','distribution of relative error during test phase of exp 1 and 2','NumberTitle','off');
hold on

x = [];
for i = 1:8
    rel = (allFinal{1,1}{1,i} - allTarget{1,1}{1,i});
    rel = rel(1,91:end);
    x = [x rel];
end
p1 = histogram(x,[-70:2:70]);

y = [];
for i = 1:8
    rel = (allFinal{1,2}{1,i} - allTarget{1,2}{1,i});
    rel = rel(1,91:end);
    y = [y rel];
end
p2 = histogram(y,[-70:2:70]);

xlim([-70 70])
ylim([0 200])
legend([p1,p2],{'Experiment 1','Experiment 2'})
hold off

clear x y

%% Figure 1 - 

%% Figure 2 - dot plot for relative error of exp 2 and 3
% Used data: allFinal allTarget
f2dot = figure('Name','dot plot for relative error of exp 2 and 3','NumberTitle','off');
hold on

% Plot exp 2
for i = 1:8
    x = linspace(1,210,210);
    y = allFinal{1,2}{1,i} - allTarget{1,2}{1,i};
    p1 = plot(x,y,'.','Color','#0072BD','MarkerSize',10);
end

% Plot exp 3
for i = 1:8
    x = linspace(1,210,210);
    y = allFinal{1,3}{1,i} - allTarget{1,3}{1,i};
    p2 = plot(x,y,'.b','Color','#D95319','MarkerSize',10);
end

xline([60 90],'--')
yline(0,'--')
xlim([0 210])
ylim([-70 70])
legend([p1,p2],{'Experiment 2','Experiment 3'})
hold off

%% Figure 2 - line plot for absolute error of exp 2 and 3
% Used data: allFinal allTarget
f2line = figure('Name','line plot for absolute error of exp 2 and 3','NumberTitle','off');
hold on

% Plot exp 2
y = zeros(1,210);
for i = 1:8
    y = y + abs(allFinal{1,2}{1,i} - allTarget{1,2}{1,i});
end
x = linspace(1,210,210);
y = y/8;
p1 = plot(x,y,'.-','Color','#0072BD','MarkerSize',10);

clear x y

% Plot exp 3
y = zeros(1,210);
for i = 1:8
    y = y + abs(allFinal{1,3}{1,i} - allTarget{1,3}{1,i});
end
x = linspace(1,210,210);
y = y/8;
p2 = plot(x,y,'.-','Color','#D95319','MarkerSize',10);

clear x y

xline([60 90],'--')
yline(0,'--')
xlim([0 210])
ylim([0 35])
legend([p1,p2],{'Experiment 2','Experiment 3'})
hold off

%% Figure 2 - distribution of relative error test phase of exp 2 and 3
% Used data: allFinal allTarget
f2histRel = figure('Name','distribution of relative error during test phase of exp 2 and 3','NumberTitle','off');
hold on

x = [];
for i = 1:8
    rel = (allFinal{1,2}{1,i} - allTarget{1,2}{1,i});
    rel = rel(1,91:end);
    x = [x rel];
end
p1 = histogram(x,[-70:2:70]);

y = [];
for i = 1:8
    rel = (allFinal{1,3}{1,i} - allTarget{1,3}{1,i});
    rel = rel(1,91:end);
    y = [y rel];
end
p2 = histogram(y,[-70:2:70]);

xlim([-70 70])
ylim([0 200])
legend([p1,p2],{'Experiment 2','Experiment 3'})
hold off

clear x y

%% Baseline vs test significance test for experiments 1-3
% Used data: allFinal allTarget
baseline = [];
NVF = [];
test = [];
for i = 1:8
    par = abs(allFinal{1,1}{1,i} - allTarget{1,1}{1,i}); % Compare between absolute errors
    parBaseline = mean(par(1,1:60));
    baseline = [baseline parBaseline];
    parNVF = mean(par(1,61:90));
    NVF = [NVF parNVF];
    parTest = mean(par(1,91:end));
    test = [test parTest];
end

% par = zeros(1,210);
% for i = 1:8
%     par = par + abs(allFinal{1,1}{1,i} - allTarget{1,1}{1,i});
% end
% par = par/8;
% baseline = par(1,1:60);
% NVF = par(1,61:90);
% test = par(1,91:end);

% Independent-samples t test between baseline and NVF
[exp1h1,exp1p1] = ttest2(baseline,NVF);

% Independent-samples t test between baseline + NVF and test
[exp1h2,exp1p2] = ttest2(baseline,test);




