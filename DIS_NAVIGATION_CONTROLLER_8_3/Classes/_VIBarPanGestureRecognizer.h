//
//  _VIBarPanGestureRecognizer.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _VIBarPanGestureRecognizer : UIGestureRecognizer

@end

@interface _VIBarPanGestureRecognizer(Methods)
@property(readonly, nonatomic) double bias; // @synthesize bias=_bias;
@property(readonly, nonatomic) long long barAction; // @synthesize barAction=_barAction;
- (id)description;
- (_Bool)canPreventGestureRecognizer:(id)arg1;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)_setDelegate:(id)arg1;
- (void)setDelegate:(id)arg1;
- (id)initWithTarget:(id)arg1 action:(SEL)arg2;
@end
