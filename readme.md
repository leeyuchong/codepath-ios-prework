# Pre-work - Tippy

Tippy is a tip calculator application for iOS.

Submitted by: Yuchong Lee

Time spent: 4 hours spent in total

## User Stories

The following **required** functionality is complete:

* [√] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [√] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly (Slider instead of segmented control)

The following **optional** features are implemented:

* [√] UI animations
* [√] Remembering the bill amount across app restarts (if <10mins)
* [√] Using locale-specific currency and currency thousands separators.
* [√] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [√] Numerical keypad that dismisses when the user taps the screen
- [√] User defined color that is saved and used throughout the app
- [√] Adjustable default tip percentage
- [√] Dark mode toggle

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![](https://i.imgur.com/yJU2jvA.gif)

GIF created with [Ezgif](https://ezgif.com).

## Notes

An issue I repeatedly ran into was in incorrectly connecting the Interface Builder components to the IBOutlets or IBActions. I had to make sure that when I dragged a component from the Interface Builder to the code, I selected the View Controller instead of the View. 

Changing the accent color of the Settings screen was also challenging as I had to understand how the different views and navigation controller relate to each other. 

Setting up the picker for the currency select before I used the currency locale was also challenging as there was more code snippets that were required for it to work. 

## License

    Copyright [2021] [Yuchong Lee]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

    Design adapted from: https://dribbble.com/shots/5958896-Tip-Calculator-App