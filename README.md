# :satellite: MARS ROVER :satellite:

##Thoughtworks Tech Assignment

As part of the ThoughtWorks application process, I have been asked to complete the 'Mars Rover' kata. In building the Mars Rover app, I intend to demonstrate my current development ability. In particular I'd like to showcase my knowledge of areas such as Test Driven Development (TDD), Object-Oriented Programming (OOP), design principals of OOP such as the Single Responsibility Principle (SRP), encapsulation and dependency management, and design patterns, which can be used to increase adherence with these principals.

##The Problem

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

####Input:

- The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.
- The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.
- The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.
- Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

####Output:

 The output for each rover should be its final co-ordinates and heading.

####Input and Output

**Test Input:**

  5 5  
  1 2 N  
  LMLMLMLMM  
  3 3 E  
  MMRMMRMRRM  

**Expected Output:**

  1 3 N  
  5 1 E  

In the administration of our assessments, ThoughtWorks strives to provide an equal testing opportunity for all candidates. Therefore, we will provide reasonable adjustment to our standard test taking procedures for applicants who have a documented disability within the meaning of the Equality Act. Please let us know when we contact you to schedule the assessments if you require any reasonable adjustment to the standard test taking procedures.

Copyright 2012 ThoughtWorks, Inc

##Installation

Unzip 'mars-rover.zip' and using the terminal, access the directory that has been created.

  `$ cd mars-rover`

This Mars Rover application makes use of the Bundler gem. This gem provides a consistent environment for ruby projects, further information and documentation can be found [here](http://bundler.io/). If you haven't already done so, run the following command to install the Bundler gem.

  `$ gem install bundler`

Make use of the Bundler gem and set up a local environment equivalent to the one used to build the app.

  `$ bundle install`

You can now run the following commands:

  `$ rspec`

or

  `$ rake`

provides a printout of the testing suite, the Rakefile also runs the spec files as it's default command. The final line of test output provides a percentage of the program covered by the tests which currently sits at 100.00%.

  `$ rubocop`

to see any differences between the projects code and the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)

  `$ rake run`

to run the application using an input file ('./input/test_input.text'), which contains the test input commands defined in the problem.

If you like, you can alter this input to see different outputs, if you do so please use the first line of the file to define a plateau size, then group landings an movements in pairs:

  ```
  Integer Integer                     # Plateau size commands.
  Integer Integer Direction           # Location of landing and direction you would like the rover to face.
  MovementMovementMovementMovement    # Movement commands in a non-spaced string, made up of either 'L', 'M' or 'R'.
  ```

output should appear in the following format:

  ```
  $ Rovers position: Integer Integer Direction    # The new position the rover has moved to following your commands.
  ```

##The Design

The primary purpose of the project has been to demonstrate development skills. With this in mind, the Ruby programming language has been chosen for the project since it's the language I am most comfortable with.

###Assumptions

In order to complete the task, certain assumption where needed.

1. Descriptive errors will be raised with incorrect input, but the user has sufficient understanding of the program to put in suitable input.
2. Users can land multiple rovers on the same coordinate.
3. Users are aware of the plateau size and therefore do not drive rovers off the edge.

###Approach

####User Stories
On receiving the problem, it became clear that a process was required to break the task down into manageable parts. Considering that the problem appears to be designed to mimic a client's requirements, one method for doing this is User Stories. A User Story describes what a program is required to do, from the perspective of someone using that program. A User Story, therefore, gives strong indication of the messages and objects required from the program. These messages and objects are fundamental to OOP.

Analysis of each sentence of the assignment has meant that, by using the Stakeholder/Motivation/Action format, it has been possible to construct User Stories. From these User Stories, it has then been possible to construct a table of Messages and Domain Objects. Consider the following example:

**The sentence**

*A squad of robotic rovers are to be landed by NASA on a plateau on Mars.*

**The Stakeholder:**

*NASA*

**The Motivation:**

*To have a robotic rover on a Mars plateau*

