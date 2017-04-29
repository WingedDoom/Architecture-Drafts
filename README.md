# Description

This project is a test project for prototyping the iOS app architecture.
It represents my view of a good iOS architecture, more specificly my view of how to organize **MVC** so that it won't be
Massive View Controller in an iOS app project.

# Why am I doing this

For the past several years I was trying to apply different architecture techniques to achieve following as good as possible:
- Non-overloaded code files
- Code reusability, readability and ease of testing, debugging, extending and modifying
- Ease of prototyping (do not want to spend much time thinking how to organize modules)
- Ease of implementing and maintaining the project later

There's a ton of hype on the topic. Lots of opinions, lots of articles. 
It became popular recently to blame Model-View-Controller architecture pattern recommended by Apple 
for being Massive View Controller. They recommend MVVM + Rx or VIPER. 

My point is VIPER tries to do too much. Yes, we get small code files, classes, structures and protocols,
but we also get redundant layers (like Presenter which only passes events and data from View to Interactor and back).
Besides, VIPER considers iOS' ViewControllers to be View, which sometimes conflicts with built-in classes like UITabBarController.
And there are much more.

I'm not suggesting that MVC is an ideal architecture. You have to choose the pattern based on project goals, not hype in the internet.
I just want to prove that the majority of iOS apps could be done with MVC pattern, without making it a Massive View controller.

The steps to achieve this look obvious and straightforward, and are easy to bring in your project, yet many people fail to accomplish this.

# Main points

- Don't parse JSON or make API calls directly in the ViewController. Its **wrong**. Use external service classes for your VC and models to make API calls and parse JSON into runtime objects.
- Don't perform view layout in ViewController. This is the job of View layer.
- Don't forget to divide View and Model. One shouldn't know about another. Create ViewConfig structs
 to convert Model's `Data` or `Date` and etc. into `UIImage` or `String` types which are understandable by View.
- To divide view from view controller override `UIViewController`'s `loadView` method.
- Routing is to be commonly performed in VC, but no one restricts you from taking this logic out to other classes. This wont make this pattern MVCR or anything else.
- To reuse views, create distinct `UIView` subclasses

# Few more words

This pattern appears to be simple, yet powerful. It complies with `UIKit`'s APIs. It lets you implement quite big apps, but with much less levels and files as, for example, VIPER.
Ofc it has it's flaws. But you should choose the pattern based on your project, and I'm just suggesting you to take another look to MVC.
Apple recommends it!

# About the example

This repo has a very very simple example app, which demonstrates you how to divide different logic into different MVC layers.
The app itself is quite dumb (since I'm not quite fond of project ideas right now), but I believe it's enough to understand my vision of MVC well.
