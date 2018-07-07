//
//  VINavigationItem.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/7.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VINavigationBar;

@interface VINavigationItem : NSObject<NSCoding>
{
    NSString *_title;
    NSString *_backButtonTitle;
    UIBarButtonItem *_backBarButtonItem;
    NSString *_prompt;
    int _tag;
    id _context;
    VINavigationBar *_navigationBar;
    UIView *_defaultTitleView;
    UIView *_titleView;
    UIView *_backButtonView;
    NSArray *_leftBarButtonItems;
    NSArray *_rightBarButtonItems;
    NSArray *_customLeftViews;
    NSArray *_customRightViews;
    char _hidesBackButton;
    char _leftItemsSupplementBackButton;
    UIImageView *_frozenTitleView;
    char _barStyleIndependent;
    float _fontScaleAdjustment;
    NSString *_pendingTitle;
    NSArray *_abbreviatedBackButtonTitles;
    int _independentBarStyle;
    NSArray *_leftItemSpaceList;
    NSArray *_rightItemSpaceList;
    unsigned int _leftFlexibleSpaceCount;
    unsigned int _rightFlexibleSpaceCount;
    NSMutableDictionary *_backgroundImages;
    float __titleViewWidthForAnimations;
    float __idealCustomTitleWidth;
    VINavigationBar *__owningNavigationBar;
}

@property (copy, nonatomic) NSString *title;
@property (retain, nonatomic) UIBarButtonItem *backBarButtonItem;
@property (retain, nonatomic) UIView *titleView;
@property (copy, nonatomic) NSString *prompt;
@property (nonatomic) char hidesBackButton;
@property (copy, nonatomic) NSArray *leftBarButtonItems;
@property (copy, nonatomic) NSArray *rightBarButtonItems;
@property (nonatomic) char leftItemsSupplementBackButton;
@property (retain, nonatomic) UIBarButtonItem *leftBarButtonItem;
@property (retain, nonatomic) UIBarButtonItem *rightBarButtonItem;
@property (getter=_isBarStyleIndependent, setter=_setBarStyleIndependent:, nonatomic) char _barStyleIndependent;
@property (setter=_setIndependentBarStyle:, nonatomic) int _independentBarStyle;
@property (setter=_setLeftFlexibleSpaceCount:, nonatomic) unsigned int _leftFlexibleSpaceCount;
@property (setter=_setRightFlexibleSpaceCount:, nonatomic) unsigned int _rightFlexibleSpaceCount;
@property (setter=_setLeftItemSpaceList:, copy, nonatomic) NSArray *_leftItemSpaceList;
@property (setter=_setRightItemSpaceList:, copy, nonatomic) NSArray *_rightItemSpaceList;
@property (nonatomic) float _titleViewWidthForAnimations;
@property (setter=_setIdealCustomTitleWidth:, nonatomic) float _idealCustomTitleWidth;
@property (setter=_setPendingTitle:, copy, nonatomic) NSString *_pendingTitle;
@property (setter=_setFontScaleAdjustment:, nonatomic) float _fontScaleAdjustment;
@property (setter=_setAbbreviatedBackButtonTitles:, copy, nonatomic) NSArray *_abbreviatedBackButtonTitles;
@property (readonly, nonatomic) NSMutableDictionary *_backgroundImages;
@property (getter=_owningNavigationBar, setter=_setOwningNavigationBar:, nonatomic) VINavigationBar *_owningNavigationBar;

@end
