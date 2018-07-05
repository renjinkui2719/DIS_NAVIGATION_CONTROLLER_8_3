//
//  _VIAnimationCoordinator.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _VIAnimationCoordinator : NSObject <UIViewControllerAnimatedTransitioning>

@end

@interface _VIAnimationCoordinator(Methods)
@property(nonatomic) struct CGRect endFrame; // @synthesize endFrame=_endFrame;
@property(nonatomic) struct CGRect startFrame; // @synthesize startFrame=_startFrame;
@property(retain, nonatomic) UIViewController *viewController; // @synthesize viewController=_viewController;
@property(retain, nonatomic) UIView *containerView; // @synthesize containerView=_containerView;
@property(copy, nonatomic) dispatch_block_t completion; // @synthesize completion=_completion;
@property(copy, nonatomic) dispatch_block_t animator; // @synthesize animator=_animator;
@property(copy, nonatomic) dispatch_block_t preperation; // @synthesize preperation=_preperation;
@property(nonatomic) double duration; // @synthesize duration=_duration;
- (void)animationEnded:(_Bool)arg1;
- (void)animateTransition:(id)arg1;
- (double)transitionDuration:(id)arg1;
- (void)finishInteractiveAnimation;
- (void)cancelInteractiveAnimation;
- (void)updateInteractiveProgress:(double)arg1;
- (void)animateInteractively;
- (void)animate;
- (void)_updateTransitionContext;
@property(readonly, retain, nonatomic) NSMutableDictionary *stash;
@property(readonly, retain, nonatomic) id transitionContext;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;
@end
