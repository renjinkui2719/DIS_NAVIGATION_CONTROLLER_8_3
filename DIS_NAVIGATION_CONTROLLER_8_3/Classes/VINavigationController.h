//
//  VINavigationController.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/3.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#define INHERITE 1

#import <UIKit/UIKit.h>
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

#if INHERITE
struct VINavigationControllerFlags{
    //0x00
    int isAppearingAnimated : 1;//0
    int isAlreadyPoppingNavigationItem : 1;//1
    int isNavigationBarHidden : 1;//2
    int isToolbarShown : 1;//3
    int needsDeferredTransition : 1;//4
    int isTransitioning : 1;//5
    int paletteTransitionPending : 1;//6
    int lastOperation : 4;//7
    int lastOperationAnimated : 1;//11
    int deferredTransition : 8;//19
    int didPreloadKeyboardAnimation : 1;//20
    int didHideBottomBar : 1;//21
    int didExplicitlyHideTabBar : 1;//22
    int isChangingOrientationForPop : 1;//23
    int pretendNavBarHidden : 1;//24
    int avoidMovingNavBarOffscreenBeforeUnhiding : 1;//25
    int searchBarHidNavBar : 1;//26
    int useSystemPopoverBarAppearance : 1;//27
    int isCustomTransition : 1;//28
    int isBuiltinTransition : 1;//29
    int resetDidHideOnCancel : 1;//30
    int delegateWillShowViewController : 1;//31
    //0x04
    int delegateDidShowViewController : 1;//0
    int delegateTransitionController : 1;//1
    int delegateTransitionControllerEx : 1;//2
    int delegateInteractionController : 1;//3
    int delegateInteractionControllerEx : 1;//4
    int delegateShouldCrossFadeNavigationBar : 1;//5
    int delegateShouldCrossFadeBottomBars : 1;//6
    int delegateShouldUseBuiltinInteractionController : 1;//7
    int delegateSupportedInterfaceOrientations : 1;//8
    int delegatePreferredInterfaceOrientationForPresentation : 1;//9
    int delegateLayoutTransitioningClass : 1;//10
    int navigationBarHidesCompletelyOffscreen : 1;//11
    int clipUnderlapWhileTransitioning : 1;//12
    int isCrossfadingOutTabBar : 1;//13
    int isCrossfadingInTabBar : 1;//14
    int skipContentInsetCalculation : 1;//15
    int neverInWindow : 1;//16
    int useStandardStatusBarHeight : 1;//17
    int allowUserInteractionDuringTransition : 1;//18
    int enableBackButtonDuringTransition : 1;//19
    int allowsGroupBlending : 1;//20
    int allowNestedNavigationControllers : 1;//21
    int nestedNavigationBarWasHidden : 1;//22
    int nestedToolbarWasHidden : 1;//23
    int isNested : 1;//24
    int searchHidNavigationBar : 1;//25
    int suppressMixedOrientationPop : 1;//26
    int disappearingViewControllerIsBeingRemoved : 1;//27
    int isWrappingDuringAdaptation : 1;//28
};
typedef struct VINavigationControllerFlags VINavigationControllerFlags;

#define _containerView (GET_INSTANCE_IVAR(UIView *, _containerView))
#define _navigationBar (GET_INSTANCE_IVAR(UINavigationBar *, _navigationBar))
#define _navigationBarClass (GET_INSTANCE_IVAR(Class *, _navigationBarClass))
#define _toolbar (GET_INSTANCE_IVAR(UIToolbar *, _toolbar))
#define __backdropGroupName (GET_INSTANCE_IVAR(UIToolbar *, __backdropGroupName))
#define _navigationControllerFlags ((VINavigationControllerFlags *)ADDRESS_OF_INSTANCE_IVAR(_navigationControllerFlags))
#define _topPalette (GET_INSTANCE_IVAR(_VINavigationControllerPalette *, _topPalette))
#define __barAnimationWasCancelled (GET_INSTANCE_IVAR(BOOL, __barAnimationWasCancelled))
#define __barInteractiveAnimationCoordinator (GET_INSTANCE_IVAR(_VIAnimationCoordinator *, __barInteractiveAnimationCoordinator))
#define __barSwipeHideGesture (GET_INSTANCE_IVAR(_VIBarPanGestureRecognizer *, __barSwipeHideGesture))
#define __barTapHideGesture (GET_INSTANCE_IVAR(_VIBarTapGestureRecognizer *, __barTapHideGesture))
#define __cachedTransitionController (GET_INSTANCE_IVAR(_VINavigationParallaxTransition *, __cachedTransitionController))
#define __cachedInteractionController (GET_INSTANCE_IVAR(_VINavigationInteractiveTransition *, __cachedInteractionController))
#define _interactiveTransition (GET_INSTANCE_IVAR(BOOL, _interactiveTransition))
#define _view (GET_INSTANCE_IVAR(UIView *, _view))
//#define _builtinTransitionStyle (GET_INSTANCE_IVAR(int, _builtinTransitionStyle))

