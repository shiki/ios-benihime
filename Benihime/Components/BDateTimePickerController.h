//
//  BDateTimePicker.h
//  Benihime
//
//  Created by Shiki on 2/27/12.
//

#import <UIKit/UIKit.h>

@class BDateTimePickerController;
@protocol BDateTimePickerControllerDelegate

@optional

- (void) dateTimePicker:(BDateTimePickerController *)picker didFinish:(NSDate *)dateTime;

@end

@interface BDateTimePickerController : UIViewController

@property (nonatomic, assign) NSObject<BDateTimePickerControllerDelegate> *delegate;
@property (nonatomic, retain) NSDate *dateTime;

@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UITextField *textField;

- (id) initWithDelegate:(NSObject<BDateTimePickerControllerDelegate> *)delegate initialDateTime:(NSDate *)dateTime;

@end
