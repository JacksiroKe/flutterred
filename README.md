# flutterred - A new Flutter project.

## Getting Started

### Splash Screen
A splash Screen is in the app that pauses the app for at least 5 seconds.

### Home Screen
This home screen incorporates an actionbar, side menu drawer. The menu items are:
1. Info.
2. Design.
3. Response.
4. Dictionary.

### General Screens Behaviour
When the menu items are clicked respective screens are opened that updates the actionbar title with a back button on the action button in which the initial screen being the info screen.

## The Info Screen
The info screen has a form that captures a user basic information namely:
1. Full name.
2. Email address.
3. Phone number.

A submit button is at the bottom of the form which when clicked does the following actions:
* Checks if all the info has been entered as required otherwise it will provide a warning via a snackbar showing what is needed.
* Saves the information via use of shared preferences to be shown in the design screen.
* Shows a snackbar with a message of success.
* The Design screen is navigated into after the snackbar showing.

## The Design Screen
This is the screen that is navigated into after the information from the Info screen has been saved. It has basically two cards:
1. User's Name and a placeholder of the user avatar.
2. User's contact information which is basically the phone number and email address.

## The Response Screen
This is a screen with a custom progress indicator and a list view. On navigating to it the screen shows an empty grey space save for the loader that shows somewhere at the center until information from an api call: https://jsonplaceholder.typicode.com/todos?_limit=5 is returned.
If nothing is returned then a error message will be shown on the screen. 
If there is no internet connectivity also an appropriate message will show on the screen via a dialog box with two buttons: Okay Got it and Retry. The Retry button actually initiates the api request.

## The Dictionary Screen
This is a screen with one single card showing a sorted array in form a list in an ascending order. The array is:

```
Dictionary = {'34': 'thirty-four', '90': 'ninety',
'91': 'ninety-one''21': 'twenty-one',
'61': 'sixty-one', '9': 'nine',
'2': 'two', '6': 'six', '3': 'three',
'8': 'eight', '80': 'eighty', '81': 'eighty-one',
'Ninety-Nine': '99', 'nine-hundred': '900'}
```

Download the apk to this app from 