//
//  BCGeometry.h
//  Benihime
//
//  Created by Shiki on 12/7/11.
//

#import <Foundation/Foundation.h>

CGRect BCGRectSetHeight(CGRect rect, CGFloat height);
CGRect BCGRectSetY(CGRect rect, CGFloat y);

CGRect BCGRectAdd(CGRect rect, CGFloat x, CGFloat y, CGFloat width, CGFloat height);

CGRect BCGRectExpand(CGRect rect, CGFloat x, CGFloat y);