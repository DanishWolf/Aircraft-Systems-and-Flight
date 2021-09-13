function mu = flight_plan(t)
    
    if t < 20
        mu = 0;
        
    elseif t > 20 && t < 56.4
        mu = -0.01*(pi/180);
        
    elseif t > 56.4 && t < 80.6
        mu = 0.015*(pi/180);
        
    elseif t > 80.6 && t < 90.4
        mu = 0;
        
    elseif t > 90.4 && t < 100.4
        mu = -0.01*(pi/180);
        
    elseif t > 100.4 && t < 104.4
        mu = 0;
        
    elseif t > 104.4 && t < 117.2
        mu = 0.015*(pi/180);
        
    elseif t > 117.2 && t < 135
        mu = 0;
        
    elseif t > 135 && t < 138.4
        mu = 0.04*(pi/180);
        
    elseif t > 138.4 && t < 146
        mu = 0;
        
    elseif t > 146 && t < 149.5
        mu = 0.04*(pi/180);
        
    else
        mu = 0;
    end
end