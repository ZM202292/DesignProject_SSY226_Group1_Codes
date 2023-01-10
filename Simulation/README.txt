*******************************************************************************************
This simulation is the first step of developing a method how test data will be used to 
get friction model
*******************************************************************************************


For simulation, we want to check effect of steering angle on velocity.
The friction model parameters k1,k2,k3 and k4 can be updated in parameters.m

output = velocity. Input = Steering angle

1. Update parameters in parameters.m and run this file
2. Run data_generator_auto.m

NOTE: data_generator_auto.m will automatically generate plots for velocity vs time for different steering angles. From these plots,
      velocity points at fixed time interval can be noted for different steering angles.

3. For a fixed delta velocity, note times for steering and non-steering cases in Data_log.xls
4. Calculate Fs and Ft accoding to formulas given in Data_log.xls
5. Input these values in ModelPlotFinalReport.m to get Friction models in straight line and turns.


NOTE: This whole procedure can be more automated. For example instead of manually noting the time intervals, it can probably be done
      automatically, and then excel sheet won't be needed. This automatically generated data can be given to ModelPlotFinalReport.m 
      to get plots.


*******************************************************************************************
For TEST VALIDATION in SIMULINK
*******************************************************************************************
1. Update parameters in parameters.m to extracted friction model parameters from test data
2. Change the starting velocity and steering angles (SA) in data_generator_auto.m.
3. Similar method as above can be done to note the data points to plot. Just make sure to pick the values according to the test data