//
//  VINavigationController.m
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/3.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import "VINavigationController.h"

@interface VINavigationController ()

@end

@implementation VINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - A

- (BOOL)_allowNestedNavigationControllers {
    return _navigationControllerFlags->allowNestedNavigationControllers;
}

- (BOOL)_allowsAutorotation {
    BOOL allow = [super _allowsAutorotation];
    UIViewController *topViewController = [self topViewController];
    if (topViewController) {
        allow = allow && [topViewController _allowsAutorotation];
    }
    return allow;
}

- (BOOL)_animationParametersForHidingNavigationBar:(BOOL)hidingNavigationBar lastOperation:(int)lastOperation edge:(unsigned int *)edge duration:(NSTimeInterval *)duration {
    if (_UIApplicationLinkedOnVersionCheck(0x30001)) {
        BOOL shouldCrossFadeNavigationBar = [self _shouldCrossFadeNavigationBar];
        if (lastOperation == 2) {
            if (edge) {
                if (shouldCrossFadeNavigationBar) {
                    *edge = 0x0F;
                }
                else {
                    if (hidingNavigationBar) {
                        *edge = 0x08;
                    }
                    else {
                        *edge = 0x02;
                    }
                }
            }
            //loc_251DAE30
            if (duration) {
                *duration = [self durationForTransition:2];
            }
        }
        else if (lastOperation == 1) {
            if (edge) {
                if (shouldCrossFadeNavigationBar) {
                    *edge = 0x0F;
                }
                else {
                    if (hidingNavigationBar) {
                        *edge = 0x02;
                    }
                    else {
                        *edge = 0x08;
                    }
                }
            }
            //loc_251DAE6E
            if (duration) {
                *duration = [self durationForTransition:1];
            }
        }
        return YES;
    }
    return NO;
}

#pragma mark - B
- (NSString *)_backdropBarGroupName {
    return [NSString stringWithFormat:@"<%@:%p> Backdrop Group", NSStringFromClass(self.class), self];
}

- (NSString *)_backdropGroupName {
    if (!__backdropGroupName) {
        NSString *name = [self _barBackdropGroupNameForAncestorViewController:NO];
        if (!name) {
            name = [self _backdropBarGroupName];
        }
        [self _setBackdropGroupName:name];
    }
    return __backdropGroupName;
}

- (NSString *)_barBackdropGroupNameForAncestorViewController:(BOOL)ancestorViewController {
    return nil;
}

- (BOOL)_barAnimationWasCancelled {
    return __barAnimationWasCancelled;
}

- (_VIAnimationCoordinator *)_barInteractiveAnimationCoordinator {
    return __barInteractiveAnimationCoordinator;
}

- (_VIBarPanGestureRecognizer *)_barSwipeHideGesture {
    return __barSwipeHideGesture;
}

- (_VIBarTapGestureRecognizer *)_barTapHideGesture {
    return __barTapHideGesture;
}

- (CGRect)_boundsForPalette:(id)platte size:(CGSize)size {
    int age = [platte boundaryEdge];
    if (age == 0) {
        return CGRectZero;
    }
}

- (_VINavigationInteractiveTransition *)_builtinInteractionController {
    return __cachedInteractionController;
}

- (_VINavigationParallaxTransition *)_builtinTransitionController {
    return __cachedTransitionController;
}

- (CGFloat)_builtinTransitionGap {
    return _builtinTransitionGap;
}

- (int)_builtinTransitionStyle {
    return _builtinTransitionStyle;
}

#pragma mark - C

- (_VINavigationInteractiveTransition *)_cachedInteractionController {
    return __cachedInteractionController;
}

- (_VINavigationParallaxTransition *)_cachedTransitionController {
    return __cachedTransitionController;
}

