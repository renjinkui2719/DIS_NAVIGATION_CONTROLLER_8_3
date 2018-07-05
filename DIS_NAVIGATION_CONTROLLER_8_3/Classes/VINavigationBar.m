//
//  VINavigationBar.m
//  Yeecall
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 YeeCall. All rights reserved.
//

#import "VINavigationBar.h"

@implementation VINavigationBar
- (void)_addItems:(id)arg1 withEffectiveDelegate:(id)arg2 transition:(int)arg3 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _addItems:arg1 withEffectiveDelegate:arg2 transition:arg3];
}

- (void)_addItem:(id)arg1 withEffectiveDelegate:(id)arg2 transition:(int)arg3 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _addItem:arg1 withEffectiveDelegate:arg2 transition:arg3];
}

- (void)_setItemsUpToItem:(id)arg1 transition:(int)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _setItemsUpToItem:arg1 transition:arg2];
}

- (void)_setItems:(id)arg1 transition:(int)arg2 reset:(_Bool)arg3 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _setItems:arg1 transition:arg2 reset:arg3];
}

- (void)_setItems:(id)arg1 transition:(int)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _setItems:arg1 transition:arg2];
}

- (void)_setItems:(id)arg1 transition:(int)arg2 reset:(_Bool)arg3 resetOwningRelationship:(_Bool)arg4 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _setItems:arg1 transition:arg2 reset:arg3 resetOwningRelationship:arg4];
}

- (void)_displayItemsKeepingOwningNavigationBar:(id)arg1 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _displayItemsKeepingOwningNavigationBar:arg1];
}

- (void)_redisplayItems {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _redisplayItems];
}

- (_Bool)_didVisibleItemsChangeWithNewItems:(id)arg1 oldItems:(id)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    return [super _didVisibleItemsChangeWithNewItems:arg1 oldItems:arg2];
}

- (void)setItems:(id)arg1 animated:(_Bool)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super setItems:arg1 animated:arg2];
}

- (int)_transitionForOldItems:(id)arg1 newItems:(id)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    return [super _transitionForOldItems:arg1 newItems:arg2];
}
- (void)_updateContentIfTopItem:(id)arg1 animated:(_Bool)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _updateContentIfTopItem:arg1 animated:arg2];
}
- (void)_updateNavigationBarItemsForStyle:(long long)arg1 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _updateNavigationBarItemsForStyle:arg1];
}
- (void)_updateNavigationBarItemsForStyle:(long long)arg1 previousTintColor:(id)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _updateNavigationBarItemsForStyle:arg1 previousTintColor:arg2];
}

- (void)_updateNavigationBarItem:(id)arg1 forStyle:(long long)arg2 previousTintColor:(id)arg3{
    NSLog(@"VINavigationBar, line:%d, itemsCount:%d,arg1:%@",__LINE__,[self.navigationItems count],NSStringFromClass([arg1 class]));
    [super _updateNavigationBarItem:arg1 forStyle:arg2 previousTintColor:arg3];
}

