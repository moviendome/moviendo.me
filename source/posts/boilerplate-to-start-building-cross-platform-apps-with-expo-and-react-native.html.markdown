---

title: Boilerplate to start building Cross-Platform Apps with Expo and React Native
date: 2021-05-19 00:01 UTC
tags: development, react native, expo, docker
cover: create-cross-platform-apps-with-react-native-and-expo/expo-9032583c.jpg

---

<div class="content-image" markdown="1">
  ![](create-cross-platform-apps-with-react-native-and-expo/expo.jpg)
</div>

[Expo](https://expo.io/) and [React Native](http://reactnative.dev/) is the perfect combination to build Cross-Platform Apps.

When I started to build Apps using this approach I had to understand the limitations and that, although, the React Native ecosystem is big I cannot use all the libraries if I wanted to run my app on Web, Native & Desktop with a single codebase.

There are different libraries to do the same job and it's important to choose the one that fits better and is cross-platform.

## What are you going to find in this boilerplate

### Expo

[Expo](https://expo.io/) is an open-source platform for making universal native apps for Android, iOS, and the web with JavaScript and React.


### React Native for Web

[React Native for Web](https://github.com/necolas/react-native-web) makes it possible to run React Native components and APIs on the web using React DOM.

It was included in [Expo SDK 33](https://blog.expo.io/expo-sdk-v33-0-0-is-now-available-52d1c99dfe4c), so one less thing to worry about.

### React Navigation

[React Navigation](https://reactnavigation.org/) adss routing and navigation to your React Native apps.

### Electron

[Electron](https://www.electronjs.org/) let you build cross platform desktop apps with JavaScript, HTML, and CSS.


### Easy Peasy

[Easy Peasy](https://easy-peasy.vercel.app/) is an abstraction of Redux, providing a reimagined API that focuses on developer experience.

### React Native Async Storage

[React Native Async Storage](https://github.com/react-native-async-storage/async-storage) is an asynchronous, persistent, key-value storage system for React Native.

### React Native Paper

Although, I use it in most of my Apps, sometimes I prefer to use my own components. Anyway, if you prefer to start with a collection of customizable and production-ready Cross-Platform components for React Native, I highly recommend to you add to your project with:

~~~bash
$ expo install react-native-paper
~~~

## How to try this boilerplate

You can download and run the repository from my Github account: [jferrer/expo-boilerplate](https://github.com/jferrer/expo-boilerplate)

### Clone the repo and install dependencies:

~~~bash
$ git clone https://github.com/jferrer/expo-boilerplate.git
$ cd expo-boilerplate
$ yarn install
~~~

### Run for Web & Native:

~~~bash
$ expo start
~~~

### Run for Desktop:

~~~bash
$ yarn expo-electron start
~~~

Inside, you'll see the basic configuration and screens to start an App:

- Typical Tab Bar navigation like Facebook or Instagram
- Action & Form Screen to add elements to the Store
- List Screen
