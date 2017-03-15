# MarvelQuiz
An iOS App that uses the Marvel API to display characters.

## Snapshots

<img width="270" alt="home" src="https://cloud.githubusercontent.com/assets/11211914/20346506/a742977a-abfc-11e6-9569-f9aade23518a.png"><img width="270" alt="spiderman" src="https://cloud.githubusercontent.com/assets/11211914/20346505/a741d5a6-abfc-11e6-8be8-76fcada30adf.gif"><img width="270" alt="ironman" src="https://cloud.githubusercontent.com/assets/11211914/20346507/a746c32c-abfc-11e6-8595-cacea4d3b9c2.gif">

## Explanation
The Marvel Quiz is an Objective-C app builded during the Techdegree at <a href="https://teamtreehouse.com">Treehouse</a>

The goal was to develop an app in Objective-C using any API. I decided to choose the Marvel API becuse everyone likes atleast one Marvel's Hero.
To be clear, the App is a MVP with very low features. It just display all the 1500+ Marvel characters with image and description if they are aviable.
It takes the data form the <a href="https://developer.marvel.com">Marvel API</a>.

The main purpose of this project is to demonstrate proficiency with Objective-C even if my main language is Swift.


## Features

This is a list of the features:

1- Fetching Characters: you can display all the marvel characters ever created.

2- Fast Networking Requests: the app uses the <a href="https://developer.marvel.com">AFNetworking</a> library to send request to the API .

3- Character Details: you can read some details for any character you have selected.

4- Awesome comments: all the files are pretty commented and well documented, you can't lose yourself.

## How To Use

1- Download the repo, and execute `pod install` in the terminal in the root directory of the project.

2- You need API KEYs to use the app: you can get if from the <a href="https://developer.marvel.com">Marvel API Website</a>.

3- Once you have your API KEYs, open the *XcodeWorkspace* of the project, navigate to *NetworkManager.m* and where is:
```objective-c
///You should use you Public Key
static const NSString *PUBLIC_KEY = @"your key";

///You should use you Private Key
static const NSString *PRIVATE_KEY = @"your key";
```
you should insert your API KEYs.

4- Run the project into the simulator

## Future Implementation

1- The app will be re-coded in Swift.

2- Quiz part will be implemented.

3- Cache and core data will be implmented.

4- Transition from AFNetowrking to Alamofire.

5- More details for each character.

6- Sinitize for web string will be added.

7- A search bar for a fast filtering will be added into the characters list.

-----

Anyone is free to download and use this app for their projects.
It is strictly forbidden to use this base to create something for marketing purposes.
In addition anyone who decides to download this app is invited to create a new branch and share their code.

For any questions or problems, please contact me.
If you find bugs or problems, please report them.

## Techdegree's Instruction Project

>For this project you will create an app, written entirely in Objective-C, that makes use of CollectionViews, Asynchronous Networking, Gestures and Transitions. You can certainly incorporate other features and tools, but be sure you also make use of those four listed. In addition, the CollectionViewCells must be interactive in a meaningful way and networking should make use of proper error handling.

>You are free to pick a topic of your choice, but must make sure to showcase the topics listed above. Below are a few examples of potential apps to build, or places to start, though the sky’s the limit. We suggest picking a content area that excites you and will make for a good portfolio piece.

>A recipe app that retrieves recipes from an API and displays each recipe on a card in the collection view. Tapping on a card would transition to a larger view displaying the full recipe.

>An API-driven comics app utilizing Marvel’s API.

>A baseball card app where the cells in the collection view each represent a player, whose image and stats are pulled from an API. Tapping on an individual card would toggle between the statistics and the photo, like the front and back of a cardboard baseball card.

>An API-driven stock market app where cells represent particular stocks. Gestures could be used to display alternate views or data about the stocks.

>A personal restaurant review app that retrieves data about local restaurants from an API and allows users to add photos, comments, share with friends, etc...
