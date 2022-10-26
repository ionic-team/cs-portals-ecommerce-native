# Portals Ecommerce

An e-commerce demo application using Ionic Portals in a native iOS and native Android application.

This project highlights the use of web resources to populate Portals within native mobile applications, communication between native layers and web resources, and using Live Updates to update the contents of a Portal.

To do so, this project is constructed as a monorepo containing the following packages:

- `web/shopwebapp` - This package is an Ionic React application.
- `ios` - This package is a native iOS application.
- `android` - This package is a native Android application.

Web projects within the monorepo can be found within the `web` directory. The `web/live-update` directory serves as a base version of web resources to be replaced using Live Updates but is not a buildable project within the monorepo.

## Portals Registration Key

To try this demo, you are required to input a Portals registration key. You may get a key by going to [ionic.io/register-portals](https://ionic.io/register-portals). Follow the instructions below to add your key to the native demo applications.

### iOS

Create a `Config.xcconfig` file within the `ios/PortalsEcommerce` folder containing the following contents:

```bash
PORTALS_API_KEY=YOUR_KEY_HERE
```

Replace `YOUR_KEY_HERE` with your key.

### Android

Create a `secrets.xml` file within the `android/app/src/main/res/values` folder containing the following contents:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="portals_api_key">YOUR_KEY_HERE</string>
</resources>
```

Replace `YOUR_KEY_HERE` with your key.

## General Architecture

### Registering and Adding Portals

### Displaying Portals

### Communication Between Layers

### Live Updates

## Copying Web Resources

---

# TODO

2. Revamp web code.
   1. Make two dirs in `/web`, one for shopwebapp and one for live-update/featured-product
3. Refactor iOS code.
4. Refactor Android code.

---

# portals-ecommerce-demo

E-commerce Demo App using Ionic Portals

This is an example application built in iOS and Android. Both are using the same web resources for their Portals.

## Portals Registration Key

To try our Ionic Portals demo, both iOS and Android applications require you to input a Portals registration key. You may get a key by going to [ionic.io/register-portals](https://ionic.io/register-portals). Follow the instructions below to add your key to each platform demo application.

## iOS

### Portals registration key

Get you registration key from [ionic.io/register-portals](https://ionic.io/register-portals), then uncomment the following line in `AppDelegate.swift` and replace `YOUR_KEY_HERE` with your key.

```Swift
// Register Portals
PortalManager.register("YOUR_KEY_HERE");
```

Build and run the iOS app

## Android

### Portals registration key

Get you registration key from [ionic.io/register-portals](https://ionic.io/register-portals), then uncomment the following line in `EcommerceApp.java` and replace `YOUR_KEY_HERE` with your key.

```Java
// Register Portals
PortalManager.register("YOUR_KEY_HERE");
```

Build and run the Android app

## Web

### Building

Before you build the iOS or Android source you will need to build the web resource.

- `cd ./web`
- `npm install`
- `npm run build`
