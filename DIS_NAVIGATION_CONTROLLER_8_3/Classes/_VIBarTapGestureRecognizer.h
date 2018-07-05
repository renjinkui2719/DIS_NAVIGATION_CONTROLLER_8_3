//
//  _VIBarTapGestureRecognizer.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _VIBarTapGestureRecognizer : UIGestureRecognizer

@end

@interface _VIBarTapGestureRecognizer(Methods)
@property(nonatomic) _Bool failWhenTappingInBars; // @synthesize failWhenTappingInBars=_failWhenTappingInBars;
@property(readonly, nonatomic) long long tapCategory; // @synthesize tapCategory=_tapCategory;
- (id)description;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (long long)_categoryForTapLocation:(struct CGPoint)arg1;
- (void)_setDelegate:(id)arg1;
- (void)setDelegate:(id)arg1;
- (id)initWithTarget:(id)arg1 action:(SEL)arg2;

@end
