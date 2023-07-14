# Health Tracker App

[![Contributors](https://img.shields.io/github/contributors/dsckgec/Health-Tracker-App.svg)](https://github.com/dsckgec/Health-Tracker-App/graphs/contributors) [![Forks](https://img.shields.io/github/forks/dsckgec/Health-Tracker-App.svg)](https://github.com/dsckgec/Health-Tracker-App/network/members) [![Issues](https://img.shields.io/github/issues/dsckgec/Health-Tracker-App.svg)](https://github.com/dsckgec/Health-Tracker-App/issues) [![Pull Request](https://img.shields.io/github/issues-pr-closed-raw/dsckgec/Health-Tracker-App)](https://github.com/dsckgec/Health-Tracker-App/pulls)


Health Tracker is your one stop solution to keep your heath related information in a secured way.

## Author
<a href="https://github.com/saptarshiweb"><img src="https://contrib.rocks/image?repo=saptarshiweb/cryptotracker"></a>

## Contents

1. [Description](#description)
1. [Project structure](#project-structure)
1. [Project roadmap](#project-roadmap)
1. [Getting started](#getting-started)
1. [Live demo](#live-demo)
1. [Built with](#built-with)
1. [Contributing](#contributing)
1. [Authors](#authors)
1. [License](#license)
1. [Acknowledgments](#acknowledgments)

## Description
Tracking your daily Health Habits and essential Medicines as per the prescribed Schedule.

### What's the problem?
Most people often forget to take their medicines at regular intervals or to keep track of their health parameters.It becomes really useful if an app takes care of all those things for us.It really keeps us up to date with the schedule and takes care of our health.

### How can this project help?
Health tracker App will send notifications at regular intervals so that the user does not forget to take their prescribed medicines as per the schedule, also keep track of their essential information.

### The idea
The idea is to integrate the Flutter App with SQLite Backend where we will store all the user's data in a secured and organized way.

## Project structure

```
├── .github/            github related files like PR templates, contribution guidelines
├── android             flutter generated android specific code
├──ios                  flutter generated ios specific code (for future use)
├── lib                 contains all source codes and modules of projects
  ├──controllers        contains the backend code
  ├──pages              contains the app screens
├──test                 individual widgets can be tested here
├── .gitignore          stores files and directories to be ignored in commits
├── LICENSE             the open source license
├── pubspec.yaml        metadata of the project
├── pubspec.lock        stores version of every package used in the project
└── readme.md           details and instructions about the project go here

```

## Project roadmap

The project currently does the following things.

- Takes the medicine details (dosage,price,mfg company, critical or not), when to eat, etc.
- Show the above data in the form of Cards in an Organized manner.

See below for our future steps.

- Send notifications before a certain amount of time before the scheduled time of taking a medicine.
- Store all Doctor prescriptions in the App in an organized way.
- Track Walking time, Sleep time, Heart Beat, Blood Pressure,and other regular vitals.
- Give important Health Tips at regular intervals.

## Getting started


### Prerequisites
1. Basic Understanding of Programming Language (preferably, C++/Java)
2. OOPS
3. Understanding of the Flutter Framework by Google


### Installing

#### Softwares needed

- [Visual Studio Code](https://code.visualstudio.com/)
- [Android Studio](https://developer.android.com/studio)
- [Flutter](https://flutter.dev/)


#### Knowledge needed

The best way to learn the following is to google each and everything!

-   Very basic understanding of Git and GitHub:

    -   What are repositories (local - remote - upstream), issues, pull requests
    -   How to clone a repository, how to fork a repository, how to set upstreams
    -   Adding, committing, pulling, pushing changes to remote repositories

- For Flutter SDK:

  - [Getting Started with Flutter](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1)

  - Beginner to Intermediate knowledge of Flutter UI Design Patterns, Widgets, Routers, Navigation,etc.

  - Knowledge of integrating third party libaries and SQLite Backend (for solving backend issues).

- For Android: (Good to have but not mandatory)

  - [Getting Started with Java](https://www.w3schools.com/java/java_getstarted.asp)
  - [Android Developers Guide](https://developer.android.com/guide)

#### Instructions
A step-by-step series of instructions that tell you how to get the project running locally is given below. Google every issue you face following the below instructions or just ask us in our Discord channel.
- Fork and Clone the Repository
- Use Visual Studio Code/Android Studio
- In the terminal type flutter pub get
- Type flutter run in Terminal / Choose Run --> Run without Debugging and play it in any emulator of your choice(Special Note: Do not run it in WEB mode as Shared Preferences is there.)


## Live demo

https://user-images.githubusercontent.com/79189686/179920394-c6c2ea99-364c-4583-b330-ae0b8567be95.mp4

<img src="https://user-images.githubusercontent.com/79189686/179920463-9fc020b5-e959-4113-8fe9-cdb13fedfd38.jpg" width="200" height="400">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://user-images.githubusercontent.com/79189686/179920496-71e15ea6-b734-4d63-9065-816059decc83.jpg" width="200" height="400">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://user-images.githubusercontent.com/79189686/179920570-3b2e6915-7f84-478e-a6a4-153099ef754b.jpg" width="200" height="400">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://user-images.githubusercontent.com/79189686/179922326-47cab17c-054c-4119-8343-f12a58ed58ed.jpg" width="200" height="400">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://user-images.githubusercontent.com/79189686/179920756-1cf8a943-eefb-4564-9370-5184395db465.jpg" width="200" height="400">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://user-images.githubusercontent.com/79189686/179920825-970f24e5-0414-4bbc-b64e-fa6d438bd85b.jpg" width="200" height="400">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

## Built with


- [Visual Studio Code](https://code.visualstudio.com/)
- [Flutter/Dart](https://flutter.dev/)
- [SQFlite Backend](https://pub.dev/packages/sqflite)
- [Hive Database](https://pub.dev/packages/hive)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)


## Contributors

<a href="https://github.com/DSCKGEC/Health-Tracker-App/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=DSCKGEC/Health-Tracker-App" />
</a>

## Contributing

Please read [contributing.md](contributing.md) for details on our code of conduct, and the process for submitting pull requests to us.



## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- 
