//
//  _VINavigationParallaxTransition.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _VINavigationParallaxTransition : NSObject

@end

@interface _VINavigationParallaxTransition(Methods)
+ (double)defaultSlidingTransitionDuration;
+ (void)setDefaultSlidingTransitionDuration:(double)arg1;
@property(retain, nonatomic) UIColor *overrideDimmingColor; // @synthesize overrideDimmingColor=_overrideDimmingColor;
@property(nonatomic, setter=_setShouldReverseLayoutDirection:) _Bool _shouldReverseLayoutDirection; // @synthesize _shouldReverseLayoutDirection=__shouldReverseLayoutDirection;
@property(nonatomic) double transitionGap; // @synthesize transitionGap=_transitionGap;
@property(nonatomic) long long transitionStyle; // @synthesize transitionStyle=_transitionStyle;
@property(nonatomic) _Bool clipUnderlapWhileTransitioning; // @synthesize clipUnderlapWhileTransitioning=_clipUnderlapWhileTransitioning;
@property(retain, nonatomic) UIView *clipUnderView; // @synthesize clipUnderView=_clipUnderView;
@property(retain, nonatomic) UIView *containerToView; // @synthesize containerToView=_containerToView;
@property(retain, nonatomic) UIView *containerFromView; // @synthesize containerFromView=_containerFromView;
@property(retain, nonatomic) UIView *contentDimmingView; // @synthesize contentDimmingView=_contentDimmingView;
@property(retain, nonatomic) UIView *borderDimmingView; // @synthesize borderDimmingView=_borderDimmingView;
@property(nonatomic) NSObject *interactionController; // @synthesize interactionController=_interactionController;
@property(nonatomic) _Bool interactionAborted; // @synthesize interactionAborted=_interactionAborted;
@property(retain, nonatomic) id <UIViewControllerContextTransitioning> transitionContext; // @synthesize transitionContext=_transitionContext;
@property(nonatomic) long long operation; // @synthesize operation=_operation;
- (void)_stopTransitionImmediately;
- (id)_timingFunctionForAnimation;
- (id)_basicAnimationForView:(id)arg1 withKeyPath:(id)arg2;
- (void)completeKeyboard:(id)arg1;
- (void)animateKeyboard:(id)arg1;
- (void)prepareToAnimateKeyboard:(id)arg1;
- (void)resizeShadow:(id)arg1;
- (id)shadowContainerForKeyboardTransition:(id)arg1;
- (void)animateTransition:(id)arg1;
- (double)parallaxOffset;
- (double)gapBetweenViews;
- (void)animationEnded:(_Bool)arg1;
- (double)transitionDuration:(id)arg1;
- (id)resizedFromContainerView;
- (id)resizedToContainerView;
- (id)initWithCurrentOperation:(long long)arg1;
@end
