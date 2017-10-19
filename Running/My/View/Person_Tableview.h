//
//  Person_Tableview.h
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person_Tableview : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (strong ,nonatomic)NSMutableArray *title_Array;
@property (strong ,nonatomic)NSMutableArray *image_Array;
@property (strong ,nonatomic) void (^cell_block)(NSInteger section_index,NSInteger row_index);
@end
