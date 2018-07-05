//
//  UIViewController+Private.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/3.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Private)
- (BOOL)_allowsAutorotation;
- (NSMutableArray *)mutableChildViewControllers;
@end
