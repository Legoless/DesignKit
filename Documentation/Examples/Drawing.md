Drawing
========

This section constains example code specifically for `DesignKit/Drawing` module. Drawing adds specific drawing methods to `UIView` and it's subclasses.

All drawing code is done in a specific block defined by `DKDrawingBlock`, which you can define for each `UIControl` state (supported on `UIButton`) or general state (supported on all `UIView` instances).

When executed each block is provided with a frame where all the drawing should occur (usually called by `drawRect` method) and parameter dictionary, which include parameters such as colors and current orientation angle.

***Important:** All views that use this code, must derive from their DesignKit counter-parts. `UIKit` automatically optimizes performance by not calling `drawRect` method, if it is not implemented. So use DesignKit classes for elements that use drawing blocks such as `DKView` or `DKButton`.*

To use the drawing module, we need to import it:

```objective-c
#import <DesignKit/DKDrawing.h>
```

# Creating drawing blocks

Drawing blocks can be easily created in code and all your drawing code can be put in drawing blocks directly. Lets create a drawing block for red ellipse.

```objective-c
DKDrawingBlock redEllipse = ^(CGRect rect, DKParameters* parameters)
{
    UIBezierPath* ellipse = [UIBezierPath bezierPathWithOvalInRect:rect];
    [[UIColor redColor] setFill];
    [ellipse fill];
};
```

Now we can easily store this block in memory and call it everytime that is needed.

# Adding drawing blocks to elements

When our drawing blocks are defined, we can add them to DesignKit UI elements (`UIKit` derivatives with DK prefix) by setting `DKDrawingBlock` property.

```objective-c
DKView* myDrawingView;
myDrawingView.drawingBlock = redEllipse;
```

The view will immediately redraw itself using the provided block.
Property always sets the drawing block for default UI state, which is `UIControlStateNormal`.

Certain UI elements, such as `DKButton` have additional methods to enable you to set different drawing blocks for different states of the element. For example, `UIButton` sets it's state to `UIControlStateHighlighted` when pressed. So to make the button call another drawing block when pressed, simply set the block for highlighted state.

```objective-c
DKButton* myDrawingButton;
myDrawingButton.drawingBlock = redEllipse;

[myDrawingButton setDrawingBlock:blackEllipse forState:UIControlStateHighlighted];
```

In the example above, a black ellipse drawing block is set for button in highlighted state.

# Using parameters

Each drawing block is provided with parameters, which you can use to customize your drawing. There are multiple drawing parameters available:

- `DKDrawingParameterParent` - View that is calling the drawing method.
- `DKDrawingParameterOrientation` - Current user interface orientation.
- `DKDrawingParameterColor` - Main color of the element (if supported).
- `DKDrawingParameterSecondaryColor` - Secondary color of the element (if supported).

Parameters can be pulled out of `DKParameters` class, which works very similar to a `NSDictionary`:

```objective-c
DKDrawingBlock ellipse = ^(CGRect rect, DKParameters* parameters)
{
    UIBezierPath* ellipse = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    UIColor* color = parameters[DKDrawingParameterColor];
    [color setFill];
    
    [ellipse fill];
};
```

Not all parameters are provided to each block, so be sure to protect your code against `nil` values. For example, colors are only provided if they are set directly on the element.
