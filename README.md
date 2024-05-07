Polaris Engine
=======================

## What is Polaris Engine?

`Polaris Engine` is a first-class development software for visual novel creation.

With an open-source philosophy and designed with true cross-platform portability in mind,
`Polaris Engine` is equipped with features and tools of production-grade quality,
making it perfect for both beginners and seasoned creators alike.

With a strong focus on effortless and efficient creation,
`Polaris Engine` is able to enrich both the creator and user experience,
all without sacrificing the features and usability creators and users have become acustomed to in the modern world.

Polaris Engine doesn't aim to be a no-code platform; however, taking advantage of Domain Specific Languages (DSL),
creators can compartmentalize their development cycles, making use of in-built languages for scenarios, user interfaces, and logic.

To add to this, we're currently in the process of adding basic graphical support for each DSL.
This is somewhat different to other engines, and we call it 'Visual Live Scripting' (VLS).

The author thinks as a researcher of software engineering that VLS is one of the many shapes of Rapid Application Development (RAD).

## What is the Polaris Engine's Development Goal?

`Polaris Engine`'s goal is to **define a new standard of visual novel creation** throughout the 2020s and beyond.

## What are the Polaris Engine's Mission, Vision, and Value (MVV) statements?

* Mission
  * **Simple:** Polaris Engine enables the creation of Visual Novels in an easy and efficient manner.
  * **Fast:** Apps are constructed using native technologies only, ensuring resource efficiency on mobile devices.
  * **Free:** We are an open source project and we make our technology public as pro-bono-publico with respects for intellectual properties of others.
* Vision
  * **Earning:** Game developers can publish their games on stores and earn income.
  * **Prosperity:** Our aim is to create a world where anyone can make a living with just a single computer including mobile devices.
  * **Talent**: Bringing people with talents but difficulties into the world (Giftedness support)
* Values
  * **Information:** We hold the belief that the creation and generation of information including story writing is humanity's true value.
  * **Market:** We shall complete the market launch of game subscriptions with world leading platform partners.
  * **Diversity:** Develop, distribute, and publish on all platforms - Polaris Engine seeks the true portability and we call it diversity.

## Binary Downloads

Please visit [the official Web site](https://polaris-engine.com/en/dl/) to obtain the latest release.

## Build

See also [Build Instructions](https://github.com/ktabata/polaris-engine/raw/master/build/README.md) for more details.

On Ubuntu:
```
sudo apt-get install -y git build-essential libasound2-dev libx11-dev mesa-common-dev qt6-base-dev qt6-multimedia-dev libwebp-dev
git clone https://github.com/ktabata/polaris-engine.git
./configure
make
sudo make install
polaris-engine
```

### Discord User Community Server

Feel free to ask anything in this server. Any language will do.

<a href="https://discord.gg/Xh9mFwr4E8">Join our user community</a>

## License

This software is released under the MIT license.

There is no restriction on distribution and or modification of the Polaris Engine Source Code.
This project will never be commercialized in the future. Please use Polaris Engine with confidence.

## Contribution

The best way to contribute to this project is to use it and give us feedback.
We are always open to suggestions and ideas.

## Portability

Games made with Polaris Engine can run on PC, Mac, iPhone, iPad, Vision Pro, Android, Web browser, Chromebook, Linux, FreeBSD, NetBSD, OpenBSD, and commercial gaming consoles.

Polaris Engine consists of the platform independent core (CORE) and the hardware abstraction layer (HAL).
The CORE is written in ANSI C, the most portable programming language in the world, while HAL implementations are currently written in C, C++, Objective-C, Swift and Java.

If you would like to port Polaris Engine to a new target platform, you only need to write a thin HAL, this is generally possible within a week.

`Polaris Engine` does not depend on SDKs or frameworks such as Unity, Godot, Python, or SDL2, this is thanks to the extensive design of first-party HALs, our compatibility layer's API.
This strategy was very influenced by the NetBSD Kernel and the Windows NT Kernel/Exective/HAL.

## CI/CD Pipeline

* Currently, we don't have a complete CI/CD via the cloud due to a lack of code signing capabilities.
* However, the author has a release script and thus, releases are fully automated on his MacBook Pro.
  * The release script builds all binaries and uploads them to the website and GitHub.
  * It also posts a message to the Discord server.
  * This is generally done in 10 minutes via FTTH, or 20 minutes via LTE/5G.

## Trivia

Polaris Engine is the successor of `Suika2` and `Suika Studio (Suika1)`.
* [See the Suika2 here](https://github.com/ktabata/suika2)
* [See the Suika Studio 2002 version here](https://github.com/ktabata/suika-studio-2002-gpl)
* [See the Suika Studio 2003 version here](https://github.com/ktabata/suika-studio-2003-gpl)
