# Ball and Pipe Control System
MATLAB codes to open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 


## Overview of Project

The goal for this project was to control a ball and pipe system using MATLAB and a control system of our choice. This project's goal was to control the height of a ball within a pipe using a fan which is controlled using PWM values. For our control system, we decided to use the Linear Quadratic Regulator (LQR) which is a control method that focuses on minimizing the cost and time to reach a desired state. 

## Theory of Control Method (Linear Quadratic Regulator)

The Linear Quadratic Regulator (LQR) is an optimal control method based on state space representation. In other words, LQR is a full state feedback controller where gain matrix K is specifically computed. The regulator provides optimal feedback gains to enable the use of a closed loop stable and high performance system. The optimal k value is found by choosing to judge how well the system is doing based off both system performance and the actuators effort. The "Q" and "R" in LQR are weights attached to system performance and actuator effort that influences the cost function. Then solving the LQR problem will return the gain matrix k that returns the lowest cost from the cost function calculation. The Q penalizes bad performance while the R penalizes actuator effort. The cost function is a quadratic function meaning that there will always be a minimum value.



## How to run code

In order to run the code, one will have to do a few things.
1)Set the COM ports
2)Actually run the code

###Set the COM ports
First, plug the ECLC USB cable into your computer. After this, open up device manager (if on Windows) and find the COM port associated with the Ball & Pipe system. To find the connected COM port in device manager, press the "Ports" arrow from the list which will show the different connections then in parenthesis, it will say what COM it is associated with. The next step is to set the Baud rate. To do this, right click on this port, then click properties, then port settings and set the baud rate to 19200. After this, one needs to set the com port in the real_world code. On line 13 of the "real_world.m" file, change COM6 to the com port associated with the ball & pipe system for your computer. 


### Actually Running the Code

To actually run the code, one has to type "real_world" into the MATLAB console. Additionally, to stop the code and run again, one has to type "clear device" into MATLAB console before running "real_world" once again. 
