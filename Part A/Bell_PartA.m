%% Importing Polar and Operating Points
clear, clc

Simulated = importdata('Polar.txt', ' ', 7);
OP = importdata('OperatingPoints.txt', ' ', 6);

%% Plotting Simulated Values

figure (1)
set(gcf,'color','w');
sgtitle('Simulated Data')

subplot(2,2,1)
plot(Simulated.data(:,1), Simulated.data(:,2)) %Plotting CL vs alpha

ylim([-0.5 1.5]); xlim([-10 10]);
ylabel('C_L'); xlabel('\alpha (deg)')
title('C_L vs \alpha')
grid on

subplot(2,2,2)
plot(Simulated.data(:,1), Simulated.data(:,3)) %Plotting CD vs alpha

ylim([0 0.15]); xlim([-10 10]);
ylabel('C_D'); xlabel('\alpha (deg)')
title('C_D vs \alpha')
grid on

subplot(2,2,3)
plot(Simulated.data(:,1), Simulated.data(:,5)) %Plotting Cm vs alpha

ylim([-0.15 0.1]); xlim([-10 10]);
ylabel('C_m_,_c_/_4'); xlabel('\alpha (deg)')
title('C_m_,_c_/_4 vs \alpha')
grid on

subplot(2,2,4)
plot(Simulated.data(:,3), Simulated.data(:,2)) %Plotting CL vs CD

ylim([-0.5 1.5]); xlim([0 0.15]);
ylabel('C_L'); xlabel('C_D')
title('C_L vs C_D')
grid on


%% Importing Practical Data
% Importing concatenated pracitcal data
Data = importdata('PracticalData.txt', '\t', 1) ;

chord = 0.13;
c4 = chord/4;
span = 0.25;
S = span*chord;

%% Processing Data
% Creating struct using the imported data for the averages
PracticalData.colheaders = Data.colheaders;

% Averaging the data at each pitch angle
for i = 0:10
    
    d = i * 5;
    
    for j= 1 : 6
        PracticalData.data(i+1,j)= mean(Data.data([1+d,2+d,3+d,4+d,5+d],j)) ;
    end
end

% Moving the Pitching Moment
% Mref = Mbc - Fn(xbc - xref) - reference point is quarter chord

PracticalData.colheaders{1,7} = 'Mref';

xbc = 0.08287;
xref = c4;

for i = 1:11
    Mbc = PracticalData.data(i,5);
    Fn = PracticalData.data(i,2);
    
    Mref = Mbc - (Fn*(xbc - xref));
    
    PracticalData.data(i,7)= Mref;
end

%% Practical Coefficients

rho = 1.225; % density of air at sea level
V = PracticalData.data(:,1); % Velocity of air

% Dynamic pressure: q = 0.5*rho*(V.^2)
q = PracticalData.data(:,4)*1000;

alpha = PracticalData.data(:,6);
Fn = PracticalData.data(:,2);
Fa = PracticalData.data(:,3);

L = Fn.*cosd(alpha) + Fa.*sind(alpha); % Lift Force - Normal force
D = Fn.*sind(alpha) + Fa.*cosd(alpha); % Drag Force - Axial force
M = PracticalData.data(:,7); % Moment - Mref

Cl = L ./ (q * S);
Cd = D ./ (q * S);
Cm = M ./ (q * S * chord);

% Calculating and compiling the coefficients into a struct
Practical.colheaders = Simulated.colheaders(1,[1,2,3,5]);
for i = 1:11
    Practical.data(i,1) = alpha(i,1); % Adding Alpha
    Practical.data(i,2) = Cl(i,1);
    Practical.data(i,3) = Cd(i,1);
    Practical.data(i,4) = Cm(i,1);
end


%% Plotting Practical Data

figure (2)
set(gcf,'color','w');
sgtitle('Practical Data')

subplot(2,2,1)
plot(Practical.data(:,1), Practical.data(:,2)) %Plotting CL vs alpha

ylim([-0.5 1.5]); xlim([-10 10]);
ylabel('C_L'); xlabel('\alpha (deg)')
title('C_L vs \alpha')
grid on

subplot(2,2,2)
plot(Practical.data(:,1), Practical.data(:,3)) %Plotting CD vs alpha

ylim([0 0.15]); xlim([-10 10]);
ylabel('C_D'); xlabel('\alpha (deg)')
title('C_D vs \alpha')
grid on

subplot(2,2,3)
plot(Practical.data(:,1), Practical.data(:,4)) %Plotting Cm vs alpha

ylim([-0.15 0.1]); xlim([-10 10]);
ylabel('C_m_,_c_/_4'); xlabel('\alpha (deg)')
title('C_m_,_c_/_4 vs \alpha')
grid on

subplot(2,2,4)
plot(Practical.data(:,3), Practical.data(:,2)) %Plotting CL vs CD

ylim([-0.5 1.5]); xlim([0 0.15]);
ylabel('C_L'); xlabel('C_D')
title('C_L vs C_D')
grid on


%% Specific Simulated

SimulatedReduced.colheaders = Simulated.colheaders(:,[1,2,3,5]);

SimulatedReduced.data = Simulated.data([2 98 201 297 395 496 590 690 789 890 989],[1,2,3,5]);

%% Plotting Simulated Values

figure (3)
set(gcf,'color','w');
sgtitle('Specific Simulated Data')

subplot(2,2,1)
plot(SimulatedReduced.data(:,1), SimulatedReduced.data(:,2)) %Plotting CL vs alpha

ylim([-0.5 1.5]); xlim([-10 10]);
ylabel('C_L'); xlabel('\alpha (deg)')
title('C_L vs \alpha')
grid on

subplot(2,2,2)
plot(SimulatedReduced.data(:,1), SimulatedReduced.data(:,3)) %Plotting CD vs alpha

ylim([0 0.15]); xlim([-10 10]);
ylabel('C_D'); xlabel('\alpha (deg)')
title('C_D vs \alpha')
grid on

subplot(2,2,3)
plot(SimulatedReduced.data(:,1), SimulatedReduced.data(:,4)) %Plotting Cm vs alpha

ylim([-0.15 0.1]); xlim([-10 10]);
ylabel('C_m_,_c_/_4'); xlabel('\alpha (deg)')
title('C_m_,_c_/_4 vs \alpha')
grid on

subplot(2,2,4)
plot(SimulatedReduced.data(:,3), SimulatedReduced.data(:,2)) %Plotting CL vs CD

ylim([-0.5 1.5]); xlim([0 0.15]);
ylabel('C_L'); xlabel('C_D')
title('C_L vs C_D')
grid on


SimulatedReduced.data(:,7) = SimulatedReduced.data(:,4) .* q * S * chord;
