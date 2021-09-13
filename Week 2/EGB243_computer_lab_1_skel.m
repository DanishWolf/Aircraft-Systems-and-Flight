%% Preamble and Configuration
addpath('../EGB243SupportingFiles') % Makes the supporting functions available 
% to Matlab by adding the path to the Matlab Search Path for this session 
% (it gets removed when Matlab is closed).

close all
%% Elementary Operations
% Vectors
A = [2 4 6 8 10 12 14]  % Vector elements are contained between '[' and ']'
A = [2 4 6];            % ';' supresses the output in the Command Window

C = 1:10;               % ':' defines a sequence (or 'slice' when indexing)
D = 11:20;

a = 2; b = 2; c = 14;   % Scalar variables; Commands can be on the same line
A = 2:2:14;             % Starts with a, ends with c, elems separated by b

% Matrices
M = [1 2 3; 4 5 6; 7 8 9]; % ';' delimits lines
M = [1 2 3; ...            % '...' lets the command continue in the next line
    4 5 6;  ...
    7 8 9];

M = [C;D]
N = M'                 % ' transposes a vector/matrix
N = [C';D']            % notice the difference 

n = 2; m = 2^2;        % '^' is the power operator
ones(n,m);             % n by m matrix of ones
zeros(n,m);            % n by m matrix of zeros

% Indexing
c = C(1:5)             % ':' slices when indexing
d = D(1:5)

c = C(:)               % ':' alone returns all elements
C(5) = 50;             % Indexing is useful for assignment

C = M(1,:)             % returns all elements of line 1

% Math operations
A = [1 2]*[1 2]'       % vector-by-vector product
A = [1 2].*[1 2]       % element-wise product      

A = [1 2; 3 4]; B = [5 6; 7 8];
C = A*B               % matrix product
C = A.*B              % element-wise product

%% Polynomials
p_roots = [2 2]
p = poly(p_roots)     % x^2 - 4*x + 4 

%% Functions
dt = 0.1;           % time interval between samples
t = 0:dt:6;         % time vector
x = sin(t*2*pi);    % Matlab has many built-in functions
y = sin(t*pi);

% There are also 'user-defined' functions that is possible to create. Check
% the 'loadparam.m' file in the '../EGB243SupportingFiles/' folder.

%% Structures 
Str.t = t;          % Structs group different variables in the one object
Str.x = x;          % ideal for using as parameters for functions
Str.y = y;

%% Graphical Representations
figure(1)
    stairs(Str.t,Str.x,'b','linewidth',2) % suitable for discrete signals
    hold on
    plot(Str.t,Str.y,'r--')               % connects the data points
    hold off
    legend('sin(t)','cos(t)')
    title('Plot 1')
    ylabel('V'); xlabel('t');

%% Program Control/Logic Statements
for i = 1:length(t)                     % for-loop
    if Str.x(i) < 0                     % if condition
        Str.x(i) = -Str.x(i);
    else                                % else condition
        Str.x(i) = 0.5*Str.x(i);
    end
end
figure(2)
    stairs(Str.t,Str.x,'b','linewidth',2)
    hold on
    plot(Str.t,Str.y,'r--')
    hold off
    legend('sin(t)','cos(t)')
    title('Plot 1')
    ylabel('V'); xlabel('t');

%% Read/write operations
tt = 0:0.1:1;
signal = [zeros(1,10) tt ones(1,10) -tt+1 zeros(1,10)];
writematrix(signal,'data.txt')
% Take a look at the file to see how Matlab stored the signal

x = readmatrix('data.txt'); % read a file with delimited values
figure(3)
    plot(x); 
    axis([0 60 -0.2 1.2]);
    grid on

%% Task 1 - Elementary Operations
A = [0 2 -8; 3 5 4; -1.5 -1 1]; B = [4 4 0; 1 4 0; -1 -2 2];
a = -2; b = 2;
v = [1 3 2]'; w = [3; 1; 0];

%TODO: Calculate the following
% 1.1 Dot product between v and w
vw = v.*w;

% 1.2 Create a matrix X extracting the first column of A and second column 
%     of B
X = [A(:,1),B(:,2)];

% 1.3 x=(AB)^-1
x = (A.*B)^-1; % Finds the inverse of the dot product

% 1.4 Eigenvalues and eigenvectors of B (hint: search the documentation)
[V,D] = eig(B);  % D - eigenvalues matrix, V - eigenvectors matrix

%% Task 2 - Functions
% Modify the 'quadratic_skel.m' function that finds the roots of the quadratic 
% equation a*x^2 + b*x + c
a = 2;
b = 10;
c = 15;
%c = 5;

%TODO: call the function here, assigning its output to the variable 'rootz'
%      and passing parameters a,b,c
rootz = quadratic_skel(a,b,c);

rootz

%% Task 3 - Graphical Representations
% TODO: modify the last function so it automatically plots the quadratic
% function and marks its roots. (don't forget labels and title)

%% Task 4 - Control Statements
% TODO: modify the last function so it returns an error when the roots are
% imaginary
