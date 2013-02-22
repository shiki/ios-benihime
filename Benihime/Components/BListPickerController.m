//
//  BListPickerController.m
//  Benihime
//
//  Created by Shiki on 2/2/12.
//

#import "BListPickerController.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BListPickerController

- (id)initWithStyle:(UITableViewStyle)style
               title:(NSString *)title 
            listData:(NSArray *)theListData 
         andDelegate:(id<BListPickerControllerDelegate>)theDelegate {
  if ((self = [super initWithStyle:style])) {
    self.title = title;
    self.listData = theListData;
    self.delegate = theDelegate;
  }
  
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:YES animated:YES];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *const kCellIdentifier = @"list_picker_cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                  reuseIdentifier:kCellIdentifier];
  }
  
  NSString *label = [_listData objectAtIndex:indexPath.row];
  cell.textLabel.text = label;
  return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (_delegate)
    [_delegate listPickerDidSelectItem:indexPath.row andValue:[_listData objectAtIndex:indexPath.row]];
}

@end
