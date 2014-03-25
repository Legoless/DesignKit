EffectKit
=======

iOS / OS X framework that attempts to mimic Photoshop's Blending Options. As much as possible. Open .PSD file created in Photoshop and use assets directly in code.

Effects
=======

The following effects from Photoshop's blending options are currently implemented / or in progress.

- Blur
- Stroke (outside, inside)
- Color overlay
- Gradient overlay
- Drop shadow
- Inner glow
- Outer glow

Rendering
=======
All effects are rendered on a separate UIView that is placed above the target layer in the view hierarchy. This allows for setting the opacity of each effect separately.

Icons & Colors
=======
Effect kit contains most commonly used icons and colors.

Compatibility
========

The framework only supports iOS7 as of now.

Contributions
======

The following projects were a great help in creating the **EffectKit**.

- https://github.com/bengotow/PSDWriter
- https://github.com/layervault/psd.rb
