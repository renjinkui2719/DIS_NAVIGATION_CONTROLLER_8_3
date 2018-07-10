//
//  VINavigationItem.m
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/7.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import "VINavigationItem.h"
#import "DISNavigationControllerCommons.h"
#import "UIBarButtonItem+Private.h"

@implementation VINavigationItem

#pragma mark - A
- (id)_abbreviatedBackButtonTitles {
    
}
#pragma mark - B
#pragma mark - C

#pragma mark - D

+ (UIFont *)defaultFont {
    CGFloat fontSize = float(0x41A00000);
    if (!_UIApplicationUsesLegacyUI()) {
        fontSize = float(0x41880000);
    }
    return [UIFont boldSystemFontOfSize:fontSize];
}

#pragma mark - E
#pragma mark - F
#pragma mark - G
#pragma mark - H

#pragma mark - I

- (id)init {
    if (self = [super init]) {
        NSBundle *bundle = [NSBundle bundleForClass:UIApplication.class].retain;
        NSString *backString = [bundle localizedStringForKey:@"Back" value:@"Back" table:@"Localizable"];
        id strings[] = {backString, @""};
        _abbreviatedBackButtonTitles = [NSArray arrayWithObjects:strings count:2].retain;
    }
    return self;
}

- (id)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        if (title && !_UIApplicationUsesLegacyUI()) {
            title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        //loc_250515B8
        _title = title.retain;
        
        NSBundle *bundle = [NSBundle bundleForClass:UIApplication.class].retain;
        NSString *backString = [bundle localizedStringForKey:@"Back" value:@"Back" table:@"Localizable"];
        id strings[] = {backString, nil};
        _abbreviatedBackButtonTitles = [NSArray arrayWithObjects:strings count:2].retain;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [self initWithTitle:nil]) {
        NSString *title = [aDecoder decodeObjectForKey:@"UITitle"];
        if (_UIApplicationLinkedOnVersionCheck(0x50000)) {
            _title = title.copy;
        }
        else {
            _title = (title ?: @"").copy;
        }
        //loc_25273448
        _prompt = [[aDecoder decodeObjectForKey:@"UIPrompt"] copy];
        _backButtonTitle = [[aDecoder decodeObjectForKey:@"UIBackButtonTitle"] copy];
        _backBarButtonItem = [[aDecoder decodeObjectForKey:@"UIBackBarButtonItem"] retain];
        
        UIBarButtonItem *leftBarButtonItem = [aDecoder decodeObjectForKey:@"UILeftBarButtonItem"];
        _leftBarButtonItems = [[aDecoder decodeObjectForKey:@"UILeftBarButtonItems"] retain];
        if(leftBarButtonItem && !_leftBarButtonItems) {
            _leftBarButtonItems = [[NSArray alloc] initWithObjects:leftBarButtonItem,nil];
        }
        //loc_2527355C
        _titleView = [[aDecoder decodeObjectForKey:@"UITitleView"] retain];
        
        UIBarButtonItem *rightBarButtonItem = [aDecoder decodeObjectForKey:@"UIRightBarButtonItem"];
        _rightBarButtonItems = [[aDecoder decodeObjectForKey:@"UIRightBarButtonItems"] retain];
        if(leftBarButtonItem && !_rightBarButtonItems) {
            _rightBarButtonItems = [[NSArray alloc] initWithObjects:rightBarButtonItem,nil];
        }
        //loc_252735F8
        _navigationBar = [aDecoder decodeObjectForKey:@"UINavigationBar"];
    }
    return self;
}

#pragma mark - J
#pragma mark - K
#pragma mark - L
#pragma mark - M
#pragma mark - N
- (VINavigationBar *)navigationBar {
    return _navigationBar;
}
#pragma mark - O
#pragma mark - P
#pragma mark - Q
#pragma mark - R

#pragma mark - S

