---

title: Create Cross-Platform Apps With React Native and Expo
date: 2021-01-03 00:01 UTC
tags: development, react native, expo

---

<div class="content-image" markdown="1">
  ![](create-cross-platform-apps-with-react-native-and-expo/expo.jpg)
</div>

I've spent most of my career working as **Full Stack Developer**, mainly building products in **Ruby on Rails**, but the last few years I've been working most of the time building APIs.

Because sometimes I missed the Frontend and because I'm always trying to learn new things, I decided to give a try to learn how to build Mobile apps. In the past, I played with *RubyMotion* or *Swift*.

A few years ago, I was having some time off at Indian Himalayas and I started to follow a random [React Native](http://reactnative.dev/) book to build Cross-Platform Apps (iOS & Android) and I liked it but I started to feel a bit annoyed with the compiling process, dependencies... so at the end I wasn't very engaged.

Years later, I found on my radar a really amazing way to build Cross-Platform apps that let me avoid lot of headaches and start building directly in the Browser. Thanks to [@necolas](https://twitter.com/necolas) and [React Native for Web](https://github.com/necolas/react-native-web) that makes possible to run React Native components and APIs on the web using React Dom.

So with the integration in [Expo](https://expo.io/), like they say in their website, you can **build one project that runs natively on all your users' devices**.

**This is the truly write once and runs everywhere!**

This way let you build an app that later can run on:

- Web ([React Native for Web](https://github.com/necolas/react-native-web))
- iOS & Android ([React Native](http://reactnative.dev/))
- Mac, Windows & Linux ([React Native for Web](https://github.com/necolas/react-native-web) & [Electron](https://www.electronjs.org/))

Moreover, [Expo](https://expo.io/) has some killer features like:

- Provide [APIs](https://docs.expo.io/bare/unimodules-full-list/) that work with React Native out the box
- A single command let you to build and distribute your apps running on [Expo](https://expo.io/) Services on cloud

The best of all, [Expo](https://expo.io/) is an *Open Source project*, developed by Facebook.

If you like to give a try at this point, I've prepared a simple Docker image that you can run and see how it works without having to install or configure nothing.

~~~bash
$ docker run -p xx:xx moviendome/expo-example
~~~

--
Pending:

- Build the image
- Write steps to see in Browser, Expo app & Electron
- McLeod picture
- Who to follow: expo guy, animation guy... william candillon
- Subscribe if interested in Learn how to build!!