- (void)_cancelInteractiveTransition:(CGFloat)transition transitionContext:(id)context {
    CGFloat completionVelocity = [context _completionVelocity];
    BOOL navbarIsAppearingInteractively = [self _navbarIsAppearingInteractively];
    if (navbarIsAppearingInteractively) {
        [self _setBarAnimationWasCancelled:YES];
        UINavigationBar *navigationBar = [self _navigationBarForNestedNavigationController];
        NSString *navbarAnimationId = [self _navbarAnimationId];
        int completionCurve = [context _completionCurve];
        [self _updateInteractiveBarTransition:navigationBar withUUID:navbarAnimationId percent:transition isFinished:YES didComplete:NO completionSpeed:completionVelocity completionCurve:completionCurve];
    }
    else {
        //loc_252BD704
        UINavigationBar *navigationBar = [self _navigationBarForNestedNavigationController];
        CGFloat completionVelocity = [context _completionVelocity];
        int completionCurve = [context _completionCurve];
        [navigationBar _cancelInteractiveTransition:navbarIsAppearingInteractively completionSpeed:ABS(completionVelocity) completionCurve:completionCurve];
    }
    //loc_252BD74C
    if ([self _toolbarIsAnimatingInteractively]) {
        [self _setBarAnimationWasCancelled:YES];
        id toolBar = [self _existingToolbar];
        NSString *toolbarAnimationId = [self _toolbarAnimationId];
        CGFloat completionVelocity = [context _completionVelocity];
        int completionCurve = [context _completionCurve];
        [self _updateInteractiveBarTransition:toolBar withUUID:toolbarAnimationId percent:transition isFinished:YES didComplete:NO completionSpeed:ABS(completionVelocity) completionCurve:completionCurve];
    }
}

- (void)_clearLastOperation {
    //BFC.W           _navigationControllerFlags, #7, #0xD
    _navigationControllerFlags->lastOperation = 0;
    _navigationControllerFlags->lastOperationAnimated = 0;
    _navigationControllerFlags->deferredTransition = 0;
    //BIC.W           _navigationControllerFlags + 4, _navigationControllerFlags + 4, #0x8000000
    _navigationControllerFlags->disappearingViewControllerIsBeingRemoved = 0;
    [self setDisappearingViewController:nil];
}

- (BOOL)_clipUnderlapWhileTransitioning {
    return _navigationControllerFlags->clipUnderlapWhileTransitioning;
}

- (void)_computeAndApplyScrollContentInsetDeltaForViewController:(UIViewController *)viewController {

}

#pragma mark - D
- (NSTimeInterval)durationForTransition:(uint32_t)transation {
    return 0.0
}

#pragma mark - H

#pragma mark - I
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        NSUInteger childViewControllersCount = [self childViewControllersCount];
    }
    return self;
}

