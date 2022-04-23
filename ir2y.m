function [y, pipe_percentage] = ir2y(ir)
%% Converts IR reading from the top to the distance in meters from the bottom
% Inputs:
%  ~ ir: the IR reading from time of flight sensor
% Outputs:
%  ~ y: the distance in [m] from the bottom to the ball
%  ~ pipe_percentage: on a scale of 0 (bottom of pipe) to 1 (top of pipe)
%  where is the ball
%
% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Conor Peterson, Mike Mulvihill and Sanjay Thallam 2/15/22

%% Parameters
ir_bottom = 956;  % IR reading when ball is at bottom of pipe
ir_top    = 60;  % IR reading when ball is at top of pipe
y_top     = 0.9144; % Ball at top of the pipe [m]

%% Bound the IR reading and send error message 
% (remeber the IR values are inverted ie small values == large height and large values == small height)

%% Set
ir;
irBound = max(min(ir, 956), 60); %Set the IR Bounds
pipe_percentage = 1-((irBound-ir_top)/(ir_bottom-ir_top)); %The percent that the ball is from the bottom of the pipe
y = y_top*pipe_percentage; %find the y height in meters
