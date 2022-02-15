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

## Factory
Not sure if your team use factory pattern, but wanted to introduce it into the project

## UI Testing with formatters and specific text values
BitDiffViewErrorMessages and BitDifResultFormatter are also imported into the UI test target for ease
of testing. Should coding guidelines prefer to use pre-formatted static text strings to compare against
this would definitely be easy to do.

# Licensing
The code in this repository is available under MIT license except the App Icon files.

App icon provided under limited distribution by Encoded Life Inc - DO NOT USE IN YOUR OWN PROJECTS