- (id)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass {
    if (self = [initWithNibName:bundle:]) {
        [self setNavigationBarClass:navigationBarClass];
        [self _setToolbarClass:toolbarClass];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle {
    if (self = [super initWithNibName:nibName bundle:bundle]) {
        _navigationBarClass = UINavigationBar.class;
        _modalTransitionStyle = -1;
        _navigationControllerFlags->paletteTransitionPending = NO;
        _navigationControllerFlags->lastOperationAnimated = YES;
        _builtinTransitionGap = float(0x41A00000);
        if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomTV) {
            _navigationControllerFlags->isNavigationBarHidden = YES;
        }
        //loc_25045C56
        _navigationControllerFlags->neverInWindow = NO;
        _navigationControllerFlags->allowUserInteractionDuringTransition = NO;
        _navigationControllerFlags->clipUnderlapWhileTransitioning = YES;
        _navigationControllerFlags->enableBackButtonDuringTransition = _UIApplicationLinkedOnVersionCheck(0x80000);
        [self _confirmBarAccessMethods];
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (_UIApplicationLinkedOnVersionCheck(0x60000)) {
        self = [self initWithNibName:nil bundle:nil];
    }
    else {
        self = [self init];
    }
    if (self) {
        [self pushViewController:rootViewController animated:NO];
    }
    return self;
}

- (UIGestureRecognizer *)interactivePopGestureRecognizer {
    UIPanGestureRecognizer *gestureRecognizer = [__cachedInteractionController screenEdgePanGestureRecognizer];
    return gestureRecognizer.retain.autorelease;
}

- (BOOL)isAlreadyPoppingNavItem {
    return _navigationControllerFlags->isAlreadyPoppingNavigationItem;
}

- (BOOL)isBuiltinTransition {
    return _navigationControllerFlags->isBuiltinTransition;
}

- (BOOL)isCustomTransition {
    if (_navigationControllerFlags->isCustomTransition) {
        return _navigationControllerFlags->isTransitioning;
    }
    return NO;
}

- (BOOL)isExpanded {
    return NO;
}

- (BOOL)isInteractiveTransition {
    return _interactiveTransition;
}

- (BOOL)isModalInPopover {
    NSMutableArray *mutableChildViewControllers = [self mutableChildViewControllers];
    for (UIViewController *viewController in mutableChildViewControllers) {
        if (viewController.isModalInPopover) {
            return YES;
        }
    }
    return [super isModalInPopover];
}

- (BOOL)isNavigationBarHidden {
    if ([self _isNestedNavigationController] && [self _outermostNavigationController] != self) {
        return [[self _outermostNavigationController] isNavigationBarHidden];
    }
    else {
        //loc_25049FE2
        return _navigationControllerFlags->isNavigationBarHidden;
    }
}

- (BOOL)isShown {
    return [self _hasAppeared];
}

- (BOOL)isToolbarHidden {
    return !_navigationControllerFlags->isToolbarShown;
}

#pragma mark - M

#pragma mark - N

#pragma mark - O
- (id)_outermostNavigationController {
    if ([self _isNestedNavigationController]) {
        if (self.navigationController) {
            return [self.navigationController _outermostNavigationController];
        }
        else {
            return self;
        }
    }
    else {
        return self;
    }
}

#pragma mark - P
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    id transitionCoordinator = [self _transitionCoordinator];
    if (transitionCoordinator) {
    }
    else {
        //loc_25046362
    }
}

- (void)pushViewController:(UIViewController *)viewController transition:(int)transition {

}

- (void)pushViewController:(UIViewController *)viewController transition:(int)transition forceImmediate:(BOOL)forceImmediate {
    if (viewController) {
        if ([viewController isKindOfClass:UISplitViewController.class]) {
            
        }
        else {
            //loc_25046534
            NSMutableArray *childViewControllers = [self mutableChildViewControllers];
            if ([childViewControllers containsObject:viewController]) {
                //NSString *R6 = [NSString stringWithFormat:@"Pushing the same view controller instance more than once is not supported (%@)",viewController];
                //loc_25046592
                NSAssert(NO, @"");
            }
            else {
                //loc_250465DA
                if ([viewController isKindOfClass:UINavigationController.class]) {
                    if ([self _allowNestedNavigationControllers]) {
                        [viewController _prepareForNestedDisplayWithNavigationController:self];
                        //loc_2504662A
                    }
                    else {
                        //loc_25046ADE
                        //NSString *R6 =
                        NSAssert(NO, @"");
                        //loc_25046592
                    }
                }
                else {
                    //loc_2504662A
                }
                //loc_2504662A
                UIWindow *window = self.view.window;
                UIViewController *lastViewController = childViewControllers.lastObject;
                if (!_navigationControllerFlags->isTransitioning) {
                    if (forceImmediate || window) {
                        //loc_2504667C
                        if (![self disappearingViewController]) {
                            if (![self needsDeferredTransition]) {
                                [self setDisappearingViewController:lastViewController];
                                //loc_250466BC
                            }
                        }
                    }
                }
                //loc_250466BC
                int R5 = 0, R6 = 0, R8 = 0;
                if (window) {
                    R6 = 0;
                    if ([self disappearingViewController]) {
                        R5 = 0;
                        R8 = 0;
                        if (transition != 0) {
                            R5 = transition;
                            R6 = 1;
                            if ([self _appearState] == 2) {
                                R8 = R6 ^ _navigationControllerFlags->isTransitioning;
                                //loc_2504670C
                            }
                            else {
                                //loc_25046708
                                R8 = 0;
                                //loc_2504670C
                            }
                        }
                        else {
                            //loc_2504670C
                        }
                        //loc_2504670C
                    }
                    else {
                        //loc_25046706
                        R5 = 0;
                        //loc_25046708
                        R8 = 0;
                        //loc_2504670C
                    }
                   
                }
                else {
                    //loc_25046704
                    R6 = 0;
                    //loc_25046706
                    R5 = 0;
                    //loc_25046708
                    R8 = 0;
                    //loc_2504670C
                }
                //loc_2504670C
                //loc_2504672C
                if (!_UIApplicationLinkedOnVersionCheck(0x50000)) {
                    R8 = R6;
                }
                /*
                AND.W           R0, R0, R8,LSL#11
                //R0[+11b] = R8
                BFC.W           R2, #7, #0xD
                //R2 = flag[+0] 清零 7 - 19b
                ORR.W           R0, R0, R2
                ADDS            R2, R4, R1
                LDR             R6, [R2,#4]
                //R6 = flag[+4]
                MOVW            R5, #:lower16:(selRef_count - 0x25046774)
                ORR.W           R0, R0, R3
                //R0 |=
                MOVT.W          R5, #:upper16:(selRef_count - 0x25046774)
                ORR.W           R0, R0, #0x80
                ADD             R5, PC  ; selRef_count
                STR             R0, [R4,R1]
                 */
                if (childViewControllers.count == 0) {
                    [self setTitle:viewController.title];
                    [[self _parentViewController] updateTabBarItemForViewController:self];
                    //loc_250467CA
                }
                else {
                    //loc_250467CA
                }
                //loc_250467CA
                [self _addChildViewController:viewController performHierarchyCheck:NO notifyWillMove:NO];
                [self setNeedsStatusBarAppearanceUpdate];
                [UIApp _deactivateReachability];
                if (!_navigationControllerFlags->isTransitioning || !_UIApplicationLinkedOnVersionCheck(0x50000)) {
                    [self setNeedsDeferredTransition];
                }
                //loc_25046846
                void (^block)(void) = ^{
                    //___71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke
                    UINavigationBar *navigationBar = [self navigationBar];
                    if (!viewController.navigationItem) {
                        [viewController loadViewIfRequired];
                    }
                    //loc_250512D8
                    if (!self.isNavigationBarHidden || [self _isNestedNavigationController]) {
                        //loc_25051308
                        if (navigationBar.topItem != viewController.navigationItem) {
                            [navigationBar setLocked:NO];
                            if ([viewController _isNestedNavigationController] || [self _isNestedNavigationController]) {
                                //loc_25051368
                                [viewController _appendNavigationItemsToNavigationController:self transition:R5];
                                //loc_2505137A
                            }
                            else {
                                //loc_25051400
                                [navigationBar _pushNavigationItem:viewController.navigationItem transition:R5];
                                //loc_2505137A
                            }
                            //loc_2505137A
                            [navigationBar setLocked:YES];
                            id transitionCoordinator = [self _transitionCoordinator];
                            if (transitionCoordinator) {
                                [transitionCoordinator animateAlongsideTransition:nil completion:^(id context){
                                    //___71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke_2
                                    [self _updateInteractivePopGestureEnabledState];
                                }];
                            }
                            else {
                                //loc_250513E6
                                [self _updateInteractivePopGestureEnabledState];
                            }
                        }
                        else {
                            //loc_250513F8
                        }
                    }
                    else {
                        //loc_250513F8
                    }
                };
                
                if (R8) {
                    if ([self _usesTransitionController]) {
                        _navigationControllerFlags->isCustomTransition = YES;
                        id customTransitionController = [self _customTransitionController:R8];
                        [self _setTransitionController:customTransitionController];
                        id context = [NSClassFromString(@"_UIViewControllerTransitionContext") _associatedTransitionContextForObject:customTransitionController];
                        UIViewController *disappearingViewController = [self disappearingViewController];
                        [self _presentationTransitionWrapViewController:disappearingViewController forTransitionContext:context];
                        CGFloat transitionDuration = [customTransitionController transitionDuration:context];
                        [self setCustomNavigationTransitionDuration:transitionDuration];
                        BOOL allowUserInteractionDuringTransition = [self allowUserInteractionDuringTransition];
                        [context _setAllowUserInteraction:allowUserInteractionDuringTransition];
                        if (context) {
                            id customInteractionController = [self _customInteractionController:context];
                            [self _setInteractionController:customInteractionController];
                            CGFloat customNavigationTransitionDuration = [self customNavigationTransitionDuration];
                            [context _setDuration:customNavigationTransitionDuration];
                            //loc_25046A0C
                        }
                        else {
                            //loc_25046A0C
                        }
                        //loc_25046A0C
                        [self _hideOrShowBottomBarIfNeededWithTransition:R5];
                        if (forceImmediate) {
                            id transitionController = [self _transitionController];
                            [self _startDeferredTransitionIfNeeded:transitionController];
                        }
                        //loc_25046A4E
                        //loc_25046AC2
                        [self _executeNavigationHandler:^{
                            //___71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke1458
                            UIViewController *rootAncestorViewController = [self _rootAncestorViewController];
                            NSArray *views = [rootAncestorViewController _viewsWithDisabledInteractionGivenTransitionContext:context];
                            [context _disableInteractionForViews:views];
                            block();
                        } deferred:YES];
                        return;
                    }
                    else {
                        //loc_25046A5A
                        UIViewController *disappearingViewController = [self disappearingViewController];
                        [self _presentationTransitionWrapViewController:disappearingViewController forTransitionContext:nil];
                        [self _startDeferredTransitionIfNeeded:NO];
                        //loc_25046AAA
                    }
                }
                else {
                    //loc_25046A52
                    if (forceImmediate) {
                        //loc_25046A5A
                        UIViewController *disappearingViewController = [self disappearingViewController];
                        [self _presentationTransitionWrapViewController:disappearingViewController forTransitionContext:nil];
                        [self _startDeferredTransitionIfNeeded:NO];
                        //loc_25046AAA
                    }
                    else {
                        //loc_25046A98
                        [self _propagateContentAdjustmentsForControllersWithSharedViews];
                        //loc_25046AAA
                    }
                }
                //loc_25046AAA
                [self _hideOrShowBottomBarIfNeededWithTransition:R5];
                //loc_25046AC2
                [self _executeNavigationHandler:block deferred:NO];
            }
        }
    }
    else {
        //loc_25046522
    }
}

#pragma mark - S
- (BOOL)_shouldCrossFadeNavigationBar {
    return NO;
}

- (void)_setBackdropGroupName:(NSString *)name {

}

- (void)_setNavigationBarHidden:(BOOL)hidden edge:(unsigned long long)edge duration:(double)duration {
    printf("VINAV hidden:%d, edge:%d, duration:%f, --1\n",hidden,edge,duration );
    if (hidden != _navigationControllerFlags->isNavigationBarHidden) {
        printf("VINAV hidden:%d, edge:%d, duration:%f, --2\n",hidden,edge,duration );
        UINavigationBar *navigationBar = [self _navigationBarHiddenByDefault:hidden];
        if (hidden) {
            [navigationBar setLocked:NO];
            [navigationBar _cancelInProgressPushOrPop];
            [navigationBar setLocked:YES];
            //loc_25119402
        }
        else {
            //loc_25119340
            if (!_navigationControllerFlags->isAlreadyPoppingNavigationItem) {
                [navigationBar setLocked:NO];
                [navigationBar setItems:[self _navigationItems]];
                [navigationBar setLocked:YES];
            }
            //loc_25119390
            [self.view addSubview:navigationBar];
            [UIView performWithoutAnimation:^{
                if (!_navigationControllerFlags->avoidMovingNavBarOffscreenBeforeUnhiding) {
                    [self _positionNavigationBarHidden:YES edge:edge];
                    if (![self _isTransitioning]) {
                        [self _positionPaletteHidden:YES edge:edge];
                    }
                }
                //loc_251DAF00
                [navigationBar setNeedsLayout];
                [navigationBar layoutIfNeeded];
                [navigationBar setHidden:NO];
            }];
            //loc_25119402
        }
        //loc_25119402
        if (duration > 0) {
            if ([self isInteractiveTransition]) {
                [self _startInteractiveNavbarTransition];
            }
            //loc_2511943E
            id transitionCoordinator = [self transitionCoordinator];
            [UIView beginAnimations:@"UINavigationControllerHideShowNavigationBar" context:nil];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:duration];
            if ([self isInteractiveTransition]) {
                [UIView setAnimationCurve:UIViewAnimationCurveLinear];
                //loc_251194EE
            }
            //loc_251194C4
            else if (transitionCoordinator){
                [UIView setAnimationCurve:[transitionCoordinator completionCurve]];
            }
            //loc_251194EE
            [UIView setAnimationDidStopSelector:@selector(_hideShowNavigationBarDidStop:finished:context:)];
            if (hidden) {
                [UIView setAnimationBeginsFromCurrentState:YES];
            }
            //loc_25119526
        }
        //loc_25119526
        _navigationControllerFlags->isNavigationBarHidden = hidden;
        BOOL after = _navigationControllerFlags->isNavigationBarHidden;
        [self setNeedsStatusBarAppearanceUpdate];
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad && edge == 1) {
            if (_UIApplicationUsesLegacyUI() || _navigationControllerFlags->pretendNavBarHidden) {
                //loc_25119594
                [self.navigationBar.superview sendSubviewToBack:self.navigationBar];
            }
        }
        //loc_251195EA
        if (_topPalette && [_topPalette boundaryEdge] == 5) {
            if (hidden && ![_topPalette isVisibleWhenPinningBarIsHidden]) {
                //loc_2511964A
                [_topPalette.superview sendSubviewToBack:_topPalette];
            }
            else {
                //loc_2511962C
                [_topPalette.superview bringSubviewToFront:_topPalette];
            }
        }
        //loc_2511966E
        [self _positionNavigationBarHidden:hidden edge:edge];
        BOOL restart = [_topPalette _restartPaletteTransitionIfNecessary];
        if (![self _isTransitioning] || (!_navigationControllerFlags->paletteTransitionPending && !restart)) {
            //loc_251196C2
            [self _positionPaletteHidden:hidden edge:edge];
        }
        else if (restart) {
            [self _startPaletteTransitionIfNecessary:[self transitionCoordinator] animated:NO];
        }
        //loc_251196D8
        if ([self _customizesForPresentationInPopover] && hidden) {
            [[self navigationBar] _fadeAllViewsOut];
        }
        //loc_2511971A
        if (!hidden) {
            [[self navigationBar] _fadeAllViewsIn];
        }
        //loc_25119742
        if (edge == 1) {
            if ([self _customizesForPresentationInPopover]) {
                [self _layoutTopViewControllerInSheet];
            }
            else {
                //loc_25119762
                [self _layoutTopViewController];
            }
        }
        //loc_25119774
        void (^block)(void) = ^{
            //___64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke900
            if (edge != 1) {
                if([self _customizesForPresentationInPopover]) {
                    [self _layoutTopViewControllerInSheet];
                }
                else {
                    //loc_252BE2F8
                    [self _layoutTopViewController];
                }
            }
            //loc_252BE308
            [self _computeAndApplyScrollContentInsetDeltaForViewController:self.topViewController];
        };
        if (duration <= 0) {
            //loc_251197FC
            if (_navigationControllerFlags->isCustomTransition) {
                id transitionCoordinator = [self.topViewController transitionCoordinator];
                [transitionCoordinator animateAlongsideTransition:0 completion:^(id context){
                    [self _hideShowNavigationBarDidStop:@"UINavigationControllerHideShowNavigationBar" finished:@YES context:context];
                }];
            }
            else {
                //loc_25119866
                [self _hideShowNavigationBarDidStop:@"UINavigationControllerHideShowNavigationBar" finished:@YES context:nil];
                block();
            }
        }
        else {
            [UIView endAnimations];
            if ([self isInteractiveTransition]) {
                [UIView _finishAnimationTracking];
            }
            block();
        }
    }
}

