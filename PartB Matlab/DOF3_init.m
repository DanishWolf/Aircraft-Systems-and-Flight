function [x, u] = DOF3_init(t, init)
%AIRCRAFT_INIT Generates an empty state vector and input
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

