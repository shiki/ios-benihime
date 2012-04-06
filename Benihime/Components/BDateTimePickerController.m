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
@interface BDateTimePickerController ()

- (void) updateTextField;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BDateTimePickerController

@synthesize delegate;
@synthesize dateTime;

@synthesize datePicker;
@synthesize textField;

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void ) releaseViewComponents
{
  B_RELEASE_SAFELY(datePicker);
  B_RELEASE_SAFELY(textField);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc
{
  B_RELEASE_SAFELY(dateTime);
  delegate = nil;
  
  [self releaseViewComponents];
  
  [super dealloc];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) viewDidUnload
{
  [self releaseViewComponents];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) afterInit
{
  if (!dateTime)
    dateTime = [[NSDate alloc] init];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id) initWithDelegate:(NSObject<BDateTimePickerControllerDelegate> *)aDelegate initialDateTime:(NSDate *)theDateTime
{
  if ((self = [self init])) {
    self.delegate = aDelegate;
    self.dateTime = theDateTime;
    [self afterInit];
  }
  return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) loadView
{
  if (!self.title)
    self.title = NSLocalizedString(@"Pick Date & Time", nil);
  
  UIView *view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
  view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
  self.view = view;
  
  self.datePicker = [[[UIDatePicker alloc] init] autorelease];
  datePicker.minuteInterval = 5;
  datePicker.frame = BCGRectSetY(datePicker.frame, self.view.frame.size.height - datePicker.frame.size.height);
  datePicker.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
  [self.view addSubview:datePicker];
  
  self.textField = [[[UITextField alloc] init] autorelease];
  textField.enabled = NO;
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.font = [UIFont systemFontOfSize:14];
  textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  textField.textAlignment = UITextAlignmentCenter;
  textField.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  CGFloat height = 31;
  CGFloat margin = 10;
  CGFloat y = (datePicker.frame.origin.y * 0.5) - height;
  textField.frame = CGRectMake(margin, y, view.frame.size.width - margin * 2, height);
  [self.view addSubview:textField];
  
  if (self.navigationController) {
    UIBarButtonItem *bi = [[[UIBarButtonItem alloc] 
                            initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self 
                            action:@selector(didTapDoneButton:)] autorelease];
    self.navigationItem.rightBarButtonItem = bi;
  }
  
  [datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
  
  [self updateTextField];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) viewWillAppear:(BOOL)animated
{
  [self.navigationController setToolbarHidden:YES animated:animated];
  [super viewWillAppear:animated];
  
  self.view.frame = self.view.superview.bounds;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) updateTextField
{
  NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
  [formatter setDateFormat:@"EEE, MMM d, yyyy h:mm a"];
  
  textField.text = [formatter stringFromDate:dateTime];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) didTapDoneButton:(id)sender
{
  if (delegate && [delegate respondsToSelector:@selector(dateTimePicker:didFinish:)]) {
    [delegate dateTimePicker:self didFinish:self.dateTime];
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) datePickerChanged:(id)sender
{
  self.dateTime = datePicker.date;
  [self updateTextField];
}

@end