- (void)setBackBarButtonItem:(UIBarButtonItem *)item {
    if (_backBarButtonItem != item) {
        id backButtonViewAppearanceStorage = nil;
        if ([_backButtonView respondsToSelector:@selector(_appearanceStorage)]) {
            backButtonViewAppearanceStorage = [_backButtonView _appearanceStorage];
        }
        //loc_252739EE
        [_backBarButtonItem release];
        _backBarButtonItem = [item retain];
        if (_navigationBar) {
            if (_backBarButtonItem) {
                if (!_backButtonView || backButtonViewAppearanceStorage) {
                    //loc_25273AAC
                    if (backButtonViewAppearanceStorage) {
                        [self _removeBackButtonView];
                    }
                    _backButtonView = [self backButtonView];
                    //loc_25273AD6
                }
                else {
                    id barButtonAppearanceStorage = [[_navigationBar _appearanceStorage] _barButtonAppearanceStorage];
                    [_backButtonView _applyBarButtonAppearanceStorage:barButtonAppearanceStorage withTaggedSelectors:nil];
                    id itemAppearanceStorage = [item _appearanceStorage];
                    id taggedSelectors = objc_getAssociatedObject(appearanceStorage, _UIAppearanceAssociatedObjectTaggingKey);
                    [_backButtonView _applyBarButtonAppearanceStorage:itemAppearanceStorage withTaggedSelectors:taggedSelectors];
                    //loc_25273AD6
                }
            }
            else {
                //loc_25273A98
                [self _removeBackButtonView];
                //loc_25273AD6
            }
            //loc_25273AD6
            [_backButtonView setNeedsDisplay];
            UIView *defaultTitleView = [self _defaultTitleView];
            [defaultTitleView setNeedsDisplay];
            [defaultTitleView.superview setNeedsLayout];
            [_backButtonView.superview setNeedsLayout];
        }
    }
}

- (void)setBackButtonTitle:(NSString *)title {
    [self _setBackButtonTitle:title lineBreakMode:NSLineBreakByTruncatingTail];
}

- (void)setContext:(id)context {
    if(_context != context) {
        [_context release];
        _context = [context retain];
    }
}

- (void)setCustomLeftItem:(UIBarButtonItem *)item {
    [self setLeftBarButtonItem:item];
}

- (void)setCustomLeftItem:(UIBarButtonItem *)item animated:(BOOL)animated {
    [self setLeftBarButtonItem:item animated:animated];
}

- (void)setCustomLeftView:(UIView *)view {
    [self setCustomLeftView:view animated:NO];
}

- (void)setCustomLeftView:(UIView *)view animated:(BOOL)animated {
    [self setObject:view forLeftRightKeyPath:@"_customLeftView" animated:animated];
}

- (void)setCustomRightItem:(UIBarButtonItem *)item {
    [self setRightBarButtonItem:item];
}

- (void)setCustomRightItem:(UIBarButtonItem *)item animated:(BOOL)animated {
    [self setRightBarButtonItem:item animated:animated];
}

- (void)setCustomRightView:(UIView *)view {
    [self setCustomRightView:view animated:NO];
}

- (void)setCustomRightView:(UIView *)view animated:(BOOL)animated {
    [self setObject:view forLeftRightKeyPath:@"_customRightView" animated:animated];
}

- (void)setCustomTitleView:(UIView *)view {
    [self setTitleView:view];
}

- (void)setHidesBackButton:(BOOL)hidesBackButton {
    [self setHidesBackButton:hidesBackButton animated:NO];
}

- (void)setHidesBackButton:(BOOL)hidesBackButton animated:(BOOL)animated {
    if (self.hidesBackButton != hidesBackButton) {
        _hidesBackButton = hidesBackButton;
        if (self.navigationBar.topItem == self) {
            //loc_251150E8
            [self.navigationBar showBackButton:!hidesBackButton animated:animated];
        }
    }
}

- (void)setLeftItemsSupplementBackButton:(BOOL)leftItemsSupplementBackButton {
    if (_leftItemsSupplementBackButton != leftItemsSupplementBackButton) {
        _leftItemsSupplementBackButton = leftItemsSupplementBackButton;
        [self updateNavigationBarButtonsAnimated:NO];
    }
}

- (void)setNavigationBar:(VINavigationBar *)navigationBar {
    _navigationBar = navigationBar;
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)item {
    [self setLeftBarButtonItem:item animated:NO];
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated {
    if ([item isSystemItem] &&
        ([item systemItem] == UIBarButtonSystemItemFlexibleSpace || [item systemItem] == UIBarButtonSystemItemFixedSpace)
        ) {
        [NSException raise:NSInvalidArgumentException format:@"Fixed and flexible space items not allowed as individual navigation bar button item. Please use the leftBarButtonItems (that's plural) property."];
    }
    //loc_2506D108
    [self setObject:item forLeftRightKeyPath:@"_leftBarButtonItem" animated:animated];
}

- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items {
    [self setLeftBarButtonItems:items animated:NO];
}

- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items animated:(BOOL)animated {
    if (!_leftBarButtonItems || !items || ![_leftBarButtonItems isEqualToArray:items]) {
        //loc_2512B0A6
        [self setObject:items forLeftRightKeyPath:@"_leftBarButtonItems" animated:animated];
    }
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)item {
    [self setRightBarButtonItem:item animated:NO];
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated {
    if ([item isSystemItem] &&
        ([item systemItem] == UIBarButtonSystemItemFlexibleSpace || [item systemItem] == UIBarButtonSystemItemFixedSpace)
        ) {
        [NSException raise:NSInvalidArgumentException format:@"Fixed and flexible space items not allowed as individual navigation bar button item. Please use the rightBarButtonItems (that's plural) property."];
    }
    //loc_2506D108
    [self setObject:item forLeftRightKeyPath:@"_rightBarButtonItem" animated:animated];
}

- (void)setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items {
    [self setRightBarButtonItems:items animated:NO];
}

- (void)setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items animated:(BOOL)animated {
    if (!_rightBarButtonItems || !items || ![_rightBarButtonItems isEqualToArray:items]) {
        //loc_2512B0A6
        [self setObject:items forLeftRightKeyPath:@"_rightBarButtonItems" animated:animated];
    }
}

- (void)setObject:(id)object forLeftRightKeyPath:(NSString *)keyPath animated:(BOOL)animated {
    if ([self valueForKey:@""] != object) {
        [self _updateBarItemOwnersTo:nil];
        [self setValue:object forKey:keyPath];
        static NSDictionary *viewNamesMap = nil;
        if (!viewNamesMap) {
            NSArray *names = [NSArray arrayWithObjects:@"_leftBarButtonItem",@"_rightBarButtonItem",@"_customLeftView",@"_customRightView",@"_customLeftViews",@"_customRightViews", nil];
            NSArray *keys = [NSArray arrayWithObjects:@"_customLeftView", @"_customRightView", @"_leftBarButtonItem",@"_rightBarButtonItem",@"_leftBarButtonItems",@"_rightBarButtonItems", nil];
            viewNamesMap = [NSDictionary dictionaryWithObjects:names forKeys:keys];
        }
        //loc_2506CF58
        NSString *viewName = viewNamesMap[keyPath];
        NSAssert(viewName, @"No alternate key path found for key path \"%@\"",keyPath);
        //loc_2506CFE8
        [self setValue:nil forKey:viewName];
        [self _updateBarItemOwnersTo:self];
        [self updateNavigationBarButtonsAnimated:animated];
    }
}

- (void)setPrompt:(NSString *)prompt {
    if (_prompt != prompt) {
        _prompt = [prompt retain];
        [_navigationBar updatePrompt];
    }
}

- (void)setTag:(int)tag {
    _tag = tag;
}

- (void)setTitle:(NSString *)title {
    if (title && !_UIApplicationUsesLegacyUI()) {
        title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    //loc_2505A578
    if (_title != title && ![_title isEqualToString:title]) {
        [_title release];
        _title = [title copy];
        //loc_2505A5D2
        [self _addDefaultTitleViewToNavigationBarIfNecessary];
        UIView *defaultTitleView = [self _defaultTitleView];
        [defaultTitleView _resetTitleSize];
        [self _setPendingTitle:nil];
        [_backButtonView setNeedsDisplay];
        [defaultTitleView setNeedsDisplay];
        [defaultTitleView.superview setNeedsLayout];
        [_backButtonView.superview setNeedsLayout];
        if (_navigationBar.state != 0 && _navigationBar.topItem == self) {
            //loc_2505A6BE
            [_navigationBar.backItem.backButtonView _setAbbreviatedTitleIndex:NSIntegerMax];
        }
    }
}

- (void)setTitleView:(UIView *)titleView {
    if (_titleView != titleView) {
        //loc_250F7D68
        [self _setIdealCustomTitleWidth:titleView.frame.size.width];
        if (!_titleView) {
            [_defaultTitleView removeFromSuperview];
            //loc_250F7DA6
        }
        //loc_250F7DA6
        [_titleView release];
        _titleView = titleView.retain;
        if (self.navigationBar.topItem == self) {
            [_navigationBar _updateTitleView];
        }
    }
}

- (void)set_customLeftView:(UIView *)customLeftView {
    [self _setCustomLeftView:customLeftView];
}

- (void)set_customLeftViews:(NSArray *)customLeftViews {
    [self _setCustomLeftViews:customLeftViews];
}

- (void)set_customRightView:(UIView *)customLeftView {
    [self _setCustomRightView:customLeftView];
}

- (void)set_customRightViews:(NSArray *)customLeftViews {
    [self _setCustomRightViews:customLeftViews];
}

- (void)set_leftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    [self _setLeftBarButtonItem:leftBarButtonItem];
}

- (void)set_leftBarButtonItems:(NSArray *)leftBarButtonItems {
    [self _setLeftBarButtonItems:leftBarButtonItems];
}

- (void)set_rightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem {
    [self _setRightBarButtonItem:rightBarButtonItem];
}

- (void)set_rightBarButtonItems:(NSArray *)rightBarButtonItems {
    [self _setRightBarButtonItems:rightBarButtonItems];
}

- (void)set_titleViewWidthForAnimations:(CGFloat)width {
    __titleViewWidthForAnimations = width;
}

- (void)_setAbbreviatedBackButtonTitles:(NSArray *)abbreviatedBackButtonTitles {
    if (!abbreviatedBackButtonTitles & !_abbreviatedBackButtonTitles) {
        return;
    }
    if ([_abbreviatedBackButtonTitles isEqualToArray:abbreviatedBackButtonTitles]) {
        return;
    }
    //loc_2505B6AE
    [_abbreviatedBackButtonTitles release];
    _abbreviatedBackButtonTitles = _abbreviatedBackButtonTitles.copy;
    if (_backButtonView && [_backButtonView _abbreviatedTitleIndex] != NSIntegerMax) {
        if (_navigationBar.state == 0) {
            [_backButtonView _setAbbreviatedTitleIndex:NSIntegerMax];
            if (_navigationBar &&
                _navigationBar == _backButtonView.superview &&
                !_backButtonView.isHidden &&
                _backButtonView.alpha != 0.0
                ) {
                [_navigationBar setNeedsLayout];
            }
        }
    }
}

- (void)_setBackButtonPressed:(BOOL)backButtonPressed {
    [[self existingBackButtonView] setPressed:backButtonPressed];
}

- (void)_setBackButtonTitle:(NSString *)backButtonTitle lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if (_backButtonTitle != backButtonTitle && ![_backButtonTitle isEqualToString:backButtonTitle]) {
        [_backButtonTitle release];
        _backButtonTitle = backButtonTitle.copy;
        //loc_2505A864
        if (_navigationBar) {
            if (_backButtonTitle && _backButtonTitle.length != 0) {
                _backButtonView = [self backButtonView];
                //loc_2505A8C8
            }
            else {
                //loc_2505A8B6
                [self _removeBackButtonView];
                //loc_2505A8C8
            }
            //loc_2505A8C8
            [_backButtonView _setLineBreakMode:lineBreakMode];
            [_backButtonView _resetTitleSize];
            [_backButtonView setNeedsDisplay];
            UIView *defaultTitleView = [self _defaultTitleView];
            [defaultTitleView setNeedsDisplay];
            [defaultTitleView.superview setNeedsLayout];
            [_backButtonView.superview setNeedsLayout];
        }
    }
}

- (void)_setBarStyleIndependent:(BOOL)barStyleIndependent {
    _barStyleIndependent = barStyleIndependent;
}

- (void)_setCustomLeftRightView:(UIView *)leftRightView left:(BOOL)left {
    UIView *existView = (left ? [self _customLeftViewCreating:NO] : [self _customRightViewCreating:NO]);
    if (!leftRightView || existView != leftRightView) {
        //loc_2506D3C0
        UIView *createdView = nil;
        if (leftRightView) {
            createdView = (left ? [self _customLeftViewCreating:YES] : [self _customRightViewCreating:YES]);
            if (createdView) {
                createdView = [createdView mutableCopy];
            }
            else {
                createdView = [[NSMutableArray alloc] init];
            }
            //loc_2506D422
            _updateLeftOrRightItemOrViewList(createdView, leftRightView);
            //loc_2506D430
        }
        //loc_2506D430
        if (left) {
            [self _setCustomLeftViews:createdView];
        }
        else {
            [self _setCustomRightViews:createdView];
        }
        [createdView release];
    }
}

- (void)_setCustomLeftView:(UIView *)leftView {
    [self _setCustomLeftRightView:leftView left:YES];
}

- (void)_setCustomLeftViews:(NSArray *)leftViews {
    if (leftViews) {
        if (_customLeftViews) {
            if ([_customLeftViews isEqualToArray:leftViews]) {
                if (_customLeftViews) {
                    return;
                }
                //loc_250D6008
            }
            //loc_250D6008
        }
        //loc_250D6008
        [_customLeftViews release];
        _customLeftViews = leftViews.copy;
    }
    else {
        //loc_250D5FF8
        if (_customLeftViews) {
            //loc_250D6008
            [_customLeftViews release];
            _customLeftViews = leftViews.copy;
        }
    }
}

- (void)_setCustomRightView:(UIView *)rightView {
    [self _setCustomLeftRightView:rightView left:NO];
}

- (void)_setCustomRightViews:(NSArray *)rightViews {
    if (rightViews) {
        if (_customRightViews) {
            if ([_customRightViews isEqualToArray:rightViews]) {
                if (_customRightViews) {
                    return;
                }
                //loc_2506D518
            }
            //loc_2506D518
        }
        //loc_2506D518
        [_customRightViews release];
        _customRightViews = rightViews.copy;
    }
    else {
        //loc_2506D508
        if (_customRightViews) {
            //loc_2506D518
            [_customRightViews release];
            _customRightViews = rightViews.copy;
        }
    }
}

- (void)_setFontScaleAdjustment:(CGFloat)fontScaleAdjustment {
    if (_fontScaleAdjustment != fontScaleAdjustment) {
        _fontScaleAdjustment = fontScaleAdjustment;
        
        void (^block)(NSArray *barButtonItems) = ^{
            //___44__UINavigationItem__setFontScaleAdjustment___block_invoke
            for (UIBarButtonItem *item in barButtonItems) {
                if (!item.isCustomViewItem) {
                    UIView *itemView = item.view;
                    if([itemView titleForState:0].length) {
                        [itemView _setFontScaleAdjustment:fontScaleAdjustment];
                        [itemView _updateStyle];
                        [itemView sizeToFit];
                    }
                }
            }
        };
        block(_leftBarButtonItems);
        block(_rightBarButtonItems);
    }
}

- (void)_setIdealCustomTitleWidth:(CGFloat)idealCustomTitleWidth {
    __idealCustomTitleWidth = idealCustomTitleWidth;
}

- (void)_setIndependentBackgroundImage:(UIImage *)backgroundImage shadowImage:(UIImage *)shadowImage forBarMetrics:(int)barMetrics {
    NSAssert(!shadowImage || backgroundImage, @"No custom shadow for the navigation item without a custom background");
    //loc_252744E0
    NSAssert(_navigationBar.topItem != self, @"Don't set the independent background image of a navigation item while it's visible");
    //loc_25274570
    NSAssert(barMetrics == 0 || !shadowImage, @"We use the same shadow for all bar metrics, so use nil for the shadow when not specifying UIBarMetricsDefault");
    //loc_252745EA
    NSArray *backgroundImages = [self _backgroundImages];
    if (backgroundImage) {
        NSArray *arr1 = [NSArray arrayWithObjects:backgroundImage, shadowImage, nil];
        [backgroundImages _setObject:arr1 forKey:@(barMetrics)]
    }
    else {
        //loc_25274664
        [self removeObjectForKey:@(barMetrics)];
    }
}

- (void)_setIndependentBarStyle:(int)independentBarStyle {
    [self _setBarStyleIndependent:YES];
    _independentBarStyle = independentBarStyle;
}

- (void)_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    if (leftBarButtonItem != [self _leftBarButtonItem]) {
        if (leftBarButtonItem || _leftBarButtonItems.count > 1) {
            //loc_250D5EAE
            NSMutableArray *leftBarButtonItems = (_leftBarButtonItems ? _leftBarButtonItems.mutableCopy : [[NSMutableArray alloc] init]);
            [_leftBarButtonItems release];
            _updateLeftOrRightItemOrViewList(leftBarButtonItems, leftBarButtonItem);
            _leftBarButtonItems = leftBarButtonItems.copy;
            [leftBarButtonItems release];
        }
        else {
            [_leftBarButtonItems release];
            _leftBarButtonItems = nil;
        }
    }
}

- (void)_setLeftBarButtonItems:(NSArray *)leftBarButtonItems {
    if (!_leftBarButtonItems || !leftBarButtonItems ||
        [_leftBarButtonItems isEqualToArray:leftBarButtonItems]
        ) {
        //loc_2512CD8C
        BOOL R1 = _leftBarButtonItems == nil;
        BOOL R2 = leftBarButtonItems != nil;
        //TEQ.W           R1, R2
        if (R1 !=  R2) {
            return;
        }
        //loc_2512CDA2
    }
    //loc_2512CDA2
    [_leftBarButtonItems release];
    _leftBarButtonItems = leftBarButtonItems.copy;
}

- (void)_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem {
    if (rightBarButtonItem != [self _rightBarButtonItem]) {
        if (rightBarButtonItem || _rightBarButtonItems.count > 1) {
            //loc_250D5EAE
            NSMutableArray *rightBarButtonItems = (_rightBarButtonItems ? _rightBarButtonItems.mutableCopy : [[NSMutableArray alloc] init]);
            [_rightBarButtonItem release];
            _updateLeftOrRightItemOrViewList(rightBarButtonItems, rightBarButtonItem);
            _rightBarButtonItem = rightBarButtonItem.copy;
            [rightBarButtonItem release];
        }
        else {
            [_rightBarButtonItem release];
            _rightBarButtonItem = nil;
        }
    }
}

