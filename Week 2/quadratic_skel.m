function rootz = quadratic_skel(a,b,c)
  % Solves the quadratic a*x^2 + b*x + c = 0
    if nargin ~= 3
      error('wrong number of arguments')
    end    
    
    %% (Task 2) 
    %TODO: calculate the roots r1 and r2
    d = sqrt(b^2 - 4*a*c) / 2/(2*a);
    e = b/(2*a);    
    r1 = -e + d; % root 1
    r2 = -e - d; % root 2
    rootz = [r1; r2];  
    
    %rootz = roots([a,b,c]);
    
    %% (Task 3) 
    %TODO: plot the quadratic function
    x = (-10:10);
    y = (a.*x.^2 + b.*x + c);
    figure
    hold on
    plot(x,y)
% (Task 3)   
%   lim = max(abs(real(rootz)))*3;
%   x = -lim:0.1:lim;
%   p = a.*x.^2 + b.*x + c;    
%   hold off
%   plot(x,p,'linewidth',2); grid on
%   line([-lim lim], [0 0], 'color', 'k', 'linestyle', '--')
%   xlabel('x')
%   ylabel('y')
%   title(['Quadractic function: ' num2str(a) 'x^2 + '  num2str(b) 'x + ' num2str(c)])
    
    % (Task 3-a) 
%     lim = max(abs(real(rootz)))*3;
%     syms x
%     p = a*x^2 + b*x + c;    
%     hold off
%     fplot(p,[-lim lim],'linewidth',2); grid on
%     line([-lim lim], [0 0], 'color', 'k', 'linestyle', '--')
    % --- end   ---- %
    
    %% (Task 4) 
    %TODO: check if the roots are real and include them in the plot
    if  isreal(rootz)
        hold on
        plot(rootz(1),0,'r*'); plot(rootz(2),0,'b*');
    else
        warning('Roots are complex. They won''t show in the plot.');
    end 
end