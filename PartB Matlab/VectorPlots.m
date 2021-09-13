function [u, v, x, y] = VectorPlots(struct)
%The following for loop samples the seven flights to obtain meaningful
%plots. If the full sets of data were used, the vector arrows become
%indistinguishable and the graph is unreadable.

t = length(struct.data);
sample = floor(t/50);

%In this case, 50 evenly spaced sample from each flight are being taken
for i = 1:50
    struct.data2(i,1) = struct.data(i*sample,1) .* sin(deg2rad(struct.data(i*sample,3)));
    struct.data2(i,2) = struct.data(i*sample,1) .* cos(deg2rad(struct.data(i*sample,3)));
    struct.data2(i,3) = struct.data(i*sample,5);
    struct.data2(i,4) = struct.data(i*sample,4);
end

u = struct.data2(:,1);
v = struct.data2(:,2);
x = struct.data2(:,3);
y = struct.data2(:,4);
end

