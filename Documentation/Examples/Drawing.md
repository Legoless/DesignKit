Drawing
========

This section constains example code specifically for DesignKit/Drawing module. Drawing adds specific drawing methods to UIView and it's subclasses.

All drawing code is done in a specific block defined by DKDrawingBlock, which you can define for each UIControl state (supported on UIButton) or general state (supported on all UIView instances).

When executed each block is provided with a frame where all the drawing should occur (usually called by drawRect method) and parameter dictionary, which include parameters such as colors and current orientation angle.
