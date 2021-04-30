---

title: Create Cross-Platform Apps With React Native and Expo
date: 2021-01-03 00:01 UTC
tags: development, react native, expo, docker
ig: https://www.instagram.com/p/CKDV-IHBFk4/
cover: create-cross-platform-apps-with-react-native-and-expo/expo-9032583c.jpg

---

<div class="content-image" markdown="1">
  ![](create-cross-platform-apps-with-react-native-and-expo/expo.jpg)
</div>

I've spent most of my career working as **Full Stack Developer**, mainly building products in **Ruby on Rails**, but the last few years I've been working most of the time building **APIs**.

Because sometimes I missed the Frontend and because I'm always trying to learn new things, I decided to give a try to learn how to build Mobile apps.

In the past, I played with *RubyMotion* or *Swift* but a few years ago while I was having some time off at Indian Himalayas I met some **React Native** developers that showed me how they built some Apps using it so and I started to follow a random [React Native](http://reactnative.dev/) book to build **Cross-Platform Apps** (iOS & Android) and I liked! It looked like a nice way to build apps but I started to feel a bit annoyed with the compiling process, dependencies... so at the end I wasn't very engaged.

<div class="content-image" markdown="1">
  ![](create-cross-platform-apps-with-react-native-and-expo/mc-leod-ganj-indian-himalaya.jpg)
</div>

Years later, I was looking for technologies to build a client for an API and I found on my radar a really amazing way to build **Cross-Platform Apps** that let me avoid lot of headaches and start building directly in the Browser. Thanks to [@necolas](https://twitter.com/necolas) and [React Native for Web](https://github.com/necolas/react-native-web) that makes possible to run React Native components and APIs on the web using React Dom.

So with the integration in [Expo](https://expo.io/), like they say in their website, you can **build one project that runs natively on all your users' devices**.

**This is the truly write once and runs everywhere!**

This way let you build an app that later can run on:

- Web ([React Native for Web](https://github.com/necolas/react-native-web))
- iOS & Android ([React Native](http://reactnative.dev/))
- Mac, Windows & Linux ([React Native for Web](https://github.com/necolas/react-native-web) & [Electron](https://www.electronjs.org/))

Moreover, [Expo](https://expo.io/) has some killer features like:

- Provide [APIs](https://docs.expo.io/bare/unimodules-full-list/) that work with React Native out the box
- A single command let you to build and distribute your apps running on [Expo](https://expo.io/) Services on cloud
- Automatic Updates when your app is launched without having to build a new version of the standalone app and resubmitting to app stores

[Expo](https://expo.io/) is a platform for making universal native apps that run on Android, iOS, and the web.

<article class="message is-dark" markdown="1">
  <div class="message-body">
    <strong>Try it without have to install or configure your environment</strong>
    <br />
    If you like to give a try at this point, I've prepared very simple <a href="https://github.com/jferrer/react-native-example">example</a> to see how it works without having to install or configure nothing.
  </div>
</article>

Of course, you need to install [Docker](https://www.docker.com/get-started).


Open your Terminal and clone the Github repo:

~~~bash
$ git clone https://github.com/jferrer/react-native-example && cd react-native-example
~~~

Now, everything is ready to run the example app:

~~~bash
$ export PLATFORM=:web
$ docker-compose up
~~~

This is going to download the Docker Image that I prepared and run it with some parameters like map your local folder to can do changes in the code or exposing some needed ports.

Click in the address that you will see and it will open the App in your browser.

~~~bash
app_1  |
app_1  | You can now view react-native-example in the browser
app_1  |
app_1  |  › Local   │ http://localhost:19006/
app_1  |  › LAN     │ http://172.20.0.2:19006/
app_1  |
app_1  |  › Run expo build:web to optimize and build for production
app_1  |
app_1  |  › Press w │ open in the browser
app_1  |  › Press ? │ show all commands

~~~

**Done!** Now, press ```Control+c``` to exit.

Next step, is to see the same App running on your mobile phone:

~~~bash
$ export PLATFORM=
$ export LOCAL_ADDRESS=your local address. Ex: 192.168.1.12
$ docker-compose up
~~~


~~~bash
app_1  | Starting project at /app
app_1  | Expo DevTools is running at http://localhost:19002
app_1  | Opening DevTools in the browser... (press shift-d to disable)
app_1  | Starting Metro Bundler
app_1  |
app_1  |  exp://192.168.1.37:19000
app_1  |
app_1  |
app_1  |  (QR Code should be here!)
app_1  |
app_1  |
app_1  |  To run the app, choose one of:
app_1  |  › Scan the QR code above with the Expo app (Android) or the Camera app (iOS).
app_1  |  › Press a for Android emulator, or w to run on web.
app_1  |  › Press e to send a link to your phone with email.
app_1  |
app_1  | Press ? to show a list of all available commands.
app_1  | Logs for your project will appear below. Press Ctrl+C to exit.

~~~


You will see a QR Code that you need to scan in Expo client that previously you have to install on your mobile phone: [iOS](https://apps.apple.com/app/apple-store/id982107779) / [Android](https://play.google.com/store/apps/details?id=host.exp.exponent&referrer=www)

**Voila!** The App is running on your mobile phone. Easy?

At this point you can start playing with the code. For example, open the main file in your favorite text editor:

~~~javacript
# App.js

import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Open up App.js to start working on your app!</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
~~~

You will see that in you change the text inside the `<Text></Text>` tags and save. Automatically it changes in your mobile phone. Awesome!

As I told before I found a very friendly and easy way to start building **Cross-Platform Apps** avoiding lot of headaches so if you want to continue learning I recommended to you to:

- Read [Expo documentation](https://docs.expo.io/)
- Read [React Native documentation](https://reactnative.dev/)
- Read [React Native for Web documentation](https://necolas.github.io/react-native-web/docs/?path=/docs/overview-getting-started--page)
- Follow [@baconbrix](https://twitter.com/baconbrix)
- Follow [@wcandillon](https://twitter.com/wcandillon)
