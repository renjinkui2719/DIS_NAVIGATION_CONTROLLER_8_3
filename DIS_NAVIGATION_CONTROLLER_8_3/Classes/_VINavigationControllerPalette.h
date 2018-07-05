//
//  _VINavigationControllerPalette.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/4.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _VINavigationControllerPalette : UIView

@end

@interface _VINavigationControllerPalette(Methods)
@property(nonatomic, setter=_setVisibilityState:) long long _visibilityState; // @synthesize _visibilityState=__visibilityState;
@property(nonatomic, setter=_setHeightWhenUnscrolled:) double _heightWhenUnscrolled; // @synthesize _heightWhenUnscrolled=__heightWhenUnscrolled;
@property(nonatomic, getter=_isPalettePinningBarHidden, setter=_setPalettePinningBarHidden:) _Bool _palettePinningBarHidden; // @synthesize _palettePinningBarHidden=__palettePinningBarHidden;
@property(retain, nonatomic, setter=_setBackgroundConstraints:) NSArray *_backgroundConstraints; // @synthesize _backgroundConstraints=__backgroundConstraints;
@property(nonatomic, setter=_setSize:) struct CGSize _size; // @synthesize _size=__size;
@property(retain, nonatomic, setter=_setConstraints:) NSArray *_constraints; // @synthesize _constraints=__constraints;
@property(nonatomic, setter=_setPinningBar:) id _pinningBar; // @synthesize _pinningBar=__pinningBar;
@property(nonatomic) UIViewController *_unpinnedController; // @synthesize _unpinnedController=__unpinnedController;
@property(nonatomic) struct UIEdgeInsets preferredContentInsets; // @synthesize preferredContentInsets=_preferredContentInsets;
@property(nonatomic, getter=isVisibleWhenPinningBarIsHidden) _Bool visibleWhenPinningBarIsHidden; // @synthesize visibleWhenPinningBarIsHidden=_visibleWhenPinningBarIsHidden;
@property(readonly, nonatomic) unsigned long long boundaryEdge; // @synthesize boundaryEdge=_boundaryEdge;
@property(readonly, nonatomic) UINavigationController *navController; // @synthesize navController=_navController;
@property(nonatomic, setter=_setPaletteOverridesPinningBar:) _Bool _paletteOverridesPinningBar; // @synthesize _paletteOverridesPinningBar=__paletteOverridesPinningBar;
- (void)_setVisualAltitudeBias:(struct CGSize)arg1;
- (void)_setVisualAltitude:(double)arg1;
- (void)didMoveToSuperview;
@property(retain, nonatomic, setter=_setBackgroundView:) UIView *_backgroundView;
- (void)_setupBackgroundViewIfNecessary;
- (void)_resetVisibilityStateIfNecessary;
@property(nonatomic, setter=_setShouldHideWhenScrolling:) _Bool _shouldHideWhenScrolling;
- (void)_resetHeightConstraintConstant;
- (void)_setLeftConstraintConstant:(double)arg1;
- (void)_setTopConstraintConstant:(double)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)setFrame:(struct CGRect)arg1 isAnimating:(_Bool)arg2;
- (void)_resetConstraintConstants:(double)arg1;
- (void)_enableConstraints;
- (void)_disableConstraints;
- (void)_configurePaletteConstraintsForBoundary;
- (void)_updateBackgroundConstraintsIfNecessary;
- (void)_propagateBackgroundToContents;
- (_Bool)_shouldUpdateBackground;
- (void)_updateLayoutForCurrentConfiguration;
- (void)_configureConstraintsForBackground:(id)arg1;
- (_Bool)paletteIsHidden;
- (_Bool)isAttached;
@property(nonatomic, getter=isPinned) _Bool pinned;
- (void)_setAttached:(_Bool)arg1 didComplete:(_Bool)arg2;
@property(nonatomic) _Bool paletteShadowIsHidden;
- (void)_updateBackgroundView;
- (id)_attachedPinningTopBar;
@property(nonatomic) _Bool pinningBarShadowWasHidden;
@property(nonatomic) _Bool pinningBarShadowIsHidden;
@property(nonatomic, setter=_setRestartPaletteTransitionIfNecessary:) _Bool _restartPaletteTransitionIfNecessary;
@property(readonly, nonatomic, getter=_attachmentIsChanging) _Bool _attachmentIsChanging;
- (void)_setAttachmentIsChanging:(_Bool)arg1;
- (void)dealloc;
- (id)_initWithNavigationController:(id)arg1 forEdge:(unsigned long long)arg2;
- (_Bool)_supportsSpecialSearchBarTransitions;
@end
