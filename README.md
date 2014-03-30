# DesignKit

Innovative iOS framework that attempts to bridge the gap between designs created in Adobe Photoshop Tool. As much as possible..

## Features

DesignKit offers many features that aid in transferring Photoshop designs into a working application. Some of them are described below in detail.

There are also options to open .PSD file created in Photoshop and use shape and bitmap assets directly in code.

### Colors

Working with colors has been made easy with DesignKit. Just use UIColorFromKey macro and it will automatically figure out what color you mean, whether you asked for a color by name, hex-decimal value or RGB values.

### Filters

Effect kit also includes Photoshop filters which can be done on all UIImage layers. Otherwise you must call rasterize method on UIView to convert it into an image.

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

### Icons

# Technique

The effects are rendered each on a separate UIViews that are placed above the target layer in the view hierarchy. This allows for setting the opacity of each effect separately, including the layer itself.

Compatibility
========

The framework requires iOS 7.

Contributions
======

The following projects were a great help in creating the **EffectKit**.

- https://github.com/bengotow/PSDWriter
- https://github.com/layervault/psd.rb
