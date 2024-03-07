# cw5_2dracesim

A new Flutter project.


## project ideas
    - horizontal game
    - consider using time like the Stopwatch class 


## Getting Started
Mobile App Dev
CW-05 - Due: 03/10/2024 @11:59 pM

Title: Creating a Rocket Racing Game with Flame in Flutter
Objective: The objective of this project is to develop a 2D racing game using the Flame game engine in Flutter. Participants will learn how to utilize Flame's features to create dynamic gameplay elements such as player control, collision detection, and game state management. By the end of this project, participants will have obtained a practical experience in game development with Flutter and Flame.
Group Option: You have the choice to work in teams of two. If you choose this option, please form your teams and collaborate effectively. Both team-members need to submit and please create a
simple text file with First and Last Name.

Individual Option: Alternatively, you can work individually on the project.

Submission Instructions:
Project Files: Please submit your APK file and the main Dart file to the assigned Dropbox folder. 
My game dev ops is to make a game similar to the 1982 game Pole Position, Ayrton Senna's Super Monaco Grand Prix II and NES game F-Zero. 
My game will have concepts similar to formula 1, with track layout, number of laps, sectors,  fuel consumption, speed, braking(slow down), DRS, tire ware, lap/race timing, track limits, obstacles like other drivers, drain covers and track hazards/ debris.
Consider making a map for the track that separates the track as is in formula 1 layout of sectors and turns. 
a separate dart file for user car control and physics, car selection, timer, random hazards for maps, difficulty and game assets for these objects.









Activity Steps:
Project Setup:
Create a new Flutter project using flutter create.
Add the Flame package as a dependency in the pubspec.yaml file.
Designing the Game Screen:
Design the game screen layout using Flame's Game widget.
selection screen for 
tracks
cars
teams/drivers
user defined name for team
difficulty
fuel consumption, starting amount
number of hazards
Set up a background with a night sky theme to create an immersive environment for the game.
for testing the track can be “space”, or a nascar left turn circuit.
My end idea is to use the track layout of a formula 1 grand prix testing with the formula 1 street circuit in Monaco 2024.
Implementing car Selection:
Allow players to select different kinds of rockets at the start of the game.
selecting from 1 of 4 cars in car assets
Create a UI for car selection, showcasing different car options.
Implement functionality to switch between different cars during gameplay in the pits.
Implementing the Player car:
Create car sprites to represent the player's vehicle.
in assets/img/racecars2d
Implement player control using Flame's input handling capabilities (e.g., touch or accelerometer).
stearing with mouse/ 360 degree touch wheel
brake and accelerator bar/throttle 
drs button, pits button, pause, restart, counters for all these variables
Allow the player to move the rocket horizontally to avoid obstacles.
with 360 degree stearing wheel to turn left and right
brake and accelerator to forward and backwards
Car Launch Countdown and Animation:
Integrate a countdown timer at the start of the game to build anticipation. 
like in formula 1 count down start as 0 out of 5 red lights, once all are relights are lit, they turn off announcing the start of the race with an audible sound to each light turning on.
Implement a launch animation for the player's rocket, providing visual feedback before the game starts.
introduce tire smoke particles making it difficult to see the track and other hazards, and fire exhaust








Generating Obstacles:
Generate obstacles that the player must navigate around.
obstacles include hazards on track
other drivers
drain covers(broken)
track limits/ boundaries
oil slicks
wet areas
Implement obstacle movement and spawning logic to create dynamic gameplay.
procedural generation of above mentioned obstacles/ hazards
Collision Detection:
Implement collision detection between the player car and obstacles.
End the game if the player collides with an obstacle, displaying a game over screen.
determine what happens when collision with hazards
cars and track barriers/ limits
cause crash 
other hazards cause slow down
drain covers(broken)
oil slicks
wet areas
Scoring System:
Implement a scoring system to track the player's progress.
track number of laps and include a % of track completion
timing of how long driven on track
Display the player's score on the game screen, updating it as the game progresses.
score kept as timing
with interactions with hazards or track limits causing increased time
Game Over Screen:
Create a game over screen that is displayed when the player crashes into an obstacle.
wreck screen for race suspension
better luck next time: COD-MW2
you died screen from dark souls/ elden ring
Allow the player to restart the game from the beginning.
allow race restart from menu
Audio Effects:
Add audio effects for car movement, collisions, and other game events to enhance the gaming experience.
sound changes with throttle and braking 
start of race light countdown sounds
finish race fireworks/ Final fantasy victory sound
Testing and Debugging:
Test the game thoroughly to ensure that player controls, obstacle generation, collision detection, and scoring work as expected.
Debug any issues and fine-tune the gameplay for optimal performance.
