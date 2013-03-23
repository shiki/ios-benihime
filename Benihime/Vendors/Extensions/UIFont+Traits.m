#import "UIFont+Traits.h"

@implementation UIFont (Traits)

- (CTFontSymbolicTraits)theTraits {
  CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)self.fontName, self.pointSize, NULL);
  CTFontSymbolicTraits symbolicTraits = CTFontGetSymbolicTraits(fontRef);
  CFRelease(fontRef);
  return symbolicTraits;
}

- (BOOL)isBold {
  CTFontSymbolicTraits symbolicTraits = [self theTraits];
  return (symbolicTraits & kCTFontBoldTrait);
}

- (BOOL)isItalic {
  CTFontSymbolicTraits symbolicTraits = [self theTraits];
  return (symbolicTraits & kCTFontItalicTrait);
}

@end