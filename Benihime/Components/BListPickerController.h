//
//  BListPickerController.h
//  Benihime
//
//  Created by Shiki on 2/2/12.
//

#import <UIKit/UIKit.h>

@protocol BListPickerControllerDelegate

- (void) listPickerDidSelectItem:(NSUInteger)rowIndex andValue:(id)value;

@end

@interface BListPickerController : UITableViewController {
  
}

@property (nonatomic, assign) id<BListPickerControllerDelegate> delegate;
@property (nonatomic, strong) NSArray *listData;

- (id) initWithStyle:(UITableViewStyle)style 
               title:(NSString *)title
            listData:(NSArray *)theListData 
         andDelegate:(id<BListPickerControllerDelegate>)theDelegate;

@end
