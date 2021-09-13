%% Preamble and Configuration
addpath('../EGB243SupportingFiles') % Makes the supporting functions available 
% to matlab by adding the path to the Matlab Search Path for this session 
% (it gets removed when matlab is closed).
%% Parameters
% Time
tf = 30;   % Simulation duration
dt = 5e-2; % Time step (sampling time)
g = 9.80665;
m = 7990.0;
V = 100;
epsilon = 0;
mu = 0;
T = m*g;
L = m*g;
W = m*g;
sys = {m,g,T,L,W};

% Time vector
t = 0:dt:tf-dt;
num_samples = length(t);

% Aircraft initial parameters
init = struct('x', 0, ...        % Structure array of initial parameters
              'y', 0, ...
              'z', 200);
init.v_forward = 100;            % Forward speed [m/s]
init.v_vertical = 0;             % Climb speed [m/s] 
init.heading = 0;                % Airplane heading (yaw angle) [rad]

% The supporting function skeleton 'aircraft_init_skel.m' is provided.
% You should complete it so it intialises the states and input matrices,
% based on the initial inputs above, and sets x(:,1) to the initial 
% conditions of the airplane (init).
%TODO: call the function here to create the vectors 'x' and 'u'.
[X, u] = aircraft_init(t, init);

% Initial state vector (first column of the state matrix)
x0 = X(1,:);

% Initial input vector (V, angle of attack, roll angle)
u0 = [init.v_forward; 0; 0];


u = repmat(u0,1,num_samples); % Give the same input for the whole simulation
%Make the plane do an S-turn
% u(3,floor(num_samples/4):floor(num_samples/2)) = 0;
% u(3,floor(num_samples/2):floor(3*num_samples/4)) = -0.5;
% u(3,floor(3*num_samples/4)-2:num_samples) = 0;

%% Simulation (Euler integration)
opts = odeset('RelTol',1e-6,'AbsTol',1e-5);
[t,X] = ode45(@dynamics,[0 tf],x0,opts,sys,u0);

%% Plotting
close all
disp('Visualizing...')

vp = 2*[100, 100, 50]; % field of view
plot_flight(t, X, vp);
disp('Done!')

f2 = figure(2);
    plot3(X(:,1),X(:,2),X(:,3))
    axis('equal')
    ylabel('x (m)');
    xlabel('y (m)');
    zlabel('z (m)');
    grid on;
    view(3)
    
f3 = figure(3);
    clf; hold on;
    yyaxis left
    plot(t,X(:,9));
    ylabel('Heading (rad)');
    ylim([-max(abs(X(:,9)))-0.5,max(abs(X(:,9)))+0.5]);
    yyaxis right
    plot(t,X(:,12), '--');
    ylabel('Yaw Rate (rad/s)');
    ylim([-max(abs(X(:,12)))-0.5,max(abs(X(:,12)))+0.5]);
    hold off;
    grid on;    
    title('Flight Heading and Yaw Rate');
    xlabel('Time (s)');
    xlim([0,tf]);    

function mu = flight_plan(t)
% TEST 1
mu = 0;

% TEST 2
%mu=0.1*pi/180*sin(t);

% TEST 3
% if t<1   
%     mu=0.05*pi/180;
% elseif t>20 && t<21
%     mu=-0.05*pi/180;
% else
%     mu=0;
% end

end
    
function dX = dynamics(t,x0,sys,U) 
V = U(1); epsilon = U(2);
mu = flight_plan(t);

[m, g, T, L, W] = sys{:};       % as the parameters are passed as a cell-array
                                % we can reassign them into separated
                                % variables easily using {:}. You could
                                % also use structs but then it is necessary
                                % to use point indexing (m = sys.m).


x0c = num2cell(x0);
[x, y, z, u, v, w, phi, theta, psi, p, q, r] = x0c{:};




dx = u;
dy = v;
dz = w;
du = V*cos(theta)*cos(psi) - u;
dv = V*cos(theta)*sin(psi) - v;
dw = V*sin(theta)- w;
dphi = p;
dtheta = q;
dpsi = r;
dp = 0;
dq = V/m*((T*sin(epsilon)+L)*cos(mu)-W*cos(theta)) - q;
dr = V/m*cos(theta)*(T*sin(epsilon)+L)*sin(mu) - r;

dX = [dx;
    dy;
    dz;
    du;
    dv;
    dw;
    dphi;
    dtheta;
    dpsi;
    dp;
    dq;
    dr];
end