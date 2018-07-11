//
//  VINavigationBar.m
//  Yeecall
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 YeeCall. All rights reserved.
//

#import "VINavigationBar.h"

@implementation VINavigationBar

#pragma mark - A
#pragma mark - B
#pragma mark - C
#pragma mark - D
#pragma mark - E
#pragma mark - F
#pragma mark - G
#pragma mark - H
#pragma mark - I
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _navbarFlags.barStyle = 0;
        if ([aDecoder containsValueForKey:@"UIBarStyle"]) {
           _navbarFlags.barStyle = [aDecoder decodeIntegerForKey:@"UIBarStyle"];
        }
        //loc_252763E2
        _navbarFlags.usingNewAPI = YES;
        _navbarFlags.isLocked = [aDecoder decodeBoolForKey:@"UIIsLocked"];
        _barTintColor = [[aDecoder decodeObjectForKey:@"UIBarTintColor"] retain];
        if (!_barTintColor) {
            if (_UIApplicationUsesLegacyUI()) {
                _barTintColor = [[self _interactionTintColor] retain];
            }
        }
        //loc_25276490
        NSMutableArray *items = [[aDecoder decodeObjectForKey:@"UIItems"] mutableCopy];
        if (!items) {
           items = [[NSMutableArray alloc] init];
        }
        //loc_252764E0
        _itemStack = items;
        if (!_UIApplicationUsesLegacyUI()) {
            self.clipsToBounds = NO;
        }
        //loc_25276516
        for (VINavigationItem *item in _itemStack) {
            [item setNavigationBar:self];
        }
        //loc_2527659E
        _delegate = [aDecoder decodeObjectForKey:@"UIDelegate"];
        if (_itemStack.count) {
            [self _setupTopNavItem:_itemStack.lastObject oldTopNavItem:nil];
        }
        //loc_25276602
        if ([aDecoder containsValueForKey:@"UIShadowImage"]) {
            [self setShadowImage:[aDecoder decodeObjectForKey:@"UIShadowImage"]];
        }
        //loc_2527664A
        if ([aDecoder containsValueForKey:@"UITitleTextAttributes"]) {
            [self setTitleTextAttributes:[aDecoder decodeObjectForKey:@"UITitleTextAttributes"]];
        }
        //loc_25276688
        if ([aDecoder containsValueForKey:@"UIBarPosition"]) {
            _barPosition = [aDecoder decodeIntegerForKey:@"UIBarPosition"];
        }
        //loc_252766CA
        if ([aDecoder containsValueForKey:@"UIBarTranslucence"]) {
            _navbarFlags.barTranslucence = [aDecoder decodeIntegerForKey:@"UIBarTranslucence"];
        }
        //loc_25276710
        if ([aDecoder containsValueForKey:@"UIBackIndicatorImage"]) {
            [self setBackIndicatorImage:[aDecoder decodeObjectForKey:@"UIBackIndicatorImage"]];
        }
        //loc_2527674E
        if ([aDecoder containsValueForKey:@"UIBackIndicatorTransitionMask"]) {
            [self setBackIndicatorTransitionMaskImage:[aDecoder decodeObjectForKey:@"UIBackIndicatorTransitionMask"]];
        }
        //loc_2527678C
        [self _commonNavBarInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _itemStack = [[NSMutableArray alloc] init];
        [self _updateOpacity];
        [self _commonNavBarInit];
    }
    return self;
}

- (CGSize)intrinsicContentSize {
    CGSize size = [self defaultSizeForOrientation:[self effectiveInterfaceOrientation]];
    //loc_251CEC20
    size.width = UIViewNoIntrinsicMetric;
    return size;
}

- (void)invalidateIntrinsicContentSize {
    [super invalidateIntrinsicContentSize];
    for (UIView *subview in self.subviews) {
        [subview invalidateIntrinsicContentSize];
    }
}