- (void)setNavigationItems:(id)arg1 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super setNavigationItems:arg1];
}
//- (id)navigationItems {
//    NSLog(@"VINavigationBar, line:%d",__LINE__);
//    return [super navigationItems];
//}
- (void)_popNavigationItemWithTransitionAssistant:(id)arg1 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _popNavigationItemWithTransitionAssistant:arg1];
}
- (void)_completePopOperationAnimated:(_Bool)arg1 transitionAssistant:(id)arg2 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _completePopOperationAnimated:arg1 transitionAssistant:arg2];
}
- (void)popNavigationItem{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super popNavigationItem];
}
- (id)_popNavigationItemWithTransition:(int)arg1{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    return [super _popNavigationItemWithTransition:arg1];
}
- (void)_pushNestedNavigationItem:(id)arg1{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _pushNestedNavigationItem:arg1];
}
- (void)_popNestedNavigationItem{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _popNestedNavigationItem];
}
- (id)popNavigationItemAnimated:(_Bool)arg1{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    return [super popNavigationItemAnimated:arg1];
}
- (void)_pushNavigationItem:(id)arg1 transitionAssistant:(id)arg2{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _pushNavigationItem:arg1 transitionAssistant:arg2];
}
- (void)_completePushOperationAnimated:(_Bool)arg1 transitionAssistant:(id)arg2{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _completePushOperationAnimated:arg1 transitionAssistant:arg2];
}
- (void)pushNavigationItem:(id)arg1{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super pushNavigationItem:arg1];
}
- (void)_cancelInteractiveTransition:(double)arg1 completionSpeed:(double)arg2 completionCurve:(long long)arg3{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _cancelInteractiveTransition:arg1 completionSpeed:arg2 completionCurve:arg3];
}
- (void)_finishInteractiveTransition:(double)arg1 completionSpeed:(double)arg2 completionCurve:(long long)arg3{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _finishInteractiveTransition:arg1 completionSpeed:arg2 completionCurve:arg3];
}
- (void)_updateInteractiveTransition:(double)arg1{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _updateInteractiveTransition:arg1];
}
- (void)_pushNavigationItem:(UINavigationItem *)navigationItem transition:(int)transition{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    //[super _pushNavigationItem:arg1 transition:arg2];
    _navbarFlags->crossfadeItems = NO;
    _navbarFlags->dynamicDuration = NO;
    if (transition != 0) {
        id effectiveDelegate = [self _effectiveDelegate];
        int R10 = transition;
        if([effectiveDelegate respondsToSelector:@selector(_willPerformCustomNavigationTransitionForPush)] &&
           [effectiveDelegate _willPerformCustomNavigationTransitionForPush]
           ) {
            _navbarFlags->dynamicDuration = YES;
            if ([effectiveDelegate _shouldCrossFadeNavigationBar]) {
                R10 = 6;
            }
            //loc_250517FC
        }
        else {
            //loc_250517FC
        }
        //loc_250517FC
        if([effectiveDelegate respondsToSelector:@selector(_isInteractiveCustomNavigationTransition)] &&
           [effectiveDelegate _isInteractiveCustomNavigationTransition]
           ) {
            _navbarFlags->animationCount = 0;
            _navbarFlags->isInteractive = YES;
            //loc_25051846
        }
        else {
            //loc_25051846
        }
        //loc_25051846
        _navbarFlags->crossfadeItems = R10 == 6;
        //loc_25051886
    }
    else {
        //loc_2505186C
        [self disableAnimation];
        //loc_25051886
    }
    //loc_25051886
    _navbarFlags->usingNewAPI = YES;
    if (_navbarFlags->isInteractive) {
        [self _startInteractiveNavigationBarTransition];
    }
    //loc_250518A8
    [self pushNavigationItem:navigationItem];
    [navigationItem _updateViewsForBarSizeChangeAndApply:NO];
    if(![self _isAlwaysHidden]) {
        NSArray *customLeftViews = [navigationItem _customLeftViews];
        NSArray *customRightViews = [navigationItem _customRightViews];
        [self _setLeftViews:customLeftViews rightViews:customRightViews];
        if([self _wantsLetterpressContent]) {
            [self _updateItemsForLetterpressImagesVisualStateIfNecessary];
        }
        //loc_2505194E
        [self updatePrompt];
        //loc_25051960
    }
    //loc_25051960
    if(transition == 0) {
        [self enableAnimation];
    }
    NSLog(@"");
}
- (void)pushNavigationItem:(id)arg1 animated:(_Bool)arg2{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super pushNavigationItem:arg1 animated:arg2];
    //id _effectiveDelegate = [self _effectiveDelegate];
}
- (void)_pushNavigationItemUsingCurrentTransition:(id)arg1 {
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    [super _pushNavigationItemUsingCurrentTransition:arg1];
}
@end
