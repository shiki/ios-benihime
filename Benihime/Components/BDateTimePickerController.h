//
//  BDateTimePicker.h
//  Benihime
//
//  Created by Shiki on 2/27/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BDateTimePickerController;

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@protocol BDateTimePickerControllerDelegate

@optional

- (void)dateTimePicker:(BDateTimePickerController *)picker didFinish:(NSDate *)dateTime;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BDateTimePickerController : UIViewController

@property (nonatomic, weak) NSObject<BDateTimePickerControllerDelegate> *delegate;
@property (nonatomic, strong) NSDate *dateTime;

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UITextField *textField;

- (id)initWithDelegate:(NSObject<BDateTimePickerControllerDelegate> *)delegate initialDateTime:(NSDate *)dateTime;

@end
