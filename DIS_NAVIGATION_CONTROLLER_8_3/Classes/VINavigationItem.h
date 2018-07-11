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
@property (nonatomic) BOOL hidesBackButton;
@property (copy, nonatomic) NSArray *leftBarButtonItems;
@property (copy, nonatomic) NSArray *rightBarButtonItems;
@property (nonatomic) BOOL leftItemsSupplementBackButton;
@property (retain, nonatomic) UIBarButtonItem *leftBarButtonItem;
@property (retain, nonatomic) UIBarButtonItem *rightBarButtonItem;
@property (getter=_isBarStyleIndependent, setter=_setBarStyleIndependent:, nonatomic) BOOL _barStyleIndependent;
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

#pragma mark - A
- (BOOL)_accumulateViewsFromItems:(NSArray *)items isLeft:(BOOL)isLeft refreshViews:(BOOL)refreshViews;
- (void)_addDefaultTitleViewToNavigationBarIfNecessary;
- (NSString *)_automationID;
#pragma mark - B
- (UIButton *)_buttonForBackButtonIndicator ;
- (UIView *)backButtonView;

#pragma mark - C
#pragma mark - D
+ (UIFont *)defaultFont;
#pragma mark - E
#pragma mark - F
#pragma mark - G
#pragma mark - H
#pragma mark - I
- (id)initWithTitle:(NSString *)title;

#pragma mark - J
#pragma mark - K
#pragma mark - L
#pragma mark - M
#pragma mark - N
- (VINavigationBar *)navigationBar;
- (void)setBackButtonTitle:(NSString *)title;
- (void)setContext:(id)context;
- (void)setCustomLeftItem:(UIBarButtonItem *)item;
- (void)setCustomLeftItem:(UIBarButtonItem *)item animated:(BOOL)animated ;
- (void)setCustomLeftView:(UIView *)view;
- (void)setCustomLeftView:(UIView *)view animated:(BOOL)animated;
- (void)setCustomRightItem:(UIBarButtonItem *)item;
- (void)setCustomRightItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)setCustomRightView:(UIView *)view;
- (void)setCustomRightView:(UIView *)view animated:(BOOL)animated;
- (void)setCustomTitleView:(UIView *)view;
- (void)setHidesBackButton:(BOOL)hidesBackButton ;
- (void)setHidesBackButton:(BOOL)hidesBackButton animated:(BOOL)animated;
- (void)setLeftItemsSupplementBackButton:(BOOL)leftItemsSupplementBackButton;
- (void)setNavigationBar:(VINavigationBar *)navigationBar;
- (void)setLeftBarButtonItem:(UIBarButtonItem *)item;
- (void)setLeftBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items;
- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items animated:(BOOL)animated ;
- (void)setRightBarButtonItem:(UIBarButtonItem *)item;
- (void)setRightBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
- (void)setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items;
- (void)setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items animated:(BOOL)animated;
- (void)setObject:(id)object forLeftRightKeyPath:(NSString *)keyPath animated:(BOOL)animated ;
- (void)setPrompt:(NSString *)prompt;
- (void)setTag:(int)tag;
- (void)setTitle:(NSString *)title;
- (void)setTitleView:(UIView *)titleView;
- (void)set_customLeftView:(UIView *)customLeftView;
- (void)set_customLeftViews:(NSArray *)customLeftViews;
- (void)set_customRightView:(UIView *)customLeftView;
- (void)set_customRightViews:(NSArray *)customLeftViews;
- (void)set_leftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;
- (void)set_leftBarButtonItems:(NSArray *)leftBarButtonItems;
- (void)set_rightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;
- (void)set_rightBarButtonItems:(NSArray *)rightBarButtonItems;
- (void)set_titleViewWidthForAnimations:(CGFloat)width;
- (void)_setAbbreviatedBackButtonTitles:(NSArray *)abbreviatedBackButtonTitles;
- (void)_setBackButtonPressed:(BOOL)backButtonPressed ;
- (void)_setBackButtonTitle:(NSString *)backButtonTitle lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)_setBarStyleIndependent:(BOOL)barStyleIndependent;
- (void)_setCustomLeftRightView:(UIView *)leftRightView left:(BOOL)left;
- (void)_setCustomLeftView:(UIView *)leftView;
- (void)_setCustomLeftViews:(NSArray *)leftViews;
- (void)_setCustomRightView:(UIView *)rightView;
- (void)_setCustomRightViews:(NSArray *)rightViews;
- (void)_setFontScaleAdjustment:(CGFloat)fontScaleAdjustment;
- (void)_setIdealCustomTitleWidth:(CGFloat)idealCustomTitleWidth;
- (void)_setIndependentBackgroundImage:(UIImage *)backgroundImage shadowImage:(UIImage *)shadowImage forBarMetrics:(int)barMetrics;
- (void)_setIndependentBarStyle:(int)independentBarStyle;
- (void)_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;
- (void)_setLeftBarButtonItems:(NSArray *)leftBarButtonItems;
- (void)_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;
- (void)_setRightBarButtonItems:(NSArray *)rightBarButtonItems;
- (void)_setLeftFlexibleSpaceCount:(NSUInteger)leftFlexibleSpaceCount;
- (void)_setRightFlexibleSpaceCount:(NSUInteger)rightFlexibleSpaceCount;
- (void)_setOwningNavigationBar:(VINavigationBar *)owningNavigationBar;
- (void)_setTitle:(NSString *)title animated:(BOOL)animated;
- (void)_setTitle:(NSString *)title animated:(BOOL)animated matchBarButtonItemAnimationDuration:(BOOL)matchBarButtonItemAnimationDuration;


#pragma mark - O
#pragma mark - P
#pragma mark - Q
#pragma mark - R
#pragma mark - S
#pragma mark - T
#pragma mark - U
- (void)_updateBarItemOwnersTo:(VINavigationItem *)owner;
- (void)updateNavigationBarButtonsAnimated:(BOOL)animated;
#pragma mark - V
#pragma mark - W
#pragma mark - X
#pragma mark - Y
#pragma mark - Z
@end
