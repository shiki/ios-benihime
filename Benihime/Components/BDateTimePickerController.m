//
//  BDateTimePicker.m
//  Benihime
//
//  Created by Shiki on 2/27/12.
//

#import "BDateTimePickerController.h"

#import "BMacros.h"
#import "BCGeometry.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BDateTimePickerController ()

- (void) updateTextField;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BDateTimePickerController

- (void)afterInit {
  if (!_dateTime)
    self.dateTime = [[NSDate alloc] init];
}

- (id)initWithDelegate:(NSObject<BDateTimePickerControllerDelegate> *)aDelegate
       initialDateTime:(NSDate *)theDateTime {
  if ((self = [self init])) {
    self.delegate = aDelegate;
    self.dateTime = theDateTime;
    [self afterInit];
  }
  return self;
}

- (void)loadView {
  if (!self.title)
    self.title = NSLocalizedString(@"Pick Date & Time", nil);
  
  UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
  view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
  self.view = view;
  
  self.datePicker = [[UIDatePicker alloc] init];
  _datePicker.minuteInterval = 5;
  _datePicker.frame = BCGRectSetY(_datePicker.frame, self.view.frame.size.height - _datePicker.frame.size.height);
  _datePicker.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
  [self.view addSubview:_datePicker];
  
  self.textField = [[UITextField alloc] init];
  _textField.enabled = NO;
  _textField.borderStyle = UITextBorderStyleRoundedRect;
  _textField.font = [UIFont systemFontOfSize:14];
  _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  _textField.textAlignment = NSTextAlignmentCenter;
  _textField.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  CGFloat height = 31;
  CGFloat margin = 10;
  CGFloat y = (_datePicker.frame.origin.y * 0.5) - height;
  _textField.frame = CGRectMake(margin, y, view.frame.size.width - margin * 2, height);
  [self.view addSubview:_textField];
  
  if (self.navigationController) {
    UIBarButtonItem *bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                        action:@selector(didTapDoneButton:)];
    self.navigationItem.rightBarButtonItem = bi;
  }
  
  [_datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
  
  [self updateTextField];
}

- (void)viewWillAppear:(BOOL)animated {
  [self.navigationController setToolbarHidden:YES animated:animated];
  [super viewWillAppear:animated];
  
  self.view.frame = self.view.superview.bounds;
}

- (void)updateTextField {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"EEE, MMM d, yyyy h:mm a"];
  
  _textField.text = [formatter stringFromDate:_dateTime];
}

- (void)didTapDoneButton:(id)sender {
  if (_delegate && [_delegate respondsToSelector:@selector(dateTimePicker:didFinish:)]) {
    [_delegate dateTimePicker:self didFinish:self.dateTime];
  }
}

- (void)datePickerChanged:(id)sender {
  self.dateTime = _datePicker.date;
  [self updateTextField];
}

@end
