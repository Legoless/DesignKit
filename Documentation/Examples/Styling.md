Using styles
========

This section contains example code for styling (the most important part of DesignKit). Each example represents a simple use case of the styling techniques.

**Table of contents**
- Stylesheets
- Styles
- Properties

# Stylesheets

Create a stylesheet file with .nss extension. The syntax of the file should follow [NUI rules](https://github.com/tombenner/nui). Place the file in your bundle. File can be loaded by calling:

`[DesignKit useStylesheet:<filename>];`

The useStylesheet method overwrites all currently set styles in entire application.

This method will overwrite any styles that have the same key or same UI element already defined.

The currently loaded instance of the stylesheet can be retrieved by calling:

`DKStylesheet* stylesheet = [DesignKit stylesheet];`

## Creating stylesheets in code

Stylesheets can be easily created in code by instantiating `DKStylesheet` class.

```objective-c
DKStylesheet* stylesheet = [[DKStylesheet alloc] init];
DKStylesheet* secondStylesheet = [[DKStylesheet alloc] initWithStyles:object];
```

If you use `initWithStyles:` initializer parameter can be an array of `DKStyle` classes or serialized styles as a property list (*read more about it in style section*).

You can even load a stylesheet from file:

`DKStylesheet* stylesheet = [[DKStylesheet alloc] initWithFilePath:@"path"];`

## Working with styles in a stylesheet

Stylesheets make it easy to work with style instances. To add a style to a stylesheet:

`[stylesheet addStyle:style];`

You can only add styles with `styleKey` or `referenceView` defined to a stylesheet, otherwise it is impossible to keep track of them.

When you wish to add multiple styles:

`[stylesheet addStyles:@[ style1, style 2 ]];`

If you want to merge styles with existing style, use `appendStylesheet` method on specific style.

```objective-c
[stylesheet appendStylesheetWithPath:<filename>];
[stylesheet appendStylesheet:<stylesheet instance>];
```

All changes are automatically applied to all elements, if `stylesheet` instance is the currently active one.

## Caching stylesheets

For performance enhancements, stylesheets can be saved to a file and loaded at a later point directly. This enables you to completely discard .nss files and create all stylesheets in code and then save them to .nss file. Export stylesheet with the following call:

`[stylesheet exportToFile:path];`

*Note: Stylesheet's may contain `DKStyle` instances that are connected to specific `UIView` instances. Those are ignored when exporting and will not be recreated. Only instances with `styleKey` property defined are exported.*

# Styles

Each UI element has it's style set at runtime. DesignKit inspects the currently loaded stylesheets and sets correct style instance to specific UI element. Style instance is stored in `style` property of each `UIView`. You can get the style of specific UI element by using dot-syntax:

```objective-c
UIView* myView;
DKStyle* style = myStyle;
```

Style of an element can be changed in two ways. 

## Changing style with styleKey UIView property

Easiest way is to change the `styleKey` property of `UIView`, which can be done in code:

`myView.styleKey = @"UniqueStyleKey";`

Or with **User Defined Runtime Attributes** in Interface Builder. Use styleKey key-path for String type and enter your unique style key.

If you wish to put the style back to element's default style, there is a reserved style key:

`myView.styleKey = DKStyleClassDefault`

This is also the default style, if element had no specific unique key defined. If you wish that element has no style applied, there is another reserved styleKey: `DKStyleClassNone`. This style key is also set, if the UI element class is excluded from applying the style. **Using this style key, not all existing style properties are not discarded, as DesignKit does not keep any history,** but they can be easily reset by setting the properties directly for example:

```objective-c
myView.backgroundColor = [UIColor blackColor];
myView.layer.cornerRadius = 5.0;
```

*Class exclusion can still be overriden by setting the style to a specific instance manually, see Changing style with style UIView property.*

## Changing style with viewStyle UIView property

Another way to change the style is to replace the existing `DKStyle` instance with another instance. But first we need to have the `DKStyle` instance. We can get the instance from any stylesheet.

```objective-c
DKStyle* buttonStyle = [stylesheet styleForClass:[UIButton class]];
DKStyle* specificStyle = [stylesheet styleForStyleKey:@"UniqueStyleKey"];
```

Then we can easily set the style to a view and even `styleKey` property will be updated correctly.

`myView.viewStyle = buttonStyle`

If wish to disable the style on a specific view instance, you can set `nil` as the style (which is also returned if style key was set as `DKStyleClassNone`).

`myView.viewStyle = nil;`

## Creating style in code

Styles usually work with a specific style key or UI element. They can be easily created in code:

```objective-c
// An empty style that can only be used on specific view instances
DKStyle* style = [[DKStyle alloc] init];
// A style is created by key
DKStyle* uniqueStyle = [[DKStyle alloc] initWithStyleKey:@"UniqueStyleKey"];
// A style is created for UIButton element
DKStyle* buttonStyle = [[DKStyle alloc] initWithClass:[UIButton class]];
```

When you do not set a style key or a class for the style, `referenceView` must property must be set. This is done automatically for you by DesignKit, if you set the style to a specific view.
*This type of style is called instance style and is removed from stylesheet after the view that had the style applied is removed from view hierarchy.*

# Properties

Properties are managed by `DKStyle` class and can be read and modified at anytime.

## Reading properties

Properties can be read by short modern collection syntax:

`id property = style[DKPropertyImage];`

For UI elements that have multiple states, longer syntax is used:

`id property = [style propertyForKey:DKPropertyImage forState:UIControlStateDisabled];`

## Setting properties
Setting a property on a specific style can be as simple as:

`style[DKPropertyFontName] = @"HelveticaNeue-Light";`

Or a longer way:

```objective-c
[style setProperty:@"HelveticaNeue-Light" forKey:DKPropertyFontName];
[style setProperty:@"HelveticaNeue-Light" forKey:DKPropertyFontName forState:UIControlStateHighlighted];
```

Second call will also recognize control state if applicable. Changes to style are immediately reflected on all elements that have the style applied.

### Setting multiple properties

```objective-c
[style setProperties:@{ DKPropertyFontName : @"HelveticaNeue-Light", DKPropertyBackgroundColor : @"red" }];
[style setProperties:@{ DKPropertyFontName : @"HelveticaNeue-Light", DKPropertyBackgroundColor : @"red" } forState:UIControlStateHighlighted];
```

***If the view hierarchy is already drawn, setting properties will redraw all elements that respond to the style change, which is a very expensive operation.***
*Avoid this scenario as much as possible. If you are setting multiple properties, make sure you either call `setProperties` method that takes a dictionary of properties as an argument. Alternatively you can call `beginUpdates` and `endUpdates` functions on `DKStyle` instance that you are updating to ensure it is not redrawn unnecessarily.*