- (void)_setRightBarButtonItems:(NSArray *)rightBarButtonItems {
    if (!_rightBarButtonItems || !rightBarButtonItems ||
        [_rightBarButtonItems isEqualToArray:rightBarButtonItems]
        ) {
        //loc_2512CD8C
        BOOL R1 = _rightBarButtonItems == nil;
        BOOL R2 = rightBarButtonItems != nil;
        //TEQ.W           R1, R2
        if (R1 !=  R2) {
            return;
        }
        //loc_2512CDA2
    }
    //loc_2512CDA2
    [_rightBarButtonItems release];
    _rightBarButtonItems = rightBarButtonItems.copy;
}

- (void)_setLeftFlexibleSpaceCount:(NSUInteger)leftFlexibleSpaceCount {
    _leftFlexibleSpaceCount = leftFlexibleSpaceCount;
}

- (void)_setRightFlexibleSpaceCount:(NSUInteger)rightFlexibleSpaceCount {
    _rightFlexibleSpaceCount = rightFlexibleSpaceCount;
}

- (void)_setOwningNavigationBar:(VINavigationBar *)owningNavigationBar {
    __owningNavigationBar = owningNavigationBar;
}

- (void)_setTitle:(NSString *)title animated:(BOOL)animated {
    [self _setTitle:title animated:animated matchBarButtonItemAnimationDuration:NO];
}

