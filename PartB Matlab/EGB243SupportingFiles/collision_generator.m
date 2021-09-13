function [ xa, ua, xb, ub ] = collision_generator( t, tcol, ang, alt1, alt2, v1, v2 )
%COLLISION_GENERATOR Summary of this function goes here
%   Detailed explanation goes here

	alt1 = alt1 + (10*rand(1) - 5);
	alt2 = alt2 + (10*rand(1) - 5);

    pa = [v1*tcol; 0]; % Point of collision A
    pb = [v2*tcol; 0]; % Point of collision B

    R = [cos(ang), -sin(ang);...
         sin(ang),  cos(ang)];
    sb = pa - R*pb; % Starting point of B to ensure collision

    [xa, ua] = aircraft_init(t,0,0,alt1,v1,0,0);
    [xb, ub] = aircraft_init(t,sb(1),sb(2),alt2,v2,0,ang);

end

