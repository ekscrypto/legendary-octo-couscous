# legendary-octo-couscous
Technical Interview Project

# Requirements
Bit manipulation:
Write a small app, that given 2 integers (X and Y) would calculate the number of bits that will need to be changed in order to convert X into Y. For example if your method is passed integers 11 and 15 then calculation should return a 1.
* One screen; with 2 edit field for input numbers
* “Calculate” button
* When user presses “Calculate” app would display result

# Design Decisions

## UIKit
Given that technical project (1) for parsing strings was done in SwiftUI, I figured showcasing UIKit
might be more appropriate.

## Storyboard
Storyboards are friendly to a very small team of developers but as the project grows conflicts in the
storybaord files will arise and those conflicts are much harder to fix than in typical Swift code.

I purposefully removed the default storyboard and converted the app to use only code generated
interfaces.

