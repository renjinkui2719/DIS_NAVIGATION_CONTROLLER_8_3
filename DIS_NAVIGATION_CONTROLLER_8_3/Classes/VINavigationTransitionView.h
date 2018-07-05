//
//  VINavigationTransitionView.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VINavigationTransitionView : UIView

@end

@interface VINavigationTransitionView(Methods)
+ (double)defaultDurationForTransition:(long long)arg1;
@property(readonly) UIView *fromView; // @synthesize fromView=_fromView;
@property(nonatomic) __weak id delegate; // @synthesize delegate=_delegate;
@property(nonatomic) _Bool usesRoundedCorners;
- (void)_navigationTransitionDidStop;
- (void)_cleanupTransition;
- (void)_cleanupTransitionFromPopover;
- (void)_notifyDelegateTransitionDidStopWithContext:(id)arg1;
- (_Bool)_isTransitioningFromView:(id)arg1;
@property(readonly) _Bool isTransitioning;
- (_Bool)transition:(long long)arg1 fromView:(id)arg2 toView:(id)arg3;
- (_Bool)transition:(long long)arg1 toView:(id)arg2;
- (void)dealloc;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)initWithFrame:(struct CGRect)arg1;
@property(nonatomic) _Bool popoverWillCleanUpNavigationTransition;
@end
