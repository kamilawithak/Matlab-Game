# CAPTCHA-Style Matching Game (MATLAB)

An interactive GUI-based game built in MATLAB that challenges users to identify objects matching a given category. 
Inspired by CAPTCHA-style visual selection tasks, the game dynamically updates graphics and game state based on user input.

## Overview
The game displays a matrix of objects (e.g., Dog, Apple, Summer). A prompt instructs the user to select all objects belonging to a specific category 
(such as “Select all fruits”). Correct selections disappear from the grid, and the game continues until all valid objects have been cleared.

## Features
- Dynamic grid-based graphics rendering
- Category-based object matching logic
- Real-time visual updates based on user input
- Difficulty scaling via grid size and object count
- Event-driven callbacks for user interaction

## How It Works
- The game initializes a matrix populated with randomly selected objects from multiple categories.
- A prompt displays the target category for the current round.
- User selections trigger callback functions that:
  - Validate the selected object against the target category
  - Update the game state
  - Remove correctly matched objects from the grid
  - Redraw the GUI in real time
- The round ends when the matrix is empty, signaling successful completion.

## Technologies Used
- MATLAB
- Matrix-based data structures
- Event-driven programming
- Custom graphics rendering

## Demo
A video demo of the application is available on my portfolio site:
https://go.osu.edu/kamilanieto

