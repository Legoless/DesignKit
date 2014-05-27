# Installation

How to add DesignKit to your project?

## Adding to your Xcode project

Preferred way to install DesignKit is with CocoaPods.

`pod DesignKit`

If you just wish to use specific parts of DesignKit, the best way is also to install them via CocoaPods:

`pod DesignKit/Drawing`

*If you are so much against CocoaPods, of course you can still drag and drop files into your project. The specific module files are located in separate directories to make this easy for you. But you will have to link against a couple of frameworks. But since you refuse to use CocoaPods, I think you should be able to figure which ones out yourself. Core Graphics and QuartzCore would be a good place to start.*

## Getting started

DesignKit depends on many key events in application's life-cycle, so it must be started as early as possible. The best place to start the DesignKit framework is in your Application Delegate class, specifically in the `application:didFinishLaunchingWithOptions:` method.

You can easily setup the framework by calling setup method:

`[DesignKit setup];`

Alternatively, `useStylesheet` method will also setup DesignKit, so you can load a specific stylesheet on start already:

`[DesignKit useStylesheet:@"MyStyle"];`