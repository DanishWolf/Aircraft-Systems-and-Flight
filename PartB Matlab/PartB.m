close all
clear, clc

%% Part 1
%====================================
%% Import Data
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

%Changing column headers
F1.colheaders{1,1} = ('GroundSpeed(m/s)');
F1.colheaders{1,2} = ('Altitude (m)');

F2.colheaders = F1.colheaders ;
F3.colheaders = F1.colheaders ;
F4.colheaders = F1.colheaders ;
F5.colheaders = F1.colheaders ;
F6.colheaders = F1.colheaders ;
F7.colheaders = F1.colheaders ;

%% Plotting
%Plotting lat vs long
figure (1)
set(gcf,'color','w'); %Sets overall background colour
plot(F1.data(:,5), F1.data(:,4), 'b',...
    F2.data(:,5), F2.data(:,4), 'g',...
    F3.data(:,5), F3.data(:,4), 'm',...
    F4.data(:,5), F4.data(:,4), 'k',...
    F5.data(:,5), F5.data(:,4), 'r',...
    F6.data(:,5), F6.data(:,4), 'y',...
    F7.data(:,5), F7.data(:,4), 'c')

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

ylabel('Altitude (m)'); xlabel('Time (s)')
title('Flight Altitudes')
legend('Flight 1', 'Flight 2','Flight 3','Flight 4','Flight 5','Flight 6','Flight 7')
grid on

%% Finding Values
dt = 0.4; %Timestep

%Calculating the length of each flight (seconds)
t1 = dt * length(F1.data);
t2 = dt * length(F2.data);
t3 = dt * length(F3.data);
t4 = dt * length(F4.data);
t5 = dt * length(F5.data);
t6 = dt * length(F6.data);
t7 = dt * length(F7.data);

%% Direction of Circuit
% this section uses the quiver function to plot the direction of each
% velocity vector for the seven flights

% Setting the column headers
F1.colheaders2{1, 1} = 'u'; %x velocity
F1.colheaders2{1, 2} = 'v'; %y velocity
F1.colheaders2{1, 3} = 'x'; %x position (longitude)
F1.colheaders2{1, 4} = 'y'; %y position (latitude)

F2.colheaders2 = F1.colheaders2;
F3.colheaders2 = F1.colheaders2;
F4.colheaders2 = F1.colheaders2;
F5.colheaders2 = F1.colheaders2;
F6.colheaders2 = F1.colheaders2;
F7.colheaders2 = F1.colheaders2;

%Using a created function
[F1.data2(:,1), F1.data2(:,2), F1.data2(:,3), F1.data2(:,4)] = VectorPlots(F1);
[F2.data2(:,1), F2.data2(:,2), F2.data2(:,3), F2.data2(:,4)] = VectorPlots(F2);
[F3.data2(:,1), F3.data2(:,2), F3.data2(:,3), F3.data2(:,4)] = VectorPlots(F3);
[F4.data2(:,1), F4.data2(:,2), F4.data2(:,3), F4.data2(:,4)] = VectorPlots(F4);
[F5.data2(:,1), F5.data2(:,2), F5.data2(:,3), F5.data2(:,4)] = VectorPlots(F5);
[F6.data2(:,1), F6.data2(:,2), F6.data2(:,3), F6.data2(:,4)] = VectorPlots(F6);
[F7.data2(:,1), F7.data2(:,2), F7.data2(:,3), F7.data2(:,4)] = VectorPlots(F7);