- (BOOL)isAnimationEnabled {
    if (_navbarFlags.animationDisabledCount) {
        return NO;
    }
    if (!self.superview) {
        return NO;
    }
    return (_viewFlags[+0][13:13]);
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder {
    return NO;
}

- (BOOL)isLocked {
    return _navbarFlags.isLocked;
}

- (char)isMinibar {
    int activeBarMetrics = [self _activeBarMetrics];
    if (activeBarMetrics - 1 < 2) {
        return YES;
    }
    if (_UIApplicationUsesLegacyUI()) {
        return NO;
    }
    return activeBarMetrics = 0x66;
}

- (BOOL)isTranslucent {
    if (_UIApplicationUsesLegacyUI()) {
        return [self _legacyIsTranslucent];
    }
    else {
        return [self _modernIsTranslucent];
    }
}

- (NSArray *)items {
    _navbarFlags.usingNewAPI = YES;
    return [self navigationItems];
}

+ (void)_initializeForIdiom:(int)idiom {
    if (idiom == 3 && VINavigationBar.class == self) {
        id appearanceContainer = _UIAppearanceContainerForUserInterfaceIdiom(3);
        id appearance = [VINavigationBar appearanceWhenContainedIn:appearanceContainer];
        [appearance _setDefaultBarMetrics:0xD2];
        [appearance _setActiveBarMetrics:0xD2];
        [appearance setBackgroundImage:[UIImage.alloc.init autorelease] forBarMetrics:0xD2];
        [appearance setBackgroundColor:[UIColor _externalBarBackgroundColor]];
        NSDictionary *titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:float(0x41880000)],
                                              NSForegroundColorAttributeName: [UIColor _externalSystemWhiteColor],
                                              };
        [appearance setTitleTextAttributes:titleTextAttributes];
        [appearance setTitleVerticalPositionAdjustment:0 forBarMetrics:0xD2];
        
        UIImage *image = [UIImage kitImageNamed:@"UINavigationBarBackIndicatorDefault.png"];
        [appearance setBackIndicatorImage:image];
        image = [UIImage kitImageNamed:@"UINavigationBarTitleTransitionBackIndicatorMask.png"];
        [appearance setBackIndicatorTransitionMaskImage:image];
        [appearance _setBackIndicatorLeftMargin:float(0x41400000)];
        
        appearanceContainer = _UIAppearanceContainerForUserInterfaceIdiom(3);
        appearance = [UIBarButtonItem appearanceWhenContainedIn:appearanceContainer];
        titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:float(0x41880000)]};
        [appearance setTitleTextAttributes:titleTextAttributes forState:0];
    }
}

