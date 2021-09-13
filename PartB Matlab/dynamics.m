function dX = dynamics(t,x0,sys,U) 
    V = U(1); epsilon = U(2);       
    mu = flight_plan(t);
    
    [m, g, T, L, W] = sys{:};       

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
