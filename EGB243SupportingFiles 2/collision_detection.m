function [range ] = collision_detection(radius, t, varargin)
%COLLISION_DETECTION

    num_planes = length(varargin);
    col_map = zeros(num_planes,num_planes,length(t));
    range = zeros(num_planes,num_planes,length(t));

    for k = 1:length(t)
        for i = 1:num_planes
            planeA = varargin{i}(:,k);

            for j = 1:num_planes
                if i ~= j
                    planeB = varargin{j}(:,k);

                    range(i,j,k) = aircraft_range(planeA, planeB);
                    
               
                end
            end
        end
    end
end