**The Action:**

*Land a robotic rover on a plateau on Mars*

**The constructed User Story:**

*As a NASA controller,
So that I can have a robotic rover on a Mars plateau,
I would like to be able to land a Mars Rover on a plateau.*

**The table of Messages and Domain Objects**

|Messages       |Domain Objects |
|---------------|---------------|
|               |NASA Controller|
|Land a rover   |Mars Rover     |
|               |Plateau        |

Above each User Story is the sentence that has formed the basis for its development.

**User Story One:**
*A squad of robotic rovers are to be landed by NASA on a plateau on Mars.*
```
As a NASA controller,
So that I can have a robotic rover on a Mars plateau,
I'd like to be able to land a Mars Rover on the plateau.
```

**User Story Two:**
*This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.*
```
As a NASA controller,
So that I can navigate a plateau,
I'd like a navigation system with a Mars Rover.
```

**User Story Three:**
*This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.*
```
As a NASA controller,
So that I can send a complete view of the terrain back to earth,
I'd like to control the on-board camera.
```

**User Story Four**
*A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points.*
```
As a NASA controller,
So that I know whereabouts on the plateau the rover is,
I'd like the rover to have two co-ordinates and a cardinal heading."
```

**User Story Five**
*In order to control a rover, NASA sends a simple string of letters... ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot.*
```
As a NASA controller,
So that I can rotate the rover,
I'd like to send a simple string of letters which rotate it.
```

**User Story Six**
*In order to control a rover, NASA sends a simple string of letters... ‘M’ means move forward one grid point, and maintain the same heading.*
```
As a NASA controller,
So that I can advance the rover,
I'd like to send it a simple string of letters which move it forward.
```

####Test Driven Development
Test Driven Development (TDD) starts with a test. The first test is an automation test, which to begin with fails. The next step is to write a failing unit test followed by the simplest code required to pass that unit test. Continuing down this path leads to writing more failing unit tests and passing them with the simplest code possible until the original automation test passes. This was the path followed when developing the Mars Rover application.

Once the test passes, opportunities arise to refactor code. Refactoring code largely involves simplifying methods often by extracting new methods. This can then lead to extracting new classes which all lead to greater adherence with the Single Responsibility Principle.

####Design Patterns
As mentioned earlier, in completing the task, design patterns where used to reduce dependencies and increase encapsulation.

For instance, by putting each direction into it's own class makes it much easier to add new directions at a later date and change existing directions, if required. On top of this, it encapsulates each direction, which allows other objects to make use of the same class. This can be seen in the Camera class which makes use of the same Direction classes to set its state as the RoboticRover does. These classes are making use of aspects from both the Command Design Pattern and the StateDesign Pattern.

Each direction is set up as a sub-class of the Direction class with implements all of the methods each direction implements, except each method returns the NotImplementedError. This is taking advantage of the Template Method Design Pattern and means each direction defaults to returning a descriptive error, unless the method is implemented. New designers who wish to add new directions can now get descriptive errors if they miss an implementation.

####Extraction of classes
Attempting to reduce chances of breaking the Law of Demeter, now and in the future, has lead to the extraction of as many classes as possible. An additional advantage to this is that it allows the removal of long conditionals and switch statements. For future designers, this can cause problems in understanding the purpose of the code.

####Running the app
In order to make it as easy as possible to run the application I have included a rake file which makes use of an 'app.rb'. This class pulls together all user interaction with the application and places it in easy to understand methods. It also makes use of an InputInterpreter class that can read an input text file.

###Further Improvements

Ideally, time permitting, I would have liked to implement a lot more error handling, such as when the rover drives of the edge of the plateau.

Future improvements could also include naming arguments for classes that depend on user input. This removes argument order dependancies, which is probably the weakest part of the application.

One opinion that I hold is that Regex is fairly hard to read and doesn't lead to clear purpose of code. Returning to the application at a later date, I'd like to see if I could come up with a way to remove the Regex that I have used.
