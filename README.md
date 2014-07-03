#Robot

Robot is a Robot replica simulator that moves on a tabletop, of the dimensions 5 units x 5 units.
for more details check the specification document.


#Installing

This app can be in multiple waysas explained below:

If you have [Git](http://git-scm.com/downloads), you can clone the project from [Git](http://git-scm.com/downloads) using below steps:
   
    git clone https://github.com/vinaykumarkas/Robot.git 
    cd Robot
    bundle install

	Or use "Clone to Desktop" button on http://github.com/vinaykumarkas/Robot 
	instead of git clone https://github.com/vinaykumarkas/Robot.git 
	
If you dont have [Git](http://git-scm.com/downloads), you can Download the project using "Download ZIP" button from [http://github.com/vinaykumarkas/Robot](http://github.com/vinaykumarkas/Robot)


####Note
Ensure you have [Ruby 1.9.3](http://www.ruby-lang.org/en/downloads/) or [RVM](https://rvm.io/rvm/install/) installed on your computer.


#Testing
Once installation is completed using above steps, you can test the application using the Spec tests that are included as part of application testing framework.

* You can execute all the tests by using rake:
	    
    	CD to Robot folder (project root folder)
    	$
    	$ rake

* You can execute each Spec class using below command:
	    
    	CD to spec folder (project root folder)
    	$
    	$ rspec robot_spec.rb
    	...............
    
    	Finished in 0.014 seconds (files took 0.40104 seconds to load)
    	15 examples, 0 failures

#Running

Below are the steps that specify how to execute the Robot program.

###Commanding Robot interactively
	
	$ ruby lib/robot_replica.rb
	Please command the Robot:
	PLACE 0,0,NORTH
	MOVE
	REPORT
	0,1,NORTH
	MOVE
	MOVE
	MOVE
	REPORT
	0,4,NORTH
	MOVE
	MOVE command ignored because robot may fall off the tabletop
	EXIT
	Exiting the Robot program .... Good Bye !!

###Commanding Robot with list of commands from file
Commands can also be executed from a file. List all the commands that has to be executed in a TXT file (one command for a line) and input this file to the robot replica class as given below
	
	example:
	If commands are listed in commands.txt
	$
	$ cat commands.txt | lib/robot_replica.rb
	

##Commands

Listed below are the details of commands that can be used to move/command Robot Replica.

####PLACE
Place the robot on the table with co-ordinates X &Y and facing

	example:
    PLACE 1,2,EAST

valid facings:

	NORTH
    SOUTH
    EAST
    WEST

####LEFT
Robot turns left from the existing position

	command:
    LEFT

####RIGHT
Robot turns right from the existing position

	command:
    RIGHT

####REPORT
Displays the position of the Robot and Orientation

	example:
    REPORT (issue this command)
    0.4.NORTH (will display this)

####EXIT
Aborts the execution of the program

	command:
    EXIT (issue this command)
    	Exiting the Robot program .... Good Bye !! (will return this message and exit execution)
	