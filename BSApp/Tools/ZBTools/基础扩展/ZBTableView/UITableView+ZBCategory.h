//
//  UITableView+ZBCategory.h
//  BSApp
//
//  Created by lizb on 2017/10/17.
//  Copyright © 2017年 BaoThink. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UITableView (ZBCategory)

-(void)estimatedInIOS11;


- (void)headerRefreshAction:(void (^)(void))action;
- (void)footerLoadMoreAction:(void (^)(void))action;

@end
