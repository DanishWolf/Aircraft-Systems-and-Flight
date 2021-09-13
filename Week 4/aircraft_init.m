function [x, u] = aircraft_init(t, init)
%AIRCRAFT_INIT Generates an empty state vector and input
%   Input:
%       t: time vector that the simulation will be run over
%       init (struct) with initial values of:
%           x
%           y
%           z
%           v_forward - forward velocity
%           v_vertical - vertical velocity
%           heading
%   Output:
%       x: State vector (with length t)
%           1) X position (m)
%           2) Y position (m)
%           3) Z position (m)
%           4) X velocity (m/s)
%           5) Y velocity (m/s)
%           6) Z velocity (m/s)
%           7) Roll angle (rad)
%           8) Pitch angle (rad)
%           9) Yaw angle (rad)
%           10) Roll rate (rad/s)
%           11) Pitch rate (rad/s)
%           12) Yaw rate (rad/s)
%       u: Control input vector
%           1) Forward velocity (m/s)
%           2) Vertical velocity (m/s)
%           3) Roll angle (rad/s)

    x0 = [init.x; ... x pos
          init.y; ... y pos
          init.z; ... z pos          
          init.v_forward*cos(init.heading); ... x vel
          init.v_forward*sin(init.heading); ... y vel
          init.v_vertical; ... z vel
          0; ...  roll ang
          0; ...  pitch ang
          init.heading; ...yaw ang
          0; ... roll rate
          0; ... pitch rate
          0];   %yaw rate
      
    x = zeros(length(t),length(x0));
    x(1,:) = x0;
      
    u0 = [init.v_forward; ...
        0; ...
        0];
    
    u = zeros(length(t),length(u0));
    u(1,:) = u0;
end