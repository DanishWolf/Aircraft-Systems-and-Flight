%% Import Data
close all
clear, clc

addpath('EGB243SupportingFiles')

F1 = importdata('Flight4.csv');
F2 = importdata('Flight6.csv');
F3 = importdata('Flight9.csv');
F4 = importdata('Flight11.csv');
F5 = importdata('Flight13.csv');
F6 = importdata('Flight17.csv');
F7 = importdata('Flight25.csv');

%% Change data to SI units
%Converting the ground speed from knots to m/s
F1.data(:,1) = F1.data(:,1)*0.5144;
F2.data(:,1) = F2.data(:,1)*0.5144;
F3.data(:,1) = F3.data(:,1)*0.5144;
F4.data(:,1) = F4.data(:,1)*0.5144;
F5.data(:,1) = F5.data(:,1)*0.5144;
F6.data(:,1) = F6.data(:,1)*0.5144;
F7.data(:,1) = F7.data(:,1)*0.5144;

%Converting the altitude from feet to m
F1.data(:,2) = F1.data(:,2)*0.3048;
F2.data(:,2) = F2.data(:,2)*0.3048;
F3.data(:,2) = F3.data(:,2)*0.3048;
F4.data(:,2) = F4.data(:,2)*0.3048;
F5.data(:,2) = F5.data(:,2)*0.3048;
F6.data(:,2) = F6.data(:,2)*0.3048;
F7.data(:,2) = F7.data(:,2)*0.3048;

%% Plotting
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