figure (3)
set(gcf,'color','w'); %Sets overall background colour
hold on
quiver(F1.data2(:,3), F1.data2(:,4), F1.data2(:,1), F1.data2(:,2), 0.3, 'b')
quiver(F2.data2(:,3), F2.data2(:,4), F2.data2(:,1), F2.data2(:,2), 0.3, 'g')
quiver(F3.data2(:,3), F3.data2(:,4), F3.data2(:,1), F3.data2(:,2), 0.3, 'm')
quiver(F4.data2(:,3), F4.data2(:,4), F4.data2(:,1), F4.data2(:,2), 0.3, 'k')
quiver(F5.data2(:,3), F5.data2(:,4), F5.data2(:,1), F5.data2(:,2), 0.3, 'r')
quiver(F6.data2(:,3), F6.data2(:,4), F6.data2(:,1), F6.data2(:,2), 0.3, 'y')
quiver(F7.data2(:,3), F7.data2(:,4), F7.data2(:,1), F7.data2(:,2), 0.3, 'c')
hold off

ylabel('Latitude (deg)'); xlabel('Longitude (deg)')
title('Flight Trajectories')
legend('Flight 1', 'Flight 2','Flight 3','Flight 4','Flight 5','Flight 6','Flight 7')
grid on


%% Ideal circuit
GS = 65; %ground speed (m/s)
tf = 480;   % Simulation duration

[x, y, z] = TrafficCircuitFlight(GS, dt, tf);

figure (4)
set(gcf,'color','w'); %Sets overall background colour
hold on
plot3(F1.data(:,5), F1.data(:,4), F1.data(:,2))
plot3(F2.data(:,5), F2.data(:,4), F2.data(:,2))
plot3(F3.data(:,5), F3.data(:,4), F3.data(:,2))
plot3(F4.data(:,5), F4.data(:,4), F4.data(:,2))
plot3(F5.data(:,5), F5.data(:,4), F5.data(:,2))
plot3(F6.data(:,5), F6.data(:,4), F6.data(:,2))
plot3(F7.data(:,5), F7.data(:,4), F7.data(:,2))
plot3(x, y, z, 'm')
hold off

ylabel('Latitude (deg)'); xlabel('Longitude (deg)'); zlabel('Altitude (m)')
title('Flight Trajectories')
legend({'Flight 1', 'Flight 2','Flight 3','Flight 4','Flight 5','Flight 6','Flight 7', 'Target Flight'},'Location','east')
view(-65, 25)
grid on

%% Part 2
%====================================
%% 3DOF Model
%Setting new flight time and time step
tf = 200;
dt = 0.2;

%Calling the 3DOF simulation function, which outputs time vector t, and
%positioning vector X
[t, X] = DOF3(tf, dt);

%Time Steps between letters to show sky-writing
t1s = 1; t1f = 108;
t2s = 108; t2f = 420;
t3s = 420; t3f = 600;
t4s = 600; t4f = 820;
t5s = 820; t5f = 1000;

%Colors found using the uisetcolor function, to make the sky writing seem
%more normal
lightgrey = [0.998 0.998 0.998];
darkgrey = [0.651 0.651 0.651];
skyblue = [0.5686 0.9725 1];

%Plotting the skywriting with differentiation between the intended letter
%writing and the travel inbetween
figure(6)
set(gcf,'color','w'); %Sets overall background colour
set(gca,'Color',skyblue); %Sets graph background
hold on
plot3(X((t1s:t1f),1),X((t1s:t1f),2),X((t1s:t1f),3), 'r-', 'Color', darkgrey)
plot3(X((t2s:t2f),1),X((t2s:t2f),2),X((t2s:t2f),3), '*-', 'Color', lightgrey)
plot3(X((t3s:t3f),1),X((t3s:t3f),2),X((t3s:t3f),3), 'r-', 'Color', darkgrey)
plot3(X((t4s:t4f),1),X((t4s:t4f),2),X((t4s:t4f),3), '*-', 'Color', lightgrey)
plot3(X((t5s:t5f),1),X((t5s:t5f),2),X((t5s:t5f),3), 'r-', 'Color', darkgrey)
hold off

axis('equal')
ylabel('x (m)'); xlabel('y (m)'); zlabel('z (m)');
grid on;
view(3)
    

%% Part 3
%====================================






