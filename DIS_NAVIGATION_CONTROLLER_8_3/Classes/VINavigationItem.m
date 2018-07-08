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
    [self setObject:item forLeftRightKeyPath:@"rightBarButtonItem" animated:animated];
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
        if (!viewNamesMap){
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
