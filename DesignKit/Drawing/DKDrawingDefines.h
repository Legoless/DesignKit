/*!
 * A drawing block should be provided to the button to draw specific state.
 * All drawing is done on UIKit's graphic context.
 */
typedef void (^DKDrawingBlock)(CGRect rect, NSDictionary* parameters);

/*!
 * A specific alias to NSString.
 */
typedef NSString DKDrawingSourceTag;

/*!
 * A specific alias to NSString.
 */
typedef NSString DKDrawingVectorShape;