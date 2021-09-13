%% EGB 243 Assignment Part B,
% Part 1
% Import Data Tables

F4 = readmatrix('Flight4.csv');
F6 = readmatrix('Flight6.csv');
F9 = readmatrix('Flight9.csv');
F11 = readmatrix('Flight11.csv');
F13 = readmatrix('Flight13.csv');
F17 = readmatrix('Flight17.csv');
F25 = readmatrix('Flight25.csv');

%% Converting from Imperial to Metric (S.I.)
% Convert Ground Speed (Knots --> m/s)
% 1 Knot = 0.514444 m/s
F4(:,1) = F4(:,1)*0.514444;
F6(:,1) = F6(:,1)*0.514444;
F9(:,1) = F9(:,1)*0.514444;
F11(:,1) = F11(:,1)*0.514444;
F13(:,1) = F13(:,1)*0.514444;
F17(:,1) = F17(:,1)*0.514444;
F25(:,1) = F25(:,1)*0.514444;

% Convert Altitude ( Feet --> m)
% 1 Foot = 0.3048 m
F4(:,2) = F4(:,2)*0.3048;
F6(:,2) = F6(:,2)*0.3048;
F9(:,2) = F9(:,2)*0.3048;
F11(:,2) = F11(:,2)*0.3048;
F13(:,2) = F13(:,2)*0.3048;
F17(:,2) = F17(:,2)*0.3048;
F25(:,2) = F25(:,2)*0.3048;

%% Plot Longitude vs Latitude
%Plotting lat vs long
figure (1)
set(gcf,'color','w'); %Sets overall background colour
plot(F1.data(:,5), F1.data(:,4),...
    F2.data(:,5), F2.data(:,4),...
    F3.data(:,5), F3.data(:,4),...
    F4.data(:,5), F4.data(:,4),...
    F5.data(:,5), F5.data(:,4),...
    F6.data(:,5), F6.data(:,4),...
    F7.data(:,5), F7.data(:,4))

ylim([-27.45 -27.34]); xlim([153.1 153.2]);
ylabel('Latitude (deg)'); xlabel('Longitude (deg)')
title('Flight Trajectories')
legend('Flight 1', 'Flight 2','Flight 3','Flight 4','Flight 5','Flight 6','Flight 7')
grid on

%Plotting altitude vs time
figure (2)
set(gcf,'color','w'); %Sets overall background colour

hold on
plot(F1.data(:,2), 'b')
plot(F2.data(:,2), 'g')
plot(F3.data(:,2), 'm')
plot(F4.data(:,2), 'k')
plot(F5.data(:,2), 'r')
plot(F6.data(:,2), 'y')
plot(F7.data(:,2), 'c')
hold off

%ylim([-27.45 -27.34]); xlim([153.1 153.2]);
ylabel('Altitude (m)'); xlabel('Time (s)')
title('Flight Altitudes')
legend('Flight 1', 'Flight 2','Flight 3','Flight 4','Flight 5','Flight 6','Flight 7')
grid on