- (void)_setNavigationBarHidden:(BOOL)hidden edgeIfNotNavigating:(unsigned long long)edge duration:(double)duration {
    if (hidden != _navigationControllerFlags->isNavigationBarHidden) {
        BOOL R4 = NO;
        if (!_topPalette) {
            R4 = YES;
        }
        else if (_topPalette.isAttached) {
            R4 = YES;
        }
        else {
            R4 = !_topPalette.isVisibleWhenPinningBarIsHidden;
        }
        //loc_25198784
        if ([self _isTransitioning] || R4) {
            //loc_251987D2
            if (/*!(!hidden || R4)*/hidden && !R4) {
                if ([self _isTransitioning]) {
                    if (!_topPalette.superview) {
                        [_topPalette _setPalettePinningBarHidden:YES];
                    }
                }
            }
            //loc_2519881C
            if ([self wasLastOperationAnimated]) {
                NSLog(@"");
                [self _animationParametersForHidingNavigationBar:hidden lastOperation:[self lastOperation] edge:&edge duration:&duration];
            }
            //loc_25198866
            if (!R4) {
                if ([_topPalette isPinned]) {
                    [_topPalette _setPalettePinningBarHidden:hidden];
                    [_topPalette _resetConstraintConstants:0];
                }
                else {
                    //loc_251988B2
                    id transitionCoordinator = [self transitionCoordinator];
                    [transitionCoordinator animateAlongsideTransition:NO completion:^(id context){
                        //___79__UINavigationController__setNavigationBarHidden_edgeIfNotNavigating_duration___block_invoke
                        if (![context isCancelled]) {
                            [_topPalette _setPalettePinningBarHidden:hidden];
                            CGFloat D0 = 0;
                            if ([self _viewControllerUnderlapsStatusBar]) {
                                D0 = [self _statusBarHeightAdjustmentForCurrentOrientation];
                            }
                            //loc_252005D2
                            if (!hidden) {
                                D0 = 0;
                            }
                            [_topPalette _resetConstraintConstants:D0];
                        }
                    }];
                }
            }
            //loc_2519890E
            [self _setNavigationBarHidden:hidden edge:edge duration:duration];
        }
        else {
            [self _repositionPaletteWithNavigationBarHidden:hidden duration:duration shouldUpdateNavigationItems:YES];
        }
    }
}

