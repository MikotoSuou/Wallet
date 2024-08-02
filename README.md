# Wallet
Wallet application

Project setup:
1. Clone and open this project
2. Run **flutter clean; flutter pub get**
3. Generate auto-generated files with **dart run build_runner build --delete-conflicting-outputs**

Run local server:
1. Install node.js (if you don't have node.js in your local machine)
2. Run **npm install**
3. Start the server with **npm run json:server**

Build app in an emulator / device:
1. Open an android emulator / Connect your device in your local machine
2. Update the baseUrl in lib > core > utils > constants.dart (change localhost to your IP)
3. Run **flutter run**

Build APK:
1. Update the baseUrl in lib > core > utils > constants.dart (change localhost to your IP)
2. Run **flutter build -apk**
3. Install in your device

Run unit test: (you can already run this after the project setup)
1. Run **flutter test**


NOTE:
If you used a device to run the app, please make sure that the device and your local machine uses the same network

