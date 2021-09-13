%% Preamble and Configuration
addpath('../EGB243SupportingFiles') % Makes the supporting functions available 
% to matlab by adding the path to the Matlab Search Path for this session 
% (it gets removed when matlab is closed).

%% (Task 1) Time vector 
%TODO: define total simulation time, time step and initialise the time 
% vector
tf = 5;   % Simulation duration
dt = 0.025; % Time step (sampling time)
t = 0:dt:tf-dt;
num_samples = length(t);

%% (Task 2) State and Input vectors 
%TODO: create vectors for the airplane's speed, yaw and pitch
v = 10*ones(1,length(t));
yaw = pi/180*[0*ones(1,length(t)/2) 45*ones(1,length(t)/2)];
yaw = [pi/180*(0)*ones(1,25)...
           pi/180*(90)*linspace(0,1,50) ...
           pi/180*(90)*ones(1,50) ...
           pi/180*(90)*linspace(1,0,50) ...
           pi/180*(0)*ones(1,25)]; % S-shape
pitch = pi/180*[10*ones(1,length(t)/2) 0*ones(1,length(t)/2)];

%TODO: initialise the state vectors (x,y and z) with the airplane position
x = zeros(1,length(t));
y = zeros(1,length(t));
z = [200 zeros(1,length(t)-1)];
%% (Task 3) Simulation 
%TODO: Simulate the 2D trajectory based on the speed and yaw vectors
% (hint: use a for-loop)
for i = 2:num_samples
    %TODO: Implement the 2D kinematic equations of motion for every sample
    x(i) = x(i-1) + dt*v(i-1)*cos(pitch(i-1))*cos(yaw(i-1));
    y(i) = y(i-1) + dt*v(i-1)*cos(pitch(i-1))*sin(yaw(i-1));
    z(i) = z(i-1) + dt*v(i-1)*sin(pitch(i-1));
end
%% (Task 4) Plotting 
%TODO: Plot the 2D (x,y) trajectory
f1 = figure(1); hold off
    plot3(x,y,z,'LineWidth',1); grid on
    title('3D trajectory');
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    axis equal

%TODO: Create a two-axis plot showing the airplane's yaw (left) and 
% x position (left) versus time.
f2 = figure(2); hold off
    clf; hold on;
    yyaxis left
    plot(t,yaw);
    ylabel('Yaw (rad)');
%     ylim([-200,800]);
    yyaxis right
    plot(t,x, '--');
    ylabel('x (m)');
%     ylim([-200,800]);
    hold off;
    grid on;
    
    title('Flight Yaw and Position in x');
    xlabel('Time (s)');
    xlim([0,tf]);
