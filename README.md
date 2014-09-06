<p align="center" >
  <img src="https://raw.githubusercontent.com/Legoless/DesignKit/master/Assets/designkit-logo.png" alt="DesignKit" title="DesignKit">
</p>

[![Build Status](https://travis-ci.org/Legoless/DesignKit.svg)](https://travis-ci.org/Legoless/DesignKit) [![Version Badge](https://cocoapod-badges.herokuapp.com/v/Haystack/badge.png)](http://www.google.com)  [![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/NSStringMask/badge.svg)](https://cocoadocs.org/docsets/NSStringMask)  [![License Badge](https://go-shields.herokuapp.com/license-MIT-blue.png)](http://www.google.com) 

The mission of this innovative iOS framework is to enhance and speed up the creation of beautiful iOS applications, while keeping the learning curve as easy as possible. This is done by following the next milestones:

- **Styling code is completely decoupled from controller objects:**
  
  *This is achieved by abstracting visual style of UI elements into special style classes, which are not connected to view controllers. The NUI framework handles the case of style files.*

  Read more about **Styling** in DesignKit.

- **Integrates with multiple well-known design oriented frameworks:**
  
  *Popular frameworks such as Masonry, SVGKit and POP are integrated out of the box, to keep the design as consistent and smooth as possible.*
  
- **Attempts to bridge the gap between design tools and iOS SDK:**
  
  *DesignKit provides plugins and extensions for popular designing tools such as Sketch 3 and Adobe Photoshop CC. Plugins will generate native DesignKit code to be used in existing projects.*
  
    Read more about **plugins** in DesignKit.

- **Adds design sources that can used in multiple projects:**
  
  *There are multiple resources available in DesignKit that help iOS developers create common interface elements faster. Those include most common used colors, such as Facebook color, common usage and social icons.*
  
    Read more about **resources** in DesignKit. 
  
- **Reduces application's memory fingerprint by utilizing vector graphics:**
    
    *Vector graphics require very small memory fingerprint, while keeping animations and interaction fast and fluid.*
    
    Read more about **drawing** in DesignKit.
    
## The Ideas

Ideas for this project come out of multiple frameworks in many different technologies. Here are a few examples:
- **Styling** is decoupled from business logic on many platforms for example in World Wide Web and Windows Presentation Foundation, including Windows Phone.

- **Vector graphics** is used on map platforms, because it is small to transfer over network connection. It is also very easy to modify. Simply change the color in code (yes, I know about tintColor property).

- **Resources** are shared throughout multiple projects, for example: Share to Facebook usually contains Facebook icon with Facebook trademark color. Why should we always search for it, through other projects and copy paste them?

- **Layout** is sometimes a pain. Even with second iteration of auto-layout there is still a lot of layouts that are a pain to create. Inspired by Windows Presentation Foundation we use special layout managers that make this easy.

## Code Structure

Following the milestones above, DesignKit is organized into multiple modules, which can be installed via CocoaPod's Subspecs.
- `DesignKit`
  
  Contains all subspecs, except for resources and main UI styling functionality.

- `DesignKit/Core`
  
  Contains basic design oriented functionalities and helper functions used in almost every project.

- `DesignKit/Drawing`
  
  Classes will enable you to draw vector shapes to existing UI elements, such as `UIButton` or `UIView`.

- `DesignKit/Layout`
  
  Contains improved layout managers for all children with ideas based on XAML. 

- `DesignKit/Storyboard`
  
  Storyboard utilities, helpers and that help you utilize Storyboard's full power. Divide view controllers into logic groups, or just use it to design your custom views.

- `DesignKit/Resource`
  
  Resources include icons, colors, gradients - all in vector format, ready to be used in combination with Drawing subspec.

## Usage

Our [**Usage**](https://github.com/Legoless/DesignKit/blob/master/Documentation/Examples/Usage.md) section has many samples on how to use **DesignKit**. There are also many other sample projects/libraries that use DesignKit:
- [DRCameraView](https://github.com/Legoless/DRCameraView)

## Development

The iOS community is strong and it is becoming larger every day. That is why **DesignKit** is developing rapidly and the main API is also changing rapidly. We do not recommend you use it in production just yet. API will be finalised by version 1.0 and will not change until version 2.0.

Compatibility
========

The framework requires **iOS 7**. Mac OS X is currently not supported.

Testing
========
Just download the zip and open the sample project or try:

`pod try DesignKit`

Contributions
======

A big thanks goes to all **contributors** of the following projects, which were a great help in creating the **DesignKit**.

- https://github.com/tombenner/nui
- https://github.com/SVGKit/SVGKit
- https://github.com/cloudkite/Masonry
- https://github.com/bengotow/PSDWriter
- https://github.com/layervault/psd.rb

TODO
======

Contact
======

Dal Rupnik

- [legoless](https://github.com/legoless) on **GitHub**
- [@thelegoless](https://twitter.com/thelegoless) on **Twitter**
- [legoless@arvystate.net](mailto:legoless@arvystate.net)

License
======

DesignKit is available under the MIT license. See [LICENSE](https://github.com/Legoless/DesignKit/blob/master/LICENSE) file for more information.
