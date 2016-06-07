%Name :Rohan Singh Rajput EEL_5667
% Question Number = 3

clc;
clear;
close all;
rng(0);
% Intializing
theta1 = linspace(.2,.9,5); theta2 = linspace(0.3,0.9,5);a1 = 2;a2 = 3;v = length(theta1);
figure;
% Starting Loop
for i =1:v
    
   %Ctreate Jaccobian function
    J = [ (-a1)*sin(theta1(i))-(a2*sin(theta1(i)+theta2(i))),(-a2)*sin(theta1(i)+theta2(i)) ;
        a1*cos(theta1(i))+a2*cos(theta1(i)+theta2(i)), a2*cos(theta1(i)+theta2(i))];
   %Implementing Single Value Decomposition 
    A = (inv(J*J'));[V,D] = eig(A);Diagonal(:,:,i) = diag(D);time_steps = 0:pi/15:2*pi;
    %Plotting the Ellipse
    X = cos(time_steps) /sqrt(D(1,1));Y  = sin(time_steps) /sqrt(D(2,2));ellip(:,:,i) = inv(V')*[X;Y];
    
    ellip(1,:,i) = ellip(1,:,i)+a1*cos(theta1(i))+a2*cos(theta1(i)+theta2(i));
    ellip(2,:,i) = ellip(2,:,i) + a1*sin(theta1(i))-a2*sin(theta1(i)+theta2(i));
    % Plotting begins
    plot(ellip(1,:,i),ellip(2,:,i),'color', 'b');
    
    hold on
    
end
axis([-8,8,-8,8]);

% Seperating bigger and small ellipse
[~,biggest] = max(Diagonal(1,:,:));[~,smallest] = min(Diagonal(1,:,:));
% Plot Bigger as green
plot(ellip(1,:,biggest),ellip(2,:,biggest),'color', 'g');
%Plot smaller as red
plot(ellip(1,:,smallest),ellip(2,:,smallest),'color', 'r');

grid on
hold off






