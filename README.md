# DesignKit

The mission of this innovative iOS framework is to enhance and speed up the creation of beautiful iOS applications, while keeping the learning curve as easy as possible. This is done by following the next milestones:

- **Styling code is completely decoupled from controller objects:**
  
  *This is achieved by abstracting the style for specific into special style classes, which can be created in code or by specific style files added to your application's bundle. The NUI framework handles the case of style files.*

- **Integrates with multiple well-known design oriented frameworks:**
  
  *Popular frameworks such as Masonry, SVGKit and POP are integrated out of the box, to keep the design as consistent and smooth as possible.*
  
- **Attempts to bridge the gap between design tools and iOS SDK:**
  
  *There are many designer tools that are basically built to create gorgeous iOS interfaces. DesignKit provides plugins and extensions for popular designing tools such as Sketch 3 and Adobe Photoshop CC. Plugins will generate native DesignKit code to be used in existing projects.*

- **Adds multiple design sources that can used in many projects out of the box:**
  
  *There are multiple resources available in DesignKit that help iOS developers create common interface elements faster. Those include most common used colors, such as Facebook color, common usage and social icons.*

## Development

We, iOS Developers, are very lucky. The community is strong and it is becoming larger every day. That is why DesignKit is developing rapidly and the main API is also changing rapidly. We do not recommend you use it in production. API will be finalised by version 1.0.

## History


## Features

Innovative iOS framework that attempts to bridge the gap between designs created in Adobe Photoshop Tool. It's main mission is to enable developers to quickly create a living design out from PSD's provided by a designer. DesignKit extends NUI capabilities to shapes and Objective-C code.

DesignKit is tightly coupled together with Photoshop CC extension to be able to export code directly from Photoshop. It even allows you to generate View Controller code.

DesignKit also connects multiple iOS libraries together to create a larger framework that allows developers to create fast and beautiful designs.

Project is currently WIP, please be patient as it gets developed. Integration with Sketch 3 is also planned soon.


DesignKit offers many features that aid in transferring Photoshop designs into a working application. Some of them are described below in detail.

There are also options to open .PSD file created in Photoshop and use shape and bitmap assets directly in code. Still work in progress.

DesignKit also includes new layout managers:
- Grid
- StackPanel
- FlowPanel
- DockPanel

## Support

DesignKit supports many of the popular design and UX plugins out of the box.
- POP Animation Framework
- NUI
- Masonry
- SVGKit

### Colors

Working with colors has been made easy with DesignKit. Just use UIColorFromKey macro and it will automatically figure out what color you mean, whether you asked for a color by name, hex-decimal value or RGB values. We have added hundreds of prebuilt colors which can be used in the application. They include company slogan colors and flat color library.

### Filters

DesignKit also includes Photoshop filters which can be done on all UIImage layers. Otherwise you must call rasterize method on UIView to convert it into an image.

- Blur
- Edge Detection

### Effects

The following effects from Photoshop's blending options are currently implemented / or in progress.

- Stroke (outside, inside)
- Color overlay
- Gradient overlay
- Drop shadow
- Inner glow
- Outer glow

### Vectors

DesignKit provides many vector icons out of the box, used for social icons and most common tasks. The vectorized icons can have blending options added as well.

# Technique

The effects are rendered each on a separate UIViews that are placed above the target layer in the view hierarchy. This allows for setting the opacity of each effect separately, including the layer itself.

Compatibility
========

The framework requires iOS 7 or Mac OS X 10.9.

Testing
========
Just download the zip and open the sample project.

Contributions
======

The following projects were a great help in creating the **DesignKit**.

- https://github.com/bengotow/PSDWriter
- https://github.com/layervault/psd.rb

Contact
======

Dal Rupnik

- [legoless](https://github.com/legoless) on **GitHub**
- [@thelegoless](https://twitter.com/thelegoless) on **Twitter**
- [legoless@arvystate.net](mailto:legoless@arvystate.net)

License
======

Completely free. See [LICENSE](https://github.com/Legoless/DesignKit/blob/master/LICENSE) file for more information.