- (void)_setNavigationBarHidesCompletelyOffscreen:(BOOL)hidden {
    /*R0 = (flag[+4]) BIC 0x800
    R0 = R0 ORR (hidden << 11)
    flag[+4] = R0*/
    _navigationControllerFlags->navigationBarHidesCompletelyOffscreen = hidden;
}

- (void)setNavigationBar:(UINavigationBar *)navigationBar {
    if (navigationBar != _navigationBar) {
        NSMutableArray *childViewControllers = [self mutableChildViewControllers];
        [_navigationBar setLocked:NO];
        [_navigationBar setDelegate:nil];
        [_navigationBar removeFromSuperview];
        [_navigationBar _setBackdropViewLayerGroupName:nil];
        [_navigationBar release];

        //_navigationBar = [navigationBar retain];
        SET_INSTANCE_IVAR(UINavigationBar *, _navigationBar, [navigationBar retain]);
        UIView *view = _view;
        if (view.window) {
            NSString *backdropGroupName = [self _backdropGroupName];
            [navigationBar _setBackdropViewLayerGroupName:backdropGroupName];
        }
        //loc_2504963E
        [self _setVisualAltitudeForBar:_navigationBar];
        CGSize navigationBarSize = [UINavigationBar defaultSize];
        //loc_25049692
        CGFloat width = 0;
        if (_containerView) {
            CGRect containerViewFrame = _containerView.frame;
            width = containerViewFrame.size.width;
            navigationBarSize.width = containerViewFrame.size.width;
        }
        else {
            width = navigationBarSize.width;
        }
        //loc_250496C8
        _navigationBar.frame = CGRectMake(0, 0, width, navigationBarSize.height);
        _navigationBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _navigationBar.delegate = self;
        [self.view addSubView: _navigationBar];

        if (childViewControllers.count) {
            NSMutableArray *navigationItems = [[NSMutableArray alloc] init];
            for (UIViewController *viewController in childViewControllers) {
                [navigationItems addObject:viewController.navigationItem];
            }
            //loc_25049800
            [_navigationBar setItems:navigationItems];
            [navigationItems release];
        }

        //loc_25049826
        [_navigationBar setLocked:YES];
        [self _positionNavigationBarHidden:_navigationControllerFlags->isNavigationBarHidden];
        [_navigationBar setHidden:_navigationControllerFlags->isNavigationBarHidden];
    }
}

