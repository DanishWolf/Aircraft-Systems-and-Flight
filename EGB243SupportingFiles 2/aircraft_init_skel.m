function [x, u] = aircraft_init_skel(t, init)
%AIRCRAFT_INIT Generates an empty state vector and input
%   Input:
%       t: time vector that the simulation will be run over
%       xs: X starting position in the world (m)
%       ys: Y starting position in the world (m)
%       zs: Z starting position in the world (m)
%       fv: Forward velocity (m/s)
%       vv: Vertical velocity (m/s)
%       hdg: Heading (rad)
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
%           3) Heading (rad)

%     x0 =  %TODO: fill the state vector x0 based on the init structure
      
    x = zeros(length(t),length(x0));    
    x(1,:) = x0;
      
%     u = %TODO: fill the initial control input based on the states and
%     allocate the necessary space based on the time vector.

end