#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

// From http://joshua.nozzi.name/2012/08/easy-uifont-bold-and-italic-querying-with/
@interface UIFont (Traits)

- (CTFontSymbolicTraits)theTraits;

- (BOOL)isBold;
- (BOOL)isItalic;

@end