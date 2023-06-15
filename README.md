# flutter_post_feed

A new Flutter project.

# Required

* xCode (for mac)
* iPhone simulator
* VSCode (or preferred IDE)
* [Flutter SDK](https://docs.flutter.dev/get-started/install/macos)
* Recommended [VSCode Flutter](https://docs.flutter.dev/tools/vs-code) extensions

Run `flutter doctor` from your terminal to ensure Flutter is properly installed with necessary dependencies.


Refer to the [Flutter Docs](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#1) on getting started if you have any trouble setting up your dev environment.

## Run Project

*This application has been tested on macOS Monterey using an iPhone 14 Pro Max simulator and VSCode as the IDE.*


Run the following command to start the IOS simulator:
```sh
$ open -a Simulator --args -CurrentDeviceUDID <your device UDID>
```

Open project in VSCode and open `main.dart` and select the Run and Debug icon from the top right

**OR**

Run `flutter run` from the project root in the terminal.


## Folder structure

```
/lib
├── clients
│   ├── reach out to API/DB
├── fakeData
│   ├── Fake Data used in the app
├── models
│   ├── model schema and state logic
├── screens
│   ├── top level screens in the app
├── utils
│   └── helper utility functions
├── widgets
│   └── custom built widgets
```


## Unit tests

All tests are stored in `/test` and can be ran with running `flutter test` from the root of the project or opening the respective `_test.dart` file and selecting the run & debug icon from the IDE (tested in VSCode).