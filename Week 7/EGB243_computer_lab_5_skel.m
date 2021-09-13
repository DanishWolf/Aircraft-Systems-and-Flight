%% Preamble and Configuration
addpath('../EGB243SupportingFiles') % Makes the supporting functions available 
% to Matlab by adding the path to the Matlab Search Path for this session 
% (it gets removed when matlab is closed).

%% Parameters
% Time
dt = 5e-2;  % Time step
tf = 50;    % Final time

% Time vector
t = 0:dt:tf-dt;
num_samples = length(t);

% Starting Flight Conditions
u0 = 275;               % Equilibrium/Trim Point velocity 	(m/s)

%%%%%%% Velocity Notes %%%%%%%
% [Mach 0.158, 54.2m/s]
% [Mach 0.5, 175m/s]
% [Mach 0.8, 275m/s]
% Velocity Conversions
% 1/ms = 1.94kts
% 1kts = 0.514m/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c = loadparam('B747');

% Starting State
pos_start = [0;         % Starting X (m)
             0;         % Starting Y (m)
             -1000];    % Starting Z (m)
         
% We have most of the states coming from the longitudinal and lateral models 
x0_lon = [0 ...     % u - forward velocity
    0 ...           % w - vertical velocity
    0 ...           % q - pitch rate
    deg2rad(0) ...  % theta - pitch angle 
    ];

x0_lat = [0 ...   % v - lateral velocity
    0 ...         % p - roll rate
    0 ...         % r - yaw rate
    0 ...         % phi - roll angle
    ];

X_lon = [x0_lon; zeros(num_samples-1,length(x0_lon))];
X_lat = [x0_lat; zeros(num_samples-1,length(x0_lat))];

% Starting input
u_lon = [0 ... % elevator
        0  ...  % thrust
        ];
u_lat = [0 ... % rudder
        0  ...  % aileron
        ];
  
% We need to simulate the longitudinal and lateral dynamics then rotate
% those to states in the world frame

% Simulating
% longitudinal dynamics - euler integration
for i = 2:length(t)
    %TODO change the control input
    dX = dynamics_lab4_lon(X_lon(i-1,:)',u_lon',c,u0);
    X_lon(i,:) = X_lon(i-1,:) + dt*dX';
end

% lateral dynamics - euler integration
for i = 2:length(t)
    %TODO change the control input
    dX = dynamics_lab4_lat(X_lat(i-1,:)',u_lat',c,u0);
    X_lat(i,:) = X_lat(i-1,:) + dt*dX';
end
DX = [X_lon X_lat]; % combining both models

%TODO call the flight_body2world_rot function to rotate the simulated states
% to world frame measurements and complete the remaining tasks of the lab
% sheet.

y = flight_body2world_rot_skel(dX, t, u0, pos_start); %calling the function

