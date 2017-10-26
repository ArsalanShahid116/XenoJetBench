# XenoJetBench: An open source hard-real-time multiprocessor benchmark
---------------------------
### XenoJetBench Benchmark Version 2.0 (beta)

(c) Copyright 2016 -- Arsalan Shahid & Yasir Qadri <br/>
(arsalan.shahid @ ucdconnect.ie, yasirqadri @ acm.org) <br/>

### BACKGROUND

Information on JetBench and XenoJetBench Benchmark, can be found <br/>
in the following publications: <br/>
  
[1]	M. Y. Qadri, D. Matichard, and K. D. M. Maier, "JetBench: An <br/>
Open Source Real-time Multiprocessor Benchmark," in ARCS 2010 <br/>
- Architecture of Computing Systems, Hannover, Germany, 2010. <br/>
    
### INSTALLATION

This benchmark is completely designed to run on linux. Because of <br/>
the bad clock precision, time results will not be good on Windows <br/>
system. XenoJetBench requires Installation of Xenomai API on linux. <br/>


### How to compile XenoJetBench?

  To compile XenoJetBench benchmark, you need the OpenMp library <omp.h>.
	It is supported by the gcc compiler since the version 4.2. 
	Moreover as previously mentioned you would need Xenomai patched 
	with linux kernel as it is hard-real-time programming framework. 
	To compile it first install 'make' package on your linux version using: 
		
shell$ sudo apt-get install make <br/>
shell$ make <br/>

Following sample shows successful compilation: 

	================================================ 
	gcc -Wall -g -fopenmp -I/usr/include/xenomai -D_GNU_SOURCE -D_REENTRANT 
	-D__XENO__ XenoJetBench.c -Xlinker -rpath -Xlinker /usr/lib -lnative 
	-L/usr/lib -lxenomai -lpthread -lrt -o XenoJetBench 
	Benchmark compilation Successful 
	Use [ make clean ] to clear compilation 
	================================================ 

	Make sure the header file is in the same folder before doing it. 
	The header file contain all variables and also some things you 
	can change like the number of thread and calculation precision.
	Once you have changed it, compile it to run jetsim. 
	For all other compiler, read the specifications to include the 
	OpenMp library. 


### How to run XenoJetBench?

	XenoJetBench is a jet engine simulator. It contains 3 types of engines: 
		1-Turbojet 
		2-Turbojet with afterburner 
		3-Turbofan 

shell$ source run.sh
	
	The default engine is set to be 1 (Turbojet) while running XenoJetBench. 
	You can change it from 'run.sh' file. Below is a sample result file that 
        will be generated while benchmark execution. 

============================================== <br/>

XenoJetBench: An Open Source Hard-Real-Time Multiprocessor Benchmark <br/>

engine 1 : Turbojet is selected <br/>

 ==> Starting JetBench Execution <br/>

T,ExecTime,  Spd| Alt |  Thr| Mach|Press| Temp| Fnet|Fgros|RamDr|FlFlo|TSFC|Airfl|Weight|Fn/W <br/>
0,0.019031,    0|    0|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82 <br/>
     31.7% used for point 1<br/>
0,0.018389,  100|    0|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     30.6% used for point 2<br/>
0,0.017046,  200| 1000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.4% used for point 3<br/>
0,0.017036,  300| 2000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.4% used for point 4<br/>
0,0.017212,  300| 3000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.7% used for point 5<br/>
0,0.017210,  300| 4000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.7% used for point 6<br/>
0,0.016368,  300| 5000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.3% used for point 7<br/>
0,0.016367,  300| 6000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.3% used for point 8<br/>
0,0.016284,  300| 7000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.1% used for point 9<br/>
0,0.016285,  300| 8000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.1% used for point 10<br/>
0,0.016615,  300| 9000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.7% used for point 11<br/>
0,0.016617,  350|10000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.7% used for point 12<br/>
0,0.019485,  350|15000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     32.5% used for point 13<br/>
0,0.019492,  400|20000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     32.5% used for point 14<br/>
0,0.017139,  450|25000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.6% used for point 15<br/>
0,0.017139,  500|30000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.6% used for point 16<br/>
0,0.016636,  600|30000|100.0|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.7% used for point 17<br/>
0,0.016635,  600|30000| 66.7|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.7% used for point 18<br/>
0,0.016278,  600|25000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.1% used for point 19<br/>
0,0.016278,  600|20000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.1% used for point 20<br/>
0,0.016378,  600|15000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.3% used for point 21<br/>
0,0.016378,  500|15000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.3% used for point 22<br/>
0,0.016397,  400|15000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.3% used for point 23<br/>
0,0.016399,  400|10000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.3% used for point 24<br/>
0,0.018349,  300|10000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     30.6% used for point 25<br/>
0,0.017076,  285| 9000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.5% used for point 26<br/>
0,0.017075,  270| 8000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     28.5% used for point 27<br/>
0,0.016441,  255| 7000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.4% used for point 28<br/>
0,0.016440,  240| 6000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.4% used for point 29<br/>
0,0.016334,  225| 5000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.2% used for point 30<br/>
0,0.016334,  210| 4000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.2% used for point 31<br/>
0,0.016308,  195| 3000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.2% used for point 32<br/>
0,0.016308,  180| 2000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.2% used for point 33<br/>
0,0.016428,  165| 1000| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.4% used for point 34<br/>
0,0.016428,  150|    0| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     27.4% used for point 35<br/>
0,0.017936,  150|    0| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82<br/>
     29.9% used for point 36<br/>

==> Ending XenoJetBench Execution <br/>

0,0.017935,  150|    0| 55.6|0.000|14.69| 59.0| 6825| 6825|    0| 5689|0.83| 72.7|493.90|13.82 <br/>
     29.9% used for point 37<br/>

==> Ending XenoJetBench Execution <br/>

XenoJetBench Successfully Terminated <br/>
-------------------------------------<br/>

==> Results<br/>
    Total execution time is : 0.314242 with 0 missed deadline<br/>
    Which represents 28.3% of<br/>
    Real time used : 1.050000<br/>
    Number of threads : 2<br/>
    Number of points : 37<br/>

    XenoJetBench Start time : 1461498450.430740 secs<br/>
    XenoJetBench End time : 1461498450.766760 secs<br/>
    Total Benchmark time : 0.336020 secs<br/>

Press ctrl+C to EXIT XenoJetBench <br/>
 
========================================================<br/>

Make sure the folder contains the file "input.txt". If it is missing <br/>
you will have a segmentation fault. This file contains profile <br/>
caracteristics in this order:<br/>
        Speed Altitude Throtle Deadline_time<br/>
	0<Speed<1500 mph<br/>
	0<Altitude<50000 ft<br/>
	45<Throtle<90 \B0 (angle)<br/>
	time>0 sec<br/>