- (void)_setTitle:(NSString *)title animated:(BOOL)animated matchBarButtonItemAnimationDuration:(BOOL)matchBarButtonItemAnimationDuration {
    if (animated) {
        if (title == title || [title isEqualToString:_title]) {
            return;
        }
        if (_navigationBar.state == 0) {
            //loc_250639DA
            [self _freezeCurrentTitleView];
            [_title release];
            _title = title.copy;
            //loc_25063A18
            [self _setPendingTitle:nil];
            [self _addDefaultTitleViewToNavigationBarIfNecessary];
            UIView * defaultTitleView = [self _defaultTitleView];
            [defaultTitleView _resetTitleSize];
            [_backButtonView setNeedsDisplay];
            [defaultTitleView setNeedsDisplay];
            [defaultTitleView.superview setNeedsLayout];
            [_backButtonView.superview setNeedsLayout];
            if (_UIApplicationUsesLegacyUI()) {
                [UIView beginAnimations:nil context:nil];
                NSTimeInterval duration = double(0X3FC6666666666666);
                if (matchBarButtonItemAnimationDuration) {
                    duration = double(0X3FD6666666666666);
                }
                [UIView setAnimationDuration:duration];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDidStopSelector:@selector(_setTitleAnimationDidStop:finished:context:)];
                [_frozenTitleView setAlpha:0];
                [defaultTitleView setAlpha:float(0x3F800000)];
                [UIView commitAnimations];
            }
            else {
                //loc_25063BA2
                NSTimeInterval duration = double(0X3FC6666666666666);
                if (matchBarButtonItemAnimationDuration) {
                    duration = double(0X3FD6666666666666);
                }
                [UIView _animateWithDuration:duration delay:0 options:0x60000 factory:_navigationBar animations:^{
                    //___75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke
                    [_frozenTitleView setAlpha:0];
                    [defaultTitleView setAlpha:float(0x3F800000)];
                } completion:^(BOOL finished){
                    //___75__UINavigationItem__setTitle_animated_matchBarButtonItemAnimationDuration___block_invoke282
                    [self _setTitleAnimationDidStop:nil finished:@(finished) context:@(animated)];
                }];
            }
        }
        else {
            [self _setPendingTitle:title];
        }
    }
    else {
        //loc_250639BE
        [self setTitle:title];
    }
}

- (void)_setTitleAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(id)context {
    [self _cleanupFrozenTitleView];
}

#pragma mark - T
#pragma mark - U
- (void)_updateBarItemOwnersTo:(VINavigationItem *)owner {
    for (UIBarButtonItem *item in _leftBarButtonItems) {
        [item _setOwningNavigationItem:owner];
    }
    for (UIBarButtonItem *item in _rightBarButtonItems) {
        [item _setOwningNavigationItem:owner];
    }
}

- (void)updateNavigationBarButtonsAnimated:(BOOL)animated {
    if (!animated) {
        [self.navigationBar disableAnimation];
    }
    //loc_2506D584
    if (self.navigationBar.topItem == self) {
        NSArray *customLeftViews = [self _customLeftViews];
        NSArray *customRightViews = [self _customRightViews];
        [self.navigationBar _setLeftViews:customLeftViews rightViews:customRightViews];
    }
    //loc_2506D5F2
    if (!animated) {
        [self.navigationBar enableAnimation];
    }
}
#pragma mark - V

@end
