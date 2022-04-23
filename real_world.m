% A MATLAB script to control Rowans Systems & Control Floating Ball 
% Apparatus designed by Mario Leone, Karl Dyer and Michelle Frolio. 
% The current control system is a PID controller.
%
% Created by Kyle Naddeo, Mon Jan 3 11:19:49 EST 
% Modified by Sanjay Thallam Conor Peterson AND Michael Mulvihill. 2/8/2022

%% Start fresh
close all; clc; clear device; % this is used to reset the the device ports

%% Connect to device
% device = open serial communication in the proper COM port
device = serialport('COM6',19200); %connecting to the com port associated with ones computer

pwm = 0;
%% Parameters
target      = 0.8;   % Desired height of the ball [m]
sample_rate = 1;  % Amount of time between controll actions [s]

%% Give an initial burst to lift ball and keep in air
set_pwm(device, 4000); % Initial burst to pick up ball
pause(2) % Wait 0.1 seconds
[ir, ~, ~, ~]=read_data(device);
%set_pwm(s, 0); % Set to lesser value to level out somewhere in
% the pipe

%% Initialize variables
action      = 4000; % Same value of last set_pwm   
%% Feedback loop

while true
    %% Read current height 
    [ir, ~, ~, ~] = read_data(device); % get the IR reading from the sensor
    [y,~] = ir2y(ir); % Convert from IR reading to distance from bottom [m]
    error = target - y %calculate the error in the ball position

    [A, B, C, D]=findab(pwm-2727); %creat hte 
    %u is pwm
    x=C\(y-D*pwm-2727) %this is a calcualtion for the LQR we attempted to implement

     
    Q = [100,1]; %Q cost matrix (Time effort)
    Q = diag(Q); %Make the cost matrix into a diagonal array
    R = 1; %Cost for the R (Actuator effort)
    K = lqr(A, B, Q, R) %Run the LQR function


    pwm = min(4095,max(K(1),1000)); %figure out what pwm the fan will be set to
    action=set_pwm(device, pwm) %Send the new PWM value to the system
    pause(sample_rate); %wait until the next iteration.
end
