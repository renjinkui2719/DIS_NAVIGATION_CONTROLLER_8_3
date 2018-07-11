//
//  VINavigationItemView.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/10.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VINavigationItem;

@interface VINavigationItemView : UIView
{
    VINavigationItem *_item;
    CGSize _titleSize;
    UIView *_topCrossView;
    UIView *_bottomCrossView;
    BOOL _isCrossFading;
    BOOL _customFontSet;
    UILabel *_label;
    char _isFadingInFromCustomAlpha;
}
@property (setter=_setFadingInFromCustomAlpha:, nonatomic) BOOL _isFadingInFromCustomAlpha;
@end
