//
//  VINavigationItemButtonView.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/10.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import "VINavigationItemView.h"

@interface VINavigationItemButtonView : VINavigationItemView<UIGestureRecognizerDelegate>
{
    int _style;
    BOOL _pressed;
    _UIBarButtonItemAppearanceStorage *_appearanceStorage;
    BOOL _customBackgroundImageChangedToOrFromNil;
    UIImageView *_backgroundImageView;
    UIImageView *_imageView;
    BOOL _wantsBlendModeForAccessibilityBackgrounds;
    unsigned int _abbreviatedTitleIndex;
}

@property (setter=_setAbbreviatedTitleIndex:, nonatomic) unsigned int _abbreviatedTitleIndex;
@property (setter=_setWantsBlendModeForAccessibilityBackgrounds:, nonatomic) BOOL _wantsBlendModeForAccessibilityBackgrounds;
@property (setter=_setTintColor:, retain, nonatomic) UIColor *_tintColor;
@end
