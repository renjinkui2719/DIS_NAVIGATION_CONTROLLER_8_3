//
//  VINavigationItem.m
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/7.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import "VINavigationItem.h"
#import "DISNavigationControllerCommons.h"

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
#pragma mark - O
#pragma mark - P
#pragma mark - Q
#pragma mark - R
#pragma mark - S
#pragma mark - T
#pragma mark - U
#pragma mark - V

@end
