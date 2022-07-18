---

title: My experience at YCombinator Startup School Online
description: YCombinator is one of the most known Startup Accelerator Programs in the Worldand Startups like Stripe, Airbnb, Dropbox, Reddit, Twitch or Coinbase used it to launch their companies.
date: 2021-04-11 00:01 UTC
tags: draft, general, startup
cover: my-experience-at-ycombinator-startup-school-online/startup-school-the-best-resource-for-founders-1c9b3762.jpg

---

<div class="content-image" markdown="1">
  ![](my-experience-at-ycombinator-startup-school-online/startup-school-the-best-resource-for-founders.jpg)
</div>

[YCombinator](https://www.ycombinator.com/) (YC) is one of the most known *Startup Accelerator Programs in the World*. It was founded in 2005 and *it invests $120.000 for 7% in seed funding*. Startups like **Stripe, Airbnb, Dropbox, Reddit, Twitch or Coinbase** used it to launch their companies.

To give you an idea how big is, **the combined valuation of the top YC companies is over $300 billions** (Jan 2021)

Early this year a friend talked me about the [Startup School Online](http://startupschool.com/): **A free 4-week online course to build and launch your Startup!**

At first, 4 weeks to define an idea, build the product and launch it sounds very short to me but after check the content of the course, the benefits and what people told about YC I decided to try.

## What you get

* Weekly sprint check-in calls
* Weekly goals tracking
* Weekly live group sessions with other founders
* High quality content (videos & lectures). I had to complete 19, I don't know if it's the same for everyone. Also, get access to more that 300 resources.
* Forum with a global community of founders.
* Get access to more than $100,000 worth of deals on AWS, GCP, Digital Ocean, Stripe, Brex, Segment, and more. (once you are certified and approved by YC)

## How I structured the 4 weeks

### Week 1: Find the project

I always have a few projects in mind waiting to find some time to can work on them so I checked all my notes to decide which one could be good for this program and if 4 weeks would be enough time to build it.

Finally, I chose the one that I really missed every day the last year when I was going to the office by taxi.

It was early 2020 and I've just moved to Bangkok to work for [Omise](https://www.omise.co/). I've had to spend some time every day in a taxi commuting to office and I loved the landscape, the skyscrappers... **everything was new to me and I didn't want to waste that time looking at my phone reading the daily news or checking the email instead of looking through the window.**

Because I'm a big fan of [Blinkist](https://www.blinkist.com/), some days I listened the resume of some random audiobook but **I thought that it would be nice to can listen all my daily news in something similar to a tailored podcast. So I coded a small service that got news from my favorite RSS feeds and convert it to audio.**

This seemed to be the perfect project to work on! **It was something that I was going to use every day, I could try some technologies that were in my radar for some time and I already built a very simple service that I only had to improve**. But there was some pending things to build: the mobile App and the API to can automate all the process and release as a product.

### Week 2: Build the API

Because this is my main field I didn't have much complications to build and deploy the API in less than one week.

I chose my favorite framework: [Ruby on Rails](https://rubyonrails.org/). After 15 years working with Rails I've still in love with and I find it the best way to create an API very fast.

Because the project was pretty small I decided to go for plain-Rails and not use [Trailblazer](https://trailblazer.to/) or similar to encapsulate the Business Logic. At this point, a few Service Objects would be enough.

Since a few years ago I always use TDD because it helps me to build faster and think better about every part of the project. I use Minitest to write the tests because I find it easier than RSpec, less verbose and it's included with the Framework.

~~~bash
# Running:

..................

Finished in 1.714749s, 10.4972 runs/s, 26.2429 assertions/s.
18 runs, 45 assertions, 0 failures, 0 errors, 0 skips
~~~

For CI, I've been using [Github Actions](https://github.com/features/actions) in my last projects.

[Heroku](https://www.heroku.com/) to deploy it. I'm still really impressed about how amazing and easy is Heroku compared to have to deal with all the configuration in other providers like Amazon Web Services or Digital Ocean.

### Week 3: Build the App

I've been playing with [Expo](https://expo.io/) and [React Native](https://reactnative.dev/) for almost 2 years now and I find it awesome!

**Literally you can start an App and have it running on your phone in less than 5 minutes.** I wrote previously about: [Create Cross-Platform Apps With React Native and Expo](/create-cross-platform-apps-with-react-native-and-expo.html).

Also, I really like the idea of have a single codebase that runs everywhere: Web, Android & iOS.

So I spent the 3rd week of the course building the Webapp to connect it to my API.

<div class="content-image" markdown="1">
  ![](my-experience-at-ycombinator-startup-school-online/audiopill-pro.jpg)
</div>

I deployed it to [AWS Amplify](https://aws.amazon.com/amplify/) to try the service. Easy! I've only had to add a configuration file to the Github repository and AWS, automatically, do the build and deploy it on every push.

### Week 4: Create content and some refactor

Although I was been generating some sample audio content during the development now I had to focus in generate the real content for the service.

**I thought that it could be more, not only daily news so adding more content I could learn about different topics listening short audio pills**.

I forgot to mention before but I built the service that generate the audio as an exercise that let me try some new tech:

* Small program in [Golang](https://golang.org/) running in [AWS Lambda](https://aws.amazon.com/lambda/)
* [AWS S3](https://aws.amazon.com/s3/) to store the audio file
* [AWS API Gateway ](https://aws.amazon.com/api-gateway/) for the Endpoint

Last, I gave a try to [Terraform](https://www.terraform.io/) to automate the configuration and deployment of the services.

## When course finish

After the first 4 weeks I had some new materials to complete and I still had to send my goals another 4 weeks to obtain the certification and can apply for the provider deals.

Later, you still have access to the platform so you can continue watching/reading the materials (as I told before there are more than 300 resources), sending your weekly goals or connecting with other founders at Forum.

<div class="content-image-border" markdown="1">
  ![](my-experience-at-ycombinator-startup-school-online/yc-startup-school-certificate.jpg)
</div>

## Conclusion

**At the end, 4 weeks working 4-6 hours/day (Monday to Friday) + watch the videos and read the lectures was more than enough to build the MVP and send to some friends to get some feedback.**

The experience was really good! I had the opportunity to focus on build and launch something that was in my mind for some time, learn a lot with the course' resources, talk with other founders and feel that I was part of a global community of fourders.

## What's next!

I think is worth it to continue checking some of the pending materials, connecting with other founders through the Forum and check the announcements because they are adding new features to the platform.

Also, I won't stop sending my weekly goals because it help me to stay on track.

Last, if you want to see what I've built along this course visit [Audio Pill](https://audiopill.pro)
