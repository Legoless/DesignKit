# Styling

Styling an application usually goes in few steps such as:
- Placing correct views on Storyboard,
- Connect views to outlets in code,
- For each view provide correct code,
- Repeat for each view controller.

A very cumbersome steps indeed, even with all the copy-pasting that can be done. But this process can be much easier, cleaner and faster. If all the available styling is decoupled from view controller, we can easily control the style from a single property. Being an experienced .NET developer, I already knew all about styles.

*But what is there on iOS for this purpose? UIAppearance?*
Don't think so.

## NUI

Tom Benner created NUI to give developers a chance to work with a CSS style syntax to define styles to specific UI elements. At first I was quite happy, it seemed to be exactly what I was looking for. I was even thinking, great, job done.

But, while NUI is a great framework, it has some limitations. Specific properties cannot be changed at all. Lets say I want to modify the background-color of the button at runtime. NUI allows you to change the class that renders the button, but that is a lot of overhead.

Instead of building a completely own framework for styling and basically redoing all of Tom Benner's work once again, I decided to build on top of NUI.

This means that everything that is available in NUI, is also available in DesignKit.

## DesignKit

Integrating closely with NUI and sharing many components makes DesignKit a really powerful framework, while still providing very easy to use API. There are multiple features that make DesignKit even few steps ahead of NUI framework.

1. DesignKit allows you to create any style at runtime. The style can be for specific element or tied to a specific class of elements.

2. A single access point to style is provided through style property added via category to UIView.

3. DesignKit defines all available style properties, which can be used to set or retrieve information of a single style property.

4. Changes to a specific style are reflected on all elements in view hierarchy that have the style applied.

5. Complete styling freedom, do as you like, without any limits, directly in code or via stylesheets as with NUI framework.


**We can safely say, we got the last step of styling process covered with Styles in DesignKit.**

### Elements of styling

Styling the application is done by using 3 important elements:

- **Property**
  
  A property is a single setting of a view hierarchy element, such as background color or border width. Each property has a specific value that can be set by the developer. See property reference for all properties.

- **Style**

  A style has a collection of properties applied to specifc UI element, such as UIView or UIButton. Allows you to change properties that are reflected on all elements that have the same style. Styles can be tied to a specific unique key or a specific UI element.

- **Stylesheets**

  Stylesheet is a collection of styles, usually read from a stylesheet file by NUI framework. DesignKit builds on this functionality and allows creating and loading stylesheets in code, appending and mixing them together.

### Usage

Enough theory. The **usage** section has many samples of what can be done with styling in DesignKit.