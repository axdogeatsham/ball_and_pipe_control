# Ball and Pipe Control System
MATLAB code to open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom. The height of the ball contained in the pipe is calculated and displayed by a time of flight sensor on top of the cylinder. The objective is to communicate with the system to balance the ball at a target altitude. 


## Overview of Project

The goal for this project was to control a ball and pipe system using MATLAB and a control system of our choice. The ball and pipe system consists of a ping pong ball which is the object being moved, a PWM fan at the bottom of the pipe which is used to control the altitude of the ball, and an IR distance sensor used to track the height of the ball. For our control system, we decided to use the Linear Quadratic Regulator (LQR) which is a control method that focuses on minimizing the cost and time to reach a desired state. To interface with the ball and pipe system, a series of commands were transmitted by the MATLAB code as defined by the SCFBA Specification Sheet document.

## Theory of Control Method (Linear Quadratic Regulator)

The Linear Quadratic Regulator (LQR) is an optimal control method based on state space representation. In other words, the LQR is a full state feedback controller where gain matrix "K" is specifically computed. The regulator provides optimal feedback gains to enable the use of a closed loop stable and high performance system. The optimal K-value is found by choosing how well the system is doing, based on both system performance and the actuator's effort. The "Q" and "R" in LQR are weights attached to system performance and actuator effort that influences the cost function. Then solving the LQR problem will return the gain matrix "K" that returns the lowest cost from the cost function calculations. The "Q" penalizes bad performance while the "R" penalizes actuator effort. The cost function is a quadratic function meaning that there will always be a minimum value.



## How to run code

In order to run the code, one will have to do a few things.
  
 1) Set the COM ports
  
 2) Actually Running the Code

### Set the COM Ports

First, plug the ECLC USB cable into your computer and make sure it recognizes the connection. After this, open up the device manager (if on Windows) and find the COM port associated with the Ball & Pipe system. To find the connected COM port in device manager, press the "Ports" dropdown from the list, showing the different connections. In this dropdown there will be a sublist of COM ports to be selected, select the port associated with the Ball & Pipe system you connected to earlier and note the COM port number listed next to it in parenthesis. The next step is to set the Baud rate of the corresponding port you found in the previous step. To do this, right click on the port, then click properties > port settings > baud rate > "19200". After this, one needs to set the com port in the real_world code. Located on line 13 of the "real_world.m" file, change "COM6" to the com port associated with the ball & pipe system for your computer you found earlier. After this step, the user may move on to actually running the code and make use of the connected ports. 


### Actually Running the Code

To actually run the code, one has to type "real_world" into the MATLAB console located on the bottom of the program and press enter to start. Additionally, to stop the code and run again, one has to type "clear device" into the MATLAB console before running "real_world" once again using the previous step. Once the code is running properly with the right connections established, you should be able to see it in action controlling the ball in the pipe.
