//
//  VINavigationBar.h
//  Yeecall
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 YeeCall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationBar+Private.h"
#import "VINavigationTransitionView.h"
#import "_VINavigationControllerPalette.h"
#import "_VINavigationParallaxTransition.h"
#import "_VIBarPanGestureRecognizer.h"
#import "_VIAnimationCoordinator.h"
#import "_VIBarTapGestureRecognizer.h"
#import "UINavigationBar+Private.h"
#import "UIView+Private.h"
#import "_VINavigationInteractiveTransition.h"
#import "DISNavigationControllerCommons.h"
#import "UIApplication+Private.h"
#import "UIViewController+Private.h"

typedef struct VINavigationBarFlags{
    int animate : 1;
    int animationDisabledCount : 10;
    int transitioningBarStyle : 1;
    int newBarStyle : 3;
    int transitioningToTranslucent : 1;
    int barStyle : 3;
    int barTranslucence : 3;
    int disableLayout : 1;
    int backPressed : 1;
    int animatePromptChange : 1;
    int pendingHideBackButton : 1;
    int titleAutosizesToFit : 1;
    int usingNewAPI : 1;
    int forceFullHeightInLandscape : 1;
    int isLocked : 1;
    int shouldUpdatePromptAfterTransition : 1;
    int crossfadeItems : 1;
    int autoAdjustTitle : 1;
    int isContainedInPopover : 1;
    int needsDrawRect : 1;
    int animationCleanupCancelled : 1;
    int layoutInProgress : 1;
    int dynamicDuration : 1;
    int isInteractive : 1;
    int cancelledTransition : 1;
    int animationCount : 4;
    int backgroundLayoutNeedsUpdate : 1;
} VINavigationBarFlags;

#define _navbarFlags ((VINavigationBarFlags *)ADDRESS_OF_INSTANCE_IVAR(_navbarFlags))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
//#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))

@interface VINavigationBar : UINavigationBar
#if 0
{
NSMutableArray *_itemStack;
float _rightMargin;
unsigned int _state;
id _delegate;
UIView *_backgroundView;
UIView *_titleView;
NSArray *_leftViews;
NSArray *_rightViews;
UIView *_prompt;
UIView *_accessoryView;
UIColor *_barTintColor;
id _appearanceStorage;
id _currentAlert;
struct {
    //0x00
    int animate : 1;//0
    int animationDisabledCount : 10;//1
    int transitioningBarStyle : 1;//11
    int newBarStyle : 3;//12
    int transitioningToTranslucent : 1;//15
    int barStyle : 3;//16
    int barTranslucence : 3;//19
    int disableLayout : 1;//22
    int backPressed : 1;//23
    int animatePromptChange : 1;//24
    int pendingHideBackButton : 1;//25
    int titleAutosizesToFit : 1;//26
    int usingNewAPI : 1;//27
    int forceFullHeightInLandscape : 1;//28
    int isLocked : 1;//29
    int shouldUpdatePromptAfterTransition : 1;//30
    int crossfadeItems : 1;//31
    //0x04
    int autoAdjustTitle : 1;//0
    int isContainedInPopover : 1;//1
    int needsDrawRect : 1;//2
    int animationCleanupCancelled : 1;//3
    int layoutInProgress : 1;//4
    int dynamicDuration : 1;//5
    int isInteractive : 1;//6
    int cancelledTransition : 1;//7
    int animationCount : 4;//8
    int backgroundLayoutNeedsUpdate : 1;//12
} _navbarFlags;
UISwipeGestureRecognizer *_popSwipeGestureRecognizer;
UIImageView *_backIndicatorView;
NSMutableArray *_slideTransitionClippingViews;
_UIViewControllerTransitionContext *_navControllerAnimatingContext;
char _needsUpdateBackIndicatorImage;
char _wantsLetterpressContent;
char __condensed;
int _barPosition;
float _requestedMaxBackButtonWidth;
NSString *_backdropViewLayerGroupName;
NSMutableArray *__animationIds;
}
#endif
@end
