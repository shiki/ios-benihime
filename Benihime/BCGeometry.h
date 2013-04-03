//
//  BCGeometry.h
//  Benihime
//
//  Created by Shiki on 12/7/11.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

CGRect BCGRectSetWidth(CGRect rect, CGFloat width);
CGRect BCGRectSetHeight(CGRect rect, CGFloat height);
CGRect BCGRectSetSize(CGRect rect, CGSize size);
CGRect BCGRectSetX(CGRect rect, CGFloat x);
CGRect BCGRectSetY(CGRect rect, CGFloat y);

CGRect BCGRectAdd(CGRect rect, CGFloat x, CGFloat y, CGFloat width, CGFloat height);

CGRect BCGRectExpand(CGRect rect, CGFloat x, CGFloat y);

CGFloat BCGDegreesToRadians(CGFloat degrees);
CGFloat BCGRadiansToDegrees(CGFloat radians);