- (void)setNavigationBarClass:(Class)class {
    if (!class) {
        class = UINavigationBar.class;
        SET_INSTANCE_IVAR(Class, _navigationBarClass, class);
        //_navigationBarClass = class;
    }
    else if ([class isSubclassOfClass:UINavigationBar.class]) {
        SET_INSTANCE_IVAR(Class, _navigationBarClass, class);
        //_navigationBarClass = class;
    }
    else {
        NSAssert(NO, @"%@ is not a subclass of UINavigationBar", NSStringFromClass(class));
    }
}

- (void)setNavigationBarHidden:(BOOL)hidden {
    [self setNavigationBarHidden:hidden animated:NO];
}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    VINavigationController *outermostNavigationController = [self _outermostNavigationController];
    if (animated) {
        NSTimeInterval duration = 0.0;
        if ([self _isTransitioning]) {
            duration = [self customNavigationTransitionDuration];
        }
        else {
            //loc_25119292
            duration = 0.20000000;
        }
        duration = 0.200;
        [outermostNavigationController _setNavigationBarHidden:hidden edgeIfNotNavigating:1 duration:duration];
    }
    else {
        //loc_2511927E
        [outermostNavigationController _setNavigationBarHidden:hidden edge:YES duration:0];
    }
}
//
- (void)setNeedsDeferredTransition {
    [self setNeedsDeferredTransition:YES];
}

- (void)setNeedsDeferredTransition:(BOOL)needsDeferredTransition {
    if (needsDeferredTransition != _navigationControllerFlags->needsDeferredTransition) {
        _navigationControllerFlags->needsDeferredTransition = needsDeferredTransition;
        if (needsDeferredTransition) {
            [_containerView setNeedsLayout];
            UIView *containerSuperView = _containerView.superview;
            CGRect containerViewFrame = _containerView.frame;
            CGPoint point = [containerSuperView convertPoint:containerViewFrame.origin toView:nil];
            //loc_25050A38
            containerViewFrame = _containerView.frame;
            //loc_25050A62
            if (point.x + containerViewFrame.size.width <= 0) {
                [UIApp _performBlockAfterCATransactionCommits:^{
                    [_containerView layoutSubviews];
                }];
            }
        }
    }
}

#pragma mark - T
- (id)tabBarItem {
    return [super tabBarItem];
}

- (id)toolbar {
    return [super toolbar];
}

- (void)traitCollectionDidChange:(id)arg {
    [super traitCollectionDidChange:arg];
}

- (UIViewController *)topViewController {
    NSMutableArray *childViewControllers = [self mutableChildViewControllers];
    return [[childViewControllers.lastObject retain] autorelease];
}

@end
