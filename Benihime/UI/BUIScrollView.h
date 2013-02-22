//
//  BUIScrollView.h
//  Benihime
//
//  A replacement for UIScrollView. When the keyboard is shown, this finds the focused 
//  control (e.g. UITextField) and scrolls to that control so it will be visible.
//
//  Created by Shiki on 2/20/12.
//

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BUIScrollView : UIScrollView

// supa long property name!
@property (nonatomic) NSInteger heightAdjustOnVisibleKeyboard;

@end
