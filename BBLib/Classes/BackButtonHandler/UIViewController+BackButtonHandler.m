//
//  UIViewController+BackButtonHandler.m
//  BBLib
//
//  Created by creatbot on 2022/4/22.
//

#import "UIViewController+BackButtonHandler.h"
#import <objc/runtime.h>

@interface UIViewController (BackButtonHandler)

@end

@implementation UIViewController (BackButtonHandler)

static char key1;
- (void)setBb_interactivePopDisabled:(BOOL)hzs_interactivePopDisabled {
    NSNumber *number = [NSNumber numberWithBool:hzs_interactivePopDisabled];
    objc_setAssociatedObject(self, &key1, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)bb_interactivePopDisabled {
    NSNumber *number = objc_getAssociatedObject(self, &key1);
    return [number boolValue];
}


static char key2;
- (void)setBb_interactiveDistanceToLeftEdge:(CGFloat)hzs_interactiveDistanceToLeftEdge {
    NSNumber *number = [NSNumber numberWithFloat:hzs_interactiveDistanceToLeftEdge];
    objc_setAssociatedObject(self, &key2, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)bb_interactiveDistanceToLeftEdge {
    NSNumber *number = objc_getAssociatedObject(self, &key2);
    return [number floatValue];
}


@end
