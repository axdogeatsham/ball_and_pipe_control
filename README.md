# Ball and Pipe Control System
MATLAB codes to open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 


##Overview of Project

The goal for this project was to control a ball and pipe system using 

##Theory of Control Method




##How to run code

In order to run the code, one will have to do a few things.
1)Set the COM ports
2)Actually run the code

###Set the COM ports
First, plug the ECLC USB cable into your computer. After this, open up device manager (if on Windows) and find the COM port associated with the Ball & Pipe system. The next step is to set the Baud rate. To do this, right click on this port, then click properties, then port settings and set the baud rate to 19200. After this, one needs to set the com port in the real_world code. On line 13 of the "real_world.m" file, change COM6 to the com port associated with the ball & pipe system for your computer. 


###Actually Running the Code

To actually run the code, one has type "real_world" into the MATLAB console.