- (void)_incrementAnimationCountIfNecessary {
    if (_navbarFlags.isInteractive) {
        _navbarFlags.animationCount += 1;
        id ID = [UIView _enableAnimationTracking];
        [[self _animationIds] addObject:ID];
    }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(UIView *)childView {
    if (_backIndicatorView == childView) {
        [_backIndicatorView sizeToFit];
        [self setNeedsLayout];
    }
}

- (BOOL)_isAlwaysHidden {
    return NO;
}

- (BOOL)_isCondensed {
    return __condensed;
}

- (BOOL)_isIncomingButtonSameAsOutgoingButtonOnLeft:(BOOL)onLeft {
    VINavigationItem *topItem = self.topItem;
    VINavigationItem *R11 = nil;
    if (_state == 2) {
        R11 = _itemStack.lastObject;
    }
    else {
        //loc_25055BFE
        R11 = [_itemStack _nextToLastObject];
    }
    //loc_25055C08
    NSInteger topBarButtonItemsCount = 0;
    NSInteger R11BarButtonItemsCount = 0;
    if (onLeft) {
        topBarButtonItemsCount = topItem.leftBarButtonItems.count;
        R11BarButtonItemsCount = R11.leftBarButtonItems.count;
    }
    else {
        //loc_25055C22
        topBarButtonItemsCount = topItem.rightBarButtonItems.count;
        R11BarButtonItemsCount = R11.rightBarButtonItems.count;
    }
    //loc_25055C2C
    if (topBarButtonItemsCount != 1 || R11BarButtonItemsCount != 1) {
        return NO;
    }
    UIBarButtonItem *topBarButtonItem = nil;
    UIBarButtonItem *R11BarButtonItem = nil;
    if (onLeft) {
        topBarButtonItem = topItem.leftBarButtonItem;
        R11BarButtonItem = R11.leftBarButtonItem;
    }
    else {
        topBarButtonItem = topItem.rightBarButtonItem;
        R11BarButtonItem = R11.rightBarButtonItem;
    }
    //loc_25055C80
    if (topBarButtonItem.isSystemItem != R11BarButtonItem.isSystemItem) {
        return NO;
    }
    if (topBarButtonItem.isSystemItem) {
        if (topBarButtonItem.systemItem == R11BarButtonItem.systemItem) {
            return YES;
        }
    }
    //loc_25055CF4
    if (topBarButtonItem.isSystemItem) {
        return NO;
    }
    if (topBarButtonItem.title.length == 0) {
        return NO;
    }
    if (![topBarButtonItem.title isEqualToString:R11BarButtonItem.title]) {
        return NO;
    }
    CGRect topBarButtonItemViewFrame = topBarButtonItem.view.frame;
    CGRect R11BarButtonItemViewFrame = R11BarButtonItem.view.frame;
    //loc_25055DD2
    if (topBarButtonItemViewFrame.size.width != R11BarButtonItemViewFrame.size.width) {
        return NO;
    }
    
    if (topBarButtonItemViewFrame.size.height == R11BarButtonItemViewFrame.size.height) {
        UIImage *image1 = [topBarButtonItem backgroundImageForState:0 style:topBarButtonItem.style barMetrics:0];
        if (image1) {
            return NO;
        }
        UIImage *image2 = [R11BarButtonItem backgroundImageForState:0 style:R11BarButtonItem.style barMetrics:0];
        if (image2) {
            return NO;
        }
        return YES;
    }
    //loc_25055E42
}

- (int)_itemStackCount {
    return _itemStack.count;
}

- (NSMutableArray *)_itemStack {
    return _itemStack;
}

#pragma mark - J
#pragma mark - K
#pragma mark - L
#pragma mark - M
#pragma mark - N
#pragma mark - O
#pragma mark - P
- (void)_pushNavigationItem:(UINavigationItem *)navigationItem transition:(int)transition{
    NSLog(@"VINavigationBar, line:%d",__LINE__);
    //[super _pushNavigationItem:arg1 transition:arg2];
    _navbarFlags.crossfadeItems = NO;
    _navbarFlags.dynamicDuration = NO;
    if (transition != 0) {
        id effectiveDelegate = [self _effectiveDelegate];
        int R10 = transition;
        if([effectiveDelegate respondsToSelector:@selector(_willPerformCustomNavigationTransitionForPush)] &&
           [effectiveDelegate _willPerformCustomNavigationTransitionForPush]
           ) {
            _navbarFlags.dynamicDuration = YES;
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
            _navbarFlags.animationCount = 0;
            _navbarFlags.isInteractive = YES;
            //loc_25051846
        }
        else {
            //loc_25051846
        }
        //loc_25051846
        _navbarFlags.crossfadeItems = R10 == 6;
        //loc_25051886
    }
    else {
        //loc_2505186C
        [self disableAnimation];
        //loc_25051886
    }
    //loc_25051886
    _navbarFlags.usingNewAPI = YES;
    if (_navbarFlags.isInteractive) {
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
}
#pragma mark - Q
#pragma mark - R
#pragma mark - S
#pragma mark - T
#pragma mark - U
#pragma mark - V
#pragma mark - W
#pragma mark - X
#pragma mark - Y
#pragma mark - Z


@end