@interface VINavigationController : UINavigationController
#else
@interface VINavigationController : UIViewController
<UIGestureRecognizerDelegatePrivate, UINavigationBarDelegate>
{
    UIView *_containerView;
    UINavigationBar *_navigationBar;
    Class _navigationBarClass;
    UIToolbar *_toolbar;
    UIView *_navigationTransitionView;
    float _bottomInsetDelta;
    float _statusBarHeightForHideShow;
    UIViewController *_disappearingViewController;
    UINavigationControllerDelegate *_delegate;
    int _savedNavBarStyleBeforeSheet;
    int _savedToolBarStyleBeforeSheet;
    UITapGestureRecognizer *_backGestureRecognizer;
    _UINavigationControllerPalette *_topPalette;
    _UINavigationControllerPalette *_freePalette;
    _UINavigationControllerPalette *_transitioningTopPalette;
    struct {
        //0x00
        int isAppearingAnimated : 1;//0
        int isAlreadyPoppingNavigationItem : 1;//1
        int isNavigationBarHidden : 1;//2
        int isToolbarShown : 1;//3
        int needsDeferredTransition : 1;//4
        int isTransitioning : 1;//5
        int paletteTransitionPending : 1;//6
        int lastOperation : 4;//7
        int lastOperationAnimated : 1;//11
        int deferredTransition : 8;//19
        int didPreloadKeyboardAnimation : 1;//20
        int didHideBottomBar : 1;//21
        int didExplicitlyHideTabBar : 1;//22
        int isChangingOrientationForPop : 1;//23
        int pretendNavBarHidden : 1;//24
        int avoidMovingNavBarOffscreenBeforeUnhiding : 1;//25
        int searchBarHidNavBar : 1;//26
        int useSystemPopoverBarAppearance : 1;//27
        int isCustomTransition : 1;//28
        int isBuiltinTransition : 1;//29
        int resetDidHideOnCancel : 1;//30
        int delegateWillShowViewController : 1;//31
        //0x04
        int delegateDidShowViewController : 1;//0
        int delegateTransitionController : 1;//1
        int delegateTransitionControllerEx : 1;//2
        int delegateInteractionController : 1;//3
        int delegateInteractionControllerEx : 1;//4
        int delegateShouldCrossFadeNavigationBar : 1;//5
        int delegateShouldCrossFadeBottomBars : 1;//6
        int delegateShouldUseBuiltinInteractionController : 1;//7
        int delegateSupportedInterfaceOrientations : 1;//8
        int delegatePreferredInterfaceOrientationForPresentation : 1;//9
        int delegateLayoutTransitioningClass : 1;//10
        int navigationBarHidesCompletelyOffscreen : 1;//11
        int clipUnderlapWhileTransitioning : 1;//12
        int isCrossfadingOutTabBar : 1;//13
        int isCrossfadingInTabBar : 1;//14
        int skipContentInsetCalculation : 1;//15
        int neverInWindow : 1;//16
        int useStandardStatusBarHeight : 1;//17
        int allowUserInteractionDuringTransition : 1;//18
        int enableBackButtonDuringTransition : 1;//19
        int allowsGroupBlending : 1;//20
        int allowNestedNavigationControllers : 1;//21
        int nestedNavigationBarWasHidden : 1;//22
        int nestedToolbarWasHidden : 1;//23
        int isNested : 1;//24
        int searchHidNavigationBar : 1;//25
        int suppressMixedOrientationPop : 1;//26
        int disappearingViewControllerIsBeingRemoved : 1;//27
        int isWrappingDuringAdaptation : 1;//28
    }_navigationControllerFlags;
    char _interactiveTransition;
    char _hidesBarsWhenKeyboardAppears;
    char _hidesBarsOnSwipe;
    char _hidesBarsWhenVerticallyCompact;
    char _hidesBarsOnTap;
    char __usingBuiltinAnimator;
    char __barAnimationWasCancelled;
    Class _toolbarClass;
    float _customNavigationTransitionDuration;
    UIViewControllerAnimatedTransitioning *__transitionController;
    _UINavigationParallaxTransition *__cachedTransitionController;
    UIViewControllerInteractiveTransitioning  _UINavigationInteractiveTransition *__cachedInteractionController;
    NSUUID *__toolbarAnimationId;
    NSUUID *__navbarAnimationId;
    id __updateNavigationBarHandler;
    id __keyboardAppearedNotificationToken;
    _UIBarPanGestureRecognizer *__barSwipeHideGesture;
    _UIAnimationCoordinator *__barInteractiveAnimationCoordinator;
    _UIBarTapGestureRecognizer *__barTapHideGesture;
    int _builtinTransitionStyle;
    float _builtinTransitionGap;
    NSString *__backdropGroupName;
}
#endif

@end

