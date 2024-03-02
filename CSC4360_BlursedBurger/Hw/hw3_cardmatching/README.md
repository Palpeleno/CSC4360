# hw3

A new Flutter project.

## Getting Started

Objective: The objective of this assignment is to create a Flutter card-matching game that combines
animation and state management. Students will build a game where players need to match pairs of cards.
In this assignment, you will create a Flutter card-matching game. Players will be presented with a grid of
face-down cards, and they must flip the cards to find matching pairs.
Requirements:
1. Create a Flutter Project:
    • Start a new Flutter project using your preferred development environment
2. Design the User Interface:
    • Design a user interface that includes a grid of face-down cards (e.g., 4x4 or 6x6 grid).
    • Each card should initially display a back design (e.g., a common pattern or image).
    • You can use GridView or other Flutter widgets to create the card grid.
3. Implement State Management:
    • Use a state management approach (e.g., Provider) to manage the game state.
    • Define a data model for the cards, including properties for their front and back designs,
and their current state (face-up or face-down).
4. Card Flipping Animation:
    • Implement an animation that flips the cards from face-down to face-up and vice versa
when tapped.
    • Utilize animation widgets like AnimatedBuilder or AnimatedContainer to create the flip
animation effect.
5. Game Logic:
    • Implement the game logic to track which cards are currently face-up and face-down.
    • When a player taps two face-down cards, check if they match. If they do, keep them face-
        up; otherwise, flip them face-down again.
6. Win Condition:
    • Implement a win condition to check if all pairs have been matched. When all pairs are
        matched, display a victory message.
7. Testing:
    • Run the app on an emulator or physical device.
    • Verify that players can flip the cards to find matching pairs.
    • Test the win condition and display a victory message when the game is wons

## dev ops

make stateful class for animations : animated builder/ animated container per card, 
class for storing cards as a list
option for number of matching cards to have determining the lvl of difficulty 
using opacity, box deceoration as to select 
logic mainly boolean to select and determine matching or none matching cards

timer limit?, number of attempts to match giving limit to how many times you can match cards




