# Asiatic360

An in house project for [Asiatic360](https://xd.adobe.com/view/57f6dfea-3224-4a74-9b66-e2e6ff131045-02a5/). An employee app to ease few requisition procedures.

Using Flutter to enable crossplatform support accross moblie device and operating systems.

## App UI

![SplashScreen](asiatic360APP/assets/ui/SplashScreen.png)
![OTP](asiatic360APP/assets/ui/OTPVerification.png)
![SplashScreen](asiatic360APP/assets/ui/Signup.png)
![SplashScreen](asiatic360APP/assets/ui/Dashboard.png)

## Get Started For Asiatic360APP

*   Clone this repo
*   Run `flutter packages get`
*   Run `flutter run` (remember to open simulator or connect physical device, iOS auto run additional command `pod install`)

## Get Started For Asiatic360API

*   Clone this repo

## Issues I have faced!

*   Could not create task
    *   To fix this what helped me was to
        *   Run `flutter clean` to delete the build folder
        *   Build the project on Android studio
        *   Run `flutter pub get`
        *   Then continue with `flutter run` to test on emulator or other physical devices.

## For Beginners

A few resources to get you started if this is your first Flutter project:

*   [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
*   [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
