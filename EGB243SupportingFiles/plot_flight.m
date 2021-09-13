function plot_flight( t, x, vp )
%PLOT_FLIGHT Plays back a simulation of a plane
%   Input:
%
%       t:  The time vector (N) used
%       x:  The states (MxN) of the aircraft as listed below
%       vp: A 3 element vector to set the axis viewport size
%
%   States:
%       Position X
%       Position Y
%       Position Z
%       Velocity X
%       Velocity Y
%       Velocity Z
%       Roll
%       Pitch
%       Yaw
%       Roll Rate
%       Pitch Rate
%       Yaw Rate

%% Load in the model
[model.v, model.f, model.n, model.c, model.stltitle] = stlread('plane.stl');
model.c(:,1) = 1;
model.v = model.v/250; % Model is imported in mm

%% Figure conf 
S.fh = figure('keypressfcn',@f_capturekeystroke,...
              'CloseRequestFcn',@f_closecq);      
guidata(S.fh,S)
%% Plotting
S.closed = 0;
x=x';
for i = 1:5:length(t)   % For every (fifth) step in the time sequence
    
    disp(['t: ', num2str(t(i))])

    r = x(7,i);
    p = x(8,i);
    y = x(9,i);

    R_yaw = [cos(y), -sin(y), 0;...
             sin(y), cos(y), 0;...
             0, 0, 1];
    R_pitch =  [cos(p), 0, sin(p);...
                0, 1, 0;...
                -sin(p), 0, cos(p)];
    R_roll =  [1, 0, 0;...
               0, cos(r), -sin(r);...
               0, sin(r), cos(r);];

    verts = (R_yaw*R_pitch*R_roll*(model.v'))';

    verts(:,1) = verts(:,1) + x(1,i);
    verts(:,2) = verts(:,2) + x(2,i);
    verts(:,3) = verts(:,3) + x(3,i);

    if ~isvalid(S.fh)
        break
    else
        figure(S.fh);
    end
    
    clf;

    hold on;
    patch('Faces',model.f,'Vertices',verts,'FaceVertexCData',model.c,'EdgeColor','r');
    plot3(x(1,1:i),x(2,1:i),x(3,1:i),'r');  % Flight path
    hold off;

    axis('equal');
    axis([x(1,i)-vp(1),x(1,i)+vp(1),x(2,i)-vp(2),x(2,i)+vp(2),x(3,i)-vp(3),x(3,i)+vp(3)]);
    view(45, 45);
    grid on;

    drawnow

    %Slow down the simulation display for large time steps ???
    if i < length(t)
        dt = t(i+1) - t(i);
        if dt > 0.1
            pause(dt)
        end
    end
end
delete(gcf)
end

function  f_capturekeystroke(H,E)          
    % captures key strokes, checking for ESC
    if strcmp(E.Key,'escape')
        close(H);
    else
        return
    end
end
 
 function f_closecq(src,callbackdata)
    % On Figure close: prompts user for confirmation.
    selection = questdlg('Stop animation?','Close Request Function','Yes','No','Yes'); 
    switch selection
      case 'Yes'
         S.fh.WindowSyle='normal';
         delete(gcf)
      case 'No'
      return 
    end
end
