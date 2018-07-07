//
//  DISNavigationControllerCommons.h
//  DIS_NAVIGATION_CONTROLLER_8_3
//
//  Created by renjinkui on 2018/7/3.
//  Copyright © 2018年 renjinkui. All rights reserved.
//

#ifndef DISNavigationControllerCommons_h
#define DISNavigationControllerCommons_h
#import <objc/runtime.h>

extern UIApplication *UIApp;
extern BOOL _UIApplicationUsesLegacyUI(void);

extern uint32_t _UIApplicationLinkedOnVersion;
BOOL __UIApplicationLinkedOnOrAfter(uint32_t version);

static inline BOOL _UIApplicationLinkedOnVersionCheck(uint32_t version) {
    if (_UIApplicationLinkedOnVersion == 0) {
        return __UIApplicationLinkedOnOrAfter(version);
    }
    else {
        return _UIApplicationLinkedOnVersion >= version;
    }
}


#define ADDRESS_OF_INSTANCE_IVAR(ivar) \
((void *)\
    (\
        ((unsigned char *)self) +\
        ivar_getOffset((class_getInstanceVariable(self.class, #ivar)))\
    )\
)

#define GET_INSTANCE_IVAR(type,ivar) (*((type *)ADDRESS_OF_INSTANCE_IVAR(ivar)))

#define SET_INSTANCE_IVAR(type,ivar,value) (*((type *)ADDRESS_OF_INSTANCE_IVAR(ivar)) = (value))

#endif /* DISNavigationControllerCommons_h */