@interface VINavigationController(Methods)
- (void)setDisappearingViewController:(id)arg;
- (BOOL)_customizesForPresentationInPopover;
- (double)_statusBarHeightAdjustmentForCurrentOrientation;
- (id)moreListTableCell;
- (id)moreListSelectedImage;
- (id)moreListImage;
- (id)_moreListTitle;
- (void)_didResignContentViewControllerOfPopover:(id)arg1;
- (void)_didBecomeContentViewControllerOfPopover:(id)arg1;
- (void)_willBecomeContentViewControllerOfPopover:(id)arg1;
- (id)_viewForContentInPopover;
- (_Bool)isModalInPopover;
- (void)_prepareForPresentationInPopover:(id)arg1;
- (void)_prepareForDismissalInPopover:(id)arg1;
- (struct CGRect)_frameForContainerViewInSheetForBounds:(struct CGRect)arg1 displayingTopView:(_Bool)arg2 andBottomView:(_Bool)arg3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)arg1;
- (void)_setPreferredContentSizeFromChildContentContainer:(id)arg1;
- (struct CGSize)preferredContentSize;
- (struct CGSize)contentSizeForViewInPopover;
- (void)setPreferredContentSize:(struct CGSize)arg1;
- (void)setContentSizeForViewInPopover:(struct CGSize)arg1;
- (struct CGSize)_adjustedContentSizeForPopover:(struct CGSize)arg1;
- (void)_layoutTopViewControllerOutOfSheet;
- (void)_layoutTopViewControllerInSheetWithPopoverView:(id)arg1;
- (void)_layoutTopViewControllerInSheet;
- (void)updateTabBarItemForViewController:(id)arg1;
- (id)tabBarItem;
- (_Bool)_navigationSoundsEnabled;
- (void)_setNavigationSoundsEnabled:(_Bool)arg1;
- (void)_playPopNavigationSound;
- (void)_playPushNavigationSound;
- (id)defaultPNGName;
- (void)_setBarsHidden:(_Bool)arg1 allowAnimation:(_Bool)arg2;
- (void)_setBarsHidden:(_Bool)arg1;
- (void)_gestureRecognizedToggleVisibility:(id)arg1;
- (_Bool)_useCrossFadeForGestureHiding;
- (_Bool)_shouldHideBarsForTraits:(id)arg1;
- (void)_configureBarTapGesture;
- (id)_existingToolbarWithItems;
- (void)_makeBarHideGestureIfNecessary;
- (void)_gestureRecognizedInteractiveHide:(id)arg1;
- (void)_configureBarSwipeGesture;
- (void)_makeBarSwipeGestureIfNecessary;
- (void)setCondensesBarsOnSwipe:(_Bool)arg1;
- (_Bool)condensesBarsOnSwipe;
- (void)_configureKeyboardBarHiding;
- (void)_hideForKeyboardAppearance;
- (void)_setKeyboardNotificationToken:(id)arg1;
- (void)_configureBarsAutomaticActions;
- (void)_navigationItemDidUpdateSearchController:(id)arg1 oldSearchController:(id)arg2;
- (void)navigationBarDidChangeOpacity:(id)arg1;
- (struct NSDirectionalEdgeInsets)_layoutMarginsforNavigationBar:(id)arg1;
- (void)_performCoordinatedUpdateTopFramesTransitionAnimation;
- (void)_performCoordinatedLayoutToLayoutNavigationTransitionAnimations;
- (struct CGRect)_incomingNavigationBarFrame;
- (void)_navigationBarWillBeginCoordinatedTransitionAnimations:(id)arg1;
- (_Bool)_isPushingOrPoppingUsingLayoutToLayoutNavigationTransition;
- (void)_initializeNavigationDeferredTransitionContextIfNecessary;
- (void)_navigationBarChangedSize:(id)arg1;
- (void)navigationBarDidResizeForPrompt:(id)arg1;
- (void)navigationBar:(id)arg1 buttonClicked:(int)arg2;
- (_Bool)navigationBar:(id)arg1 shouldPopItem:(id)arg2;
- (id)_findViewControllerToPopToForNavigationItem:(id)arg1;
- (long long)_positionForBar:(id)arg1;
- (_Bool)_viewControllerUnderlapsStatusBar;
- (void)updateTitleForViewController:(id)arg1;
- (id)rotatingSnapshotViewForWindow:(id)arg1;
- (void)didRotateFromInterfaceOrientation:(long long)arg1;
- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(long long)arg1 duration:(double)arg2;
- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(long long)arg1;
- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(long long)arg1 duration:(double)arg2;
- (id)_childViewControllersToSendViewWillTransitionToSize;
- (struct CGSize)sizeForChildContentContainer:(id)arg1 withParentContainerSize:(struct CGSize)arg2;
- (void)willTransitionToTraitCollection:(id)arg1 withTransitionCoordinator:(id)arg2;
- (void)viewWillTransitionToSize:(struct CGSize)arg1 withTransitionCoordinator:(id)arg2;
- (void)willAnimateRotationToInterfaceOrientation:(long long)arg1 duration:(double)arg2;
- (void)willRotateToInterfaceOrientation:(long long)arg1 duration:(double)arg2;
- (void)_getRotationContentSettings:(void *)arg1;
- (_Bool)_shouldUseOnePartRotation;
- (id)rotatingFooterView;
- (id)rotatingHeaderView;
- (_Bool)_isSupportedInterfaceOrientation:(long long)arg1;
- (_Bool)_shouldSynthesizeSupportedOrientations;
- (_Bool)shouldAutorotateToInterfaceOrientation:(long long)arg1;
- (_Bool)_doesTopViewControllerSupportInterfaceOrientation:(long long)arg1;
- (_Bool)_allowsAutorotation;
- (_Bool)_allowsFreezeLayoutForOrientationChangeOnDismissal;
- (void)_setAllowsFreezeLayoutForOrientationChangeOnDismissal:(_Bool)arg1;
- (_Bool)_transitionConflictsWithNavigationTransitions:(id)arg1;
- (void)_presentationTransitionUnwrapViewController:(id)arg1;
- (void)_presentationTransitionWrapViewController:(id)arg1 forTransitionContext:(id)arg2;
- (id)popToViewControllerWithSnapbackIdentifier:(id)arg1 animated:(_Bool)arg2;
- (id)popToViewController:(id)arg1 transition:(int)arg2;
- (id)popToViewController:(id)arg1 animated:(_Bool)arg2;
- (id)popToRootViewControllerWithTransition:(int)arg1;
- (id)popToRootViewControllerAnimated:(_Bool)arg1;
- (id)popViewControllerWithTransition:(int)arg1;
- (id)popViewControllerWithAnimationTransition:(long long)arg1 duration:(double)arg2 curve:(long long)arg3;
- (id)_popViewControllerWithTransition:(int)arg1 allowPoppingLast:(_Bool)arg2;
- (void)_popViewControllerAndUpdateInterfaceOrientationAnimated:(_Bool)arg1;
- (double)_customNavigationTransitionDuration;
- (double)customNavigationTransitionDuration;
- (id)_interruptibleNavigationTransitionAnimator;
- (_Bool)_hasInterruptibleNavigationTransition;
- (_Bool)_isInteractiveCustomNavigationTransition;
- (_Bool)_willPerformCustomNavigationTransitionForPush;
- (_Bool)_willPerformCustomNavigationTransitionForPop;
- (_Bool)_shouldPopFromLandscapeToPortraitOrientation;
- (long long)preferredInterfaceOrientationForPresentation;
- (_Bool)_hasPreferredInterfaceOrientationForPresentation;
- (unsigned long long)supportedInterfaceOrientations;
- (id)_snapshotView;
- (void)_setVisualAltitudeForBar:(id)arg;
- (void)_setBackdropViewLayerGroupName:(id)arg;
- (void)_tabBarControllerDidFinishShowingTabBar:(id)arg1 isHidden:(_Bool)arg2;
- (void)_hideOrShowBottomBarIfNeededWithTransition:(int)arg1;
- (void)_updateBottomBarHiddenState;
- (void)_resetBottomBarHiddenState;
- (_Bool)_shouldBottomBarBeHidden;
- (id)popViewControllerAnimated:(_Bool)arg1;
- (id)_findViewControllerToPopTo;
- (id)_nthChildViewControllerFromTop:(unsigned long long)arg1;
- (void)pushViewController:(id)arg1 transition:(int)arg2;
- (void)pushViewController:(id)arg1 transition:(int)arg2 forceImmediate:(_Bool)arg3;
- (void)pushViewController:(id)arg1 animated:(_Bool)arg2;
- (void)_prepareForNormalDisplayWithNavigationController:(id)arg1;
- (void)_noteNestedNavigationControllerDidReturnToNormal:(id)arg1;
- (void)_detachTopPaletteIfShowingSearchBarForViewController:(id)arg1;
- (void)_detachTopPaletteIfShowingSearchBarForTopmostViewControllerInNavigationController:(id)arg1;
- (void)_prepareForNestedDisplayWithNavigationController:(id)arg1;
- (_Bool)canPerformAction:(SEL)arg1 withSender:(id)arg2;
- (void)showViewController:(id)arg1 sender:(id)arg2;
- (id)separateSecondaryViewControllerForSplitViewController:(id)arg1;
- (void)collapseSecondaryViewController:(id)arg1 forSplitViewController:(id)arg2;
- (void)_executeNavigationHandler:(dispatch_block_t)arg1 deferred:(_Bool)arg2;
- (id)_customInteractionController:(id)arg1;
- (_Bool)_shouldUseBuiltinInteractionController;
- (void)__viewWillLayoutSubviews;
- (void)_safeAreaInsetsDidChangeForView;
- (void)_layoutContainerViewSemanticContentAttributeChanged:(id)arg1;
- (id)_customTransitionController:(_Bool)arg1;
- (_Bool)_isPerformingLayoutToLayoutTransition;
- (void)_propagateContentAdjustmentsForControllersWithSharedViews;
- (id)_builtinInteractionController;
- (id)_builtinTransitionController;
- (void)_notifyTransitionBegan:(id)arg1;
- (void)_clearLastOperation;
- (int)_deferredTransition;
- (void)_startDeferredTransitionIfNeeded;
- (void)_startDeferredTransitionIfNeeded:(id)arg1;
- (void)_startTransition:(int)arg1 fromViewController:(id)arg2 toViewController:(id)arg3;
- (void)_updateScrollViewFromViewController:(id)arg1 toViewController:(id)arg2;
- (long long)_navigationTransitionForUITransition:(int)arg1;
- (void)_layoutViewController:(id)arg1;
- (void)_performSkippedHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary;
- (_Bool)_shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary;
- (_Bool)_canHostRefreshControlOwnedByScrollView:(id)arg1;
- (void)_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:(id)arg1;
- (void)_reloadCachedInteractiveScrollMeasurements;
- (void)_handleSubtreeDidGainScrollView:(id)arg1;
- (void)_viewControllerSubtreeDidGainViewController:(id)arg1;
- (void)_viewSubtreeDidGainScrollView:(id)arg1 enclosingViewController:(id)arg2;
- (void)_observeScrollView:(id)arg1 didBeginTransitionToDeferredContentOffset:(struct CGPoint)arg2;
- (void)_stopObservingContentScrollViewForViewController:(id)arg1;
- (void)_stopObservingContentScrollView:(id)arg1;
- (void)_observeScrollViewDidScroll:(id)arg1 topLayoutType:(long long)arg2;
- (void)_observeScrollViewDidScroll:(id)arg1;
- (void)_observeScrollViewDidEndDecelerating:(id)arg1;
- (void)_observeScrollViewDidEndDragging:(id)arg1 willDecelerate:(_Bool)arg2;
- (void)_observeScrollViewWillBeginDragging:(id)arg1;
- (struct UIEdgeInsets)_collapsableContentPaddingForObservedScrollView:(id)arg1;
- (struct UIEdgeInsets)_revealableContentPaddingForObservedScrollView:(id)arg1 includeContentWithCollapsedAffinity:(_Bool)arg2;
- (void)_observeScrollView:(id)arg1 willEndDraggingWithVelocity:(struct CGPoint)arg2 targetContentOffset:(struct CGPoint *)arg3 unclampedOriginalTarget:(struct CGPoint)arg4;
- (double)_scrollOffsetRetargettedToDetentOffsetIfNecessary:(double)arg1 unclampedOriginalTargetOffset:(double)arg2 scrollView:(id)arg3;
- (id)_scrollDetentOffsetsForScrollView:(id)arg1;
- (double)_topBarHeight;
- (double)_heightOfTopPartsWhenHiddenAndCollapsed;
- (double)_heightOfTopPartsWhenVisibleAndExpanded;
- (struct CGSize)_navigationBarSizeForViewController:(id)arg1 proposedHeight:(double)arg2 verticalFittingPriority:(float)arg3 allowRubberBandStretch:(_Bool)arg4;
- (void *)_intrinsicNavigationBarHeightRangeForViewController:(id)arg1;
- (double)_preferredHeightForHidingNavigationBarForViewController:(id)arg1;
- (double)_widthForLayout;
- (id)_independentContainedScrollViewIntermediateToDescendantViewController:(id)arg1;
- (void)_calculateTopViewFramesForExpandedLayoutWithViewController:(id)arg1 contentScrollView:(id)arg2 gettingNavBarFrame:(struct CGRect *)arg3 topPaletteFrame:(struct CGRect *)arg4;
- (void)_calculateTopViewFramesForPushPopIncomingLayoutWithViewController:(id)arg1 contentScrollView:(id)arg2 gettingNavBarFrame:(struct CGRect *)arg3 topPaletteFrame:(struct CGRect *)arg4;
- (double)_topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:(id)arg1;
- (void)_calculateTopViewFramesForLayoutWithViewController:(id)arg1 contentScrollView:(id)arg2 navBarFrame:(struct CGRect *)arg3 topPaletteFrame:(struct CGRect *)arg4 topLayoutType:(long long)arg5;
- (void *)_calculateTopLayoutInfoForViewController:(id)arg1;
- (void)_performTopViewGeometryUpdates:(dispatch_block_t)arg1;
- (void)_initializeHeightOfTopPalette:(id)arg1;
- (void)_updateTopPaletteVisibilityState;
- (void)_updateTopViewFramesToMatchScrollOffsetInViewController:(id)arg1 contentScrollView:(id)arg2 topLayoutType:(long long)arg3;
- (_Bool)_canUpdateTopViewFramesToMatchScrollView;
- (void)_performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:(dispatch_block_t)arg1;
- (long long)_topLayoutTypeForViewController:(id)arg1;
- (_Bool)_isPushingOrPopping;
- (void)_updateTopViewFramesForViewController:(id)arg1;
- (void)_computeAndApplyScrollContentInsetDeltaForViewController:(id)arg1;
- (double)_scrollViewBottomContentInsetForViewController:(id)arg1;
- (double)_scrollViewTopContentInsetForViewController:(id)arg1;
- (struct UIEdgeInsets)_expectedContentInsetDeltaForViewController:(id)arg1;
- (struct CGRect)_frameForWrapperViewForViewController:(id)arg1;
- (struct CGRect)_frameForViewController:(id)arg1;
- (void)_marginInfoForChild:(id)arg1 leftMargin:(double *)arg2 rightMargin:(double *)arg3;
- (struct UIEdgeInsets)_edgeInsetsForChildViewController:(id)arg1 insetsAreAbsolute:(_Bool *)arg2;
- (struct UIEdgeInsets)_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController:(id)arg1;
- (struct UIEdgeInsets)_avoidanceInsets;
- (void)_eagerlyUpdateSafeAreaInsets;
- (void)_layoutTopViewController;
@property(readonly, nonatomic) _Bool _isLayingOutTopViewController;
- (void)_updateChildContentMargins;
- (void)_updatePaletteConstraints;
- (void)_updatePalettesWithBlock:(dispatch_block_t)arg1;
- (_Bool)_shouldLayoutViewControllerForTransparentStatusBar:(id)arg1;
- (_Bool)_shouldChildViewControllerUseFullScreenLayout:(id)arg1;
- (_Bool)_shouldToolBar:(id)arg1 insetViewController:(id)arg2;
- (_Bool)_shouldToolBar:(id)arg1 insetViewController:(id)arg2 orOverlayContent:(_Bool *)arg3;
- (_Bool)_shouldTabBarController:(id)arg1 insetViewController:(id)arg2 orOverlayContent:(_Bool *)arg3;
- (_Bool)_shouldNavigationBarInsetViewController:(id)arg1;
- (_Bool)_shouldNavigationBarInsetViewController:(id)arg1 orOverlayContent:(_Bool *)arg2;
- (_Bool)_isNavigationBarEffectivelyVisible;
- (_Bool)_shouldNavigationBarInsetViewControllerPreInnsbruck:(id)arg1;
- (_Bool)_isNavigationBarVisible;
- (_Bool)_hasTranslucentNavigationBarIncludingViewController:(id)arg1;
- (void)_updateLayoutForStatusBarAndInterfaceOrientation;
- (void)_updateBarsForCurrentInterfaceOrientation;
- (_Bool)wasLastOperationAnimated;
- (long long)lastOperation;
@property(nonatomic) _Bool needsDeferredTransition;
- (void)setNeedsDeferredTransition;
- (void)_setCustomTransition:(_Bool)arg1;
- (_Bool)isBuiltinTransition;
- (_Bool)isCustomTransition;
- (double)navigationTransitionView:(id)arg1 durationForTransition:(long long)arg2;
- (void)_navigationTransitionView:(id)arg1 didCancelTransition:(long long)arg2 fromViewController:(id)arg3 toViewController:(id)arg4 wrapperView:(id)arg5;
- (void)navigationTransitionView:(id)arg1 didEndTransition:(long long)arg2 fromView:(id)arg3 toView:(id)arg4;
- (void)navigationTransitionView:(id)arg1 didStartTransition:(long long)arg2;
- (id)_transitionAnimationContext;
- (_Bool)_isTransitioning;
- (void)didShowViewController:(id)arg1 animated:(_Bool)arg2;
- (void)_privateWillShowViewController:(id)arg1;
- (void)willShowViewController:(id)arg1 animated:(_Bool)arg2;
- (id)_deepestUnambiguousResponder;
- (_Bool)becomeFirstResponder;
- (_Bool)_gestureRecognizer:(id)arg1 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)arg2;
- (_Bool)_gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2;
- (_Bool)_gestureRecognizerShouldBegin:(id)arg1;
- (id)_screenEdgePanGestureRecognizer;
- (void)_performBackGesture:(id)arg1;
- (void)traitCollectionDidChange:(id)arg1;
- (id)segueForUnwindingToViewController:(id)arg1 fromViewController:(id)arg2 identifier:(id)arg3;
- (void)unwindForSegue:(id)arg1 towardsViewController:(id)arg2;
- (id)allowedChildViewControllersForUnwindingFromSource:(id)arg1;
- (id)viewControllerForUnwindSegueAction:(SEL)arg1 fromViewController:(id)arg2 withSender:(id)arg3;
- (void)_updateToolbarItemsFromViewController:(id)arg1 animated:(_Bool)arg2;
- (_Bool)editing;
- (void)setEditing:(_Bool)arg1 animated:(_Bool)arg2;
- (void)viewDidUnload;
- (void)purgeMemoryForReason:(int)arg1;
- (_Bool)_viewControllerWasSelected;
- (void)viewDidDisappear:(_Bool)arg1;
- (void)viewWillDisappear:(_Bool)arg1;
- (id)_viewControllerForDisappearCallback;
- (void)viewDidAppear:(_Bool)arg1;
- (void)_setIsWrappingDuringAdaptation:(_Bool)arg1;
- (void)viewDidMoveToWindow:(id)arg1 shouldAppearOrDisappear:(_Bool)arg2;
- (void)viewWillAppear:(_Bool)arg1;
- (_Bool)isShown;
@property(readonly, nonatomic) UIGestureRecognizer *interactivePopGestureRecognizer;
- (void)loadView;
- (void)_setUpContentFocusContainerGuide;
- (id)_recallRememberedFocusedItemForViewController:(id)arg1;
- (void)_forgetFocusedItemForViewController:(id)arg1;
- (void)_rememberFocusedItem:(id)arg1 forViewController:(id)arg2;
@property(readonly, nonatomic, getter=_rememberedFocusedItemsByViewController) NSMapTable *rememberedFocusedItemsByViewController; // @synthesize rememberedFocusedItemsByViewController=_rememberedFocusedItemsByViewController;
- (void)_didUpdateFocusInContext:(id)arg1 withAnimationCoordinator:(id)arg2;
- (id)preferredFocusEnvironments;
- (long long)_subclassPreferredFocusedViewPrioritizationType;
- (id)preferredFocusedView;
- (id)_overridingPreferredFocusEnvironment;
- (_Bool)_canRestoreFocusAfterTransitionToRecalledItem:(id)arg1 inViewController:(id)arg2;
- (void)_rememberPresentingFocusedItem:(id)arg1;
- (void)_navigationBarDidEndAnimation:(id)arg1;
- (void)_navigationBarDidChangeStyle:(id)arg1;
- (id)childViewControllerForUserInterfaceStyle;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)childViewControllerForWhitePointAdaptivityStyle;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (long long)preferredStatusBarStyle;
- (void)_hideShowToolbarDidStop:(id)arg1 finished:(id)arg2 context:(id)arg3;
- (void)_setToolbarHidden:(_Bool)arg1 edge:(unsigned long long)arg2 duration:(double)arg3;
- (void)_positionToolbarHidden:(_Bool)arg1 edge:(unsigned long long)arg2 crossFade:(_Bool)arg3;
- (void)_positionToolbarHidden:(_Bool)arg1 edge:(unsigned long long)arg2;
- (void)_positionToolbarHidden:(_Bool)arg1;
- (void)setToolbarHidden:(_Bool)arg1 animated:(_Bool)arg2;
@property(readonly, nonatomic) UIToolbar *toolbar;
- (void)setToolbar:(id)arg1;
- (void)_configureToolbar;
- (id)_existingToolbar;
- (id)_existingNavigationBar;
- (void)_sendNavigationBarToBack;
@property(nonatomic) _Bool avoidMovingNavBarOffscreenBeforeUnhiding;
- (void)setSearchBarHidNavBar:(_Bool)arg1;
- (_Bool)searchBarHidNavBar;
@property(nonatomic) _Bool pretendNavBarHidden;
- (void)_hideShowNavigationBarDidStop:(id)arg1 finished:(id)arg2 context:(id)arg3;
- (void)_setNavigationBarHidden:(_Bool)arg1 edge:(unsigned long long)arg2 duration:(double)arg3;
- (void)_unhideNavigationBarForEdge:(unsigned long long)arg1;
- (void)_positionNavigationBar:(id)arg1 hidden:(_Bool)arg2 edge:(unsigned long long)arg3 center:(struct CGPoint)arg4 offset:(double)arg5;
@property(nonatomic, setter=_setSearchHidNavigationBar:) _Bool _searchHidNavigationBar;
- (void)_setNavigationBarHidesCompletelyOffscreen:(_Bool)arg1;
- (struct CGPoint)_computeTopBarCenter:(id)arg1 hidden:(_Bool)arg2 edge:(unsigned long long)arg3 center:(struct CGPoint)arg4 offset:(double)arg5;
- (_Bool)_reallyWantsFullScreenLayout;
- (void)_positionNavigationBarHidden:(_Bool)arg1;
- (void)_setNavigationBarHidden:(_Bool)arg1 edgeIfNotNavigating:(unsigned long long)arg2 duration:(double)arg3;
- (_Bool)_isTransitioningOrPaletteIsTransitioning;
- (void)_repositionPaletteWithNavigationBarHidden:(_Bool)arg1 duration:(double)arg2 shouldUpdateNavigationItems:(_Bool)arg3;
- (void)_positionPaletteHidden:(_Bool)arg1 edge:(unsigned long long)arg2;
- (void)_positionTransitioningPalette:(id)arg1 outside:(_Bool)arg2 edge:(unsigned long long)arg3 preservingYPosition:(_Bool)arg4;
- (void)_positionPaletteHidden:(_Bool)arg1 edge:(unsigned long long)arg2 initialOffset:(double)arg3;
- (void)_positionNavigationBarHidden:(_Bool)arg1 edge:(unsigned long long)arg2;
- (void)_positionNavigationBarHidden:(_Bool)arg1 edge:(unsigned long long)arg2 initialOffset:(double)arg3;
- (void)setNavigationBarHidden:(_Bool)arg1 animated:(_Bool)arg2;
- (_Bool)_animationParametersForHidingNavigationBar:(_Bool)arg1 lastOperation:(long long)arg2 edge:(unsigned long long *)arg3 duration:(double *)arg4;
- (_Bool)_clipUnderlapWhileTransitioning;
- (void)_setClipUnderlapWhileTransitioning:(_Bool)arg1;
- (_Bool)_navigationBarShouldUpdateProgress;
@property(nonatomic, getter=isNavigationBarHidden) _Bool navigationBarHidden;
//- (void)setNavigationBar:(id)arg1;
- (id)_backdropBarGroupName;
- (id)_navigationBarHiddenByDefault:(_Bool)arg1;
//@property(readonly, nonatomic) UINavigationBar *navigationBar;
- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)arg1;
- (void)setNavigationBarClass:(Class)arg1;
- (Class)navigationBarClass;
- (void)_updateSearchPaletteSettingsForTopViewController:(id)arg1;
- (_Bool)_shouldHideSearchBarWhenScrollingForNavigationItem:(id)arg1;
- (void)_createAndAttachSearchPaletteForTopViewControllerIfNecessary:(id)arg1;
- (id)_navControllerToCreateManagedSearchPaletteForNavController:(id)arg1;
- (void)_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary:(id)arg1;
- (void)_loadTopSearchPaletteForDeferredTransitionIfNecessaryForTransitionToViewController:(id)arg1;
- (id)_viewControllerForSearchPalette;
- (void)_startCustomTransition:(id)arg1;
- (id)_keyboardAnimationStyle;
- (_Bool)_isViewControllerFullScene;
- (int)_keyboardDirectionForTransition:(long long)arg1;
- (void)_startToolbarTransitionIfNecessary:(id)arg1 animated:(_Bool)arg2;
- (id)_transitionCoordinator;
- (_Bool)_shouldCrossFadeBottomBars;
- (_Bool)_shouldCrossFadeNavigationBar;
- (double)durationForTransition:(int)arg1;
- (void)_cancelInteractiveTransition:(double)arg1 transitionContext:(id)arg2;
- (void)_finishInteractiveTransition:(double)arg1 transitionContext:(id)arg2;
- (void)_updateInteractiveTransition:(double)arg1;
- (void)_updateInteractiveBarTransition:(id)arg1 withUUID:(id)arg2 percent:(double)arg3 isFinished:(_Bool)arg4 didComplete:(_Bool)arg5 completionSpeed:(double)arg6 completionCurve:(long long)arg7;
- (void)_startInteractiveNavbarTransition;
- (void)_startInteractiveToolbarTransition;
- (id)_startInteractiveBarTransition:(id)arg1;
- (void)_finishAnimationTracking;
- (_Bool)_navbarIsAppearingInteractively;
- (_Bool)_toolbarIsAnimatingInteractively;
- (void)_setContentInset:(struct UIEdgeInsets)arg1;
- (void)_setClipsToBounds:(_Bool)arg1;
@property(readonly, nonatomic) VINavigationTransitionView *navigationTransitionView;
- (void)_setViewControllers_7_0:(id)arg1 transition:(int)arg2 animated:(_Bool)arg3;
- (void)_setViewControllers_7_0:(id)arg1 transition:(int)arg2 animated:(_Bool)arg3 operation:(long long)arg4;
- (void)_setViewControllers:(id)arg1 transition:(int)arg2;
- (void)_setViewControllers:(id)arg1 transition:(int)arg2 animated:(_Bool)arg3;
- (void)_setViewControllers:(id)arg1 transition:(int)arg2 animated:(_Bool)arg3 operation:(long long)arg4;
- (id)_navigationBarForNestedNavigationController;
- (id)_outermostNavigationController;
- (void)_updateInteractivePopGestureEnabledState;
- (id)_lastNavigationItems;
- (id)_navigationItemsCallingPublicAccessor:(_Bool)arg1;
- (id)_navigationItems;
- (id)navigationItem;
@property(nonatomic, getter=_allowChildSplitViewControllers, setter=_setAllowChildSplitViewControllers:) _Bool allowChildSplitViewControllers;
- (_Bool)_hasNestedNavigationController;
@property(nonatomic, getter=_isNestedNavigationController, setter=_setIsNestedNavigationController:) _Bool isNestedNavigationController;
@property(nonatomic, getter=_allowNestedNavigationControllers, setter=_setAllowNestedNavigationControllers:) _Bool allowNestedNavigationControllers;
- (void)setViewControllers:(id)arg1 animated:(_Bool)arg2;
- (int)_transitionForOldViewControllers:(id)arg1 newViewControllers:(id)arg2;
- (_Bool)_isPresentationContextByDefault;
@property(readonly, nonatomic) UIViewController *previousViewController;
- (long long)modalTransitionStyle;
@property(readonly, nonatomic) UIViewController *bottomViewController;
@property(readonly, nonatomic) UIViewController *topViewController;
- (_Bool)_usesTransitionController;
- (void)setEnableBackButtonDuringTransition:(_Bool)arg1;
- (_Bool)enableBackButtonDuringTransition;
- (void)setAllowUserInteractionDuringTransition:(_Bool)arg1;
- (_Bool)allowUserInteractionDuringTransition;
- (_Bool)_useStandardStatusBarHeight;
- (_Bool)_useCurrentStatusBarHeight;
- (void)_setUseStandardStatusBarHeight:(_Bool)arg1;
- (_Bool)_isAlreadyPoppingNavItem;
- (void)_setUseCurrentStatusBarHeight:(_Bool)arg1;
@property(nonatomic, getter=_didExplicitlyHideTabBar, setter=_setDidExplicitlyHideTabBar:) _Bool didHideTabBar;
@property(nonatomic, getter=_isCrossfadingInTabBar, setter=_setCrossfadingInTabBar:) _Bool crossfadingInTabBar;
@property(nonatomic, getter=_isCrossfadingOutTabBar, setter=_setCrossfadingOutTabBar:) _Bool crossfadingOutTabBar;
- (void)dealloc;
- (void)_releaseContainerViews;
- (void)encodeWithCoder:(id)arg1;
- (_Bool)_shouldPersistViewWhenCoding;
- (id)initWithCoder:(id)arg1;
- (id)initWithNibName:(id)arg1 bundle:(id)arg2;
- (void)_confirmBarAccessMethods;
- (id)initWithNavigationBarClass:(Class)arg1 toolbarClass:(Class)arg2;
- (id)initWithRootViewController:(id)arg1;
- (void)decodeRestorableStateWithCoder:(id)arg1;
- (void)encodeRestorableStateWithCoder:(id)arg1;
- (void)_startPaletteTransitionIfNecessary:(id)arg1 animated:(_Bool)arg2;
- (void)detachPalette:(id)arg1;
- (void)detachPalette:(id)arg1 isInPaletteTransition:(_Bool)arg2;
- (id)existingPaletteForEdge:(unsigned long long)arg1;
- (void)_detachPalette:(id)arg1;
- (void)attachPalette:(id)arg1 isPinned:(_Bool)arg2;
- (void)_installPaletteIntoViewHierarchy:(id)arg1;
- (id)_paletteForEdge:(unsigned long long)arg1 size:(struct CGSize)arg2 paletteClass:(Class)arg3;
- (id)_managedSearchPaletteForEdge:(unsigned long long)arg1 size:(struct CGSize)arg2;
- (id)paletteForEdge:(unsigned long long)arg1 size:(struct CGSize)arg2;
- (id)_pinningBarForPalette:(id)arg1;
- (struct CGRect)_boundsForPalette:(id)arg1 size:(struct CGSize)arg2;
- (struct CGRect)_frameForPalette:(id)arg1;
//- (id)_topPalette;
- (void)_updateControlledViewsToFrame:(struct CGRect)arg1;
- (void)_prepareCollectionViewControllers:(id)arg1 forSharingInRange:(id)arg2;
- (void)_prepareCollectionViewControllerForSharing:(id)arg1;
- (void)_prepareCollectionViewController:(id)arg1 forSharingWithCollectionViewController:(id)arg2;
- (id)_additionalViewControllersToCheckForUserActivity;
- (void)_stopTransitionsImmediately;
- (id)_navigationBarForDragAffordance;
@end
