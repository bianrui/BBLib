//
//  UINavigationController+BackButtonHandler.m
//  BBLib
//
//  Created by creatbot on 2022/4/22.
//

#import "UINavigationController+BackButtonHandler.h"
#import "UIViewController+BackButtonHandler.h"
#import "BackButtonHandlerProtocol.h"
#import <objc/runtime.h>

@interface UINavigationController (BackButtonHandler)

@end

static NSString *const kOriginDelegate = @"kOriginDelegate";

@implementation UINavigationController (BackButtonHandler)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method originMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(new_viewDidLoad));
        method_setImplementation(originMethod,method_getImplementation(swizzledMethod));
        
        Method originalMethod = class_getInstanceMethod([self class], @selector(navigationBar:shouldPopItem:));
        Method overloadingMethod = class_getInstanceMethod([self class], @selector(overloaded_navigationBar:shouldPopItem:));
        method_setImplementation(originalMethod, method_getImplementation(overloadingMethod));
        
    });
}

- (void)new_viewDidLoad
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        objc_setAssociatedObject(self, [kOriginDelegate UTF8String], self.interactivePopGestureRecognizer.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
        
    }

}

#pragma mark - 按钮

- (BOOL)overloaded_navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(bb_backBarButtonItemDidClickAction)]) {
        shouldPop = [vc bb_backBarButtonItemDidClickAction];
    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *subview in [navigationBar subviews]) {
            if(0. < subview.alpha && subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    
    return NO;
}

#pragma mark - UIGestureRecognizerDelegate代理方法
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    //手势返回的时候会调用这个方法
    
    // 当为根控制器时，手势不执行。
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    // 设置一个页面是否显示此手势，默认为NO 显示。
    UIViewController *topViewController = self.viewControllers.lastObject;
    if (topViewController.bb_interactivePopDisabled) {
        return NO;
    }
    //  手势滑动距左边框的距离超过maxAllowedInitialDistance 手势不执行。
    CGPoint beginningLocation = [gestureRecognizer locationInView:gestureRecognizer.view];
    CGFloat maxAllowedInitialDistance = topViewController.bb_interactiveDistanceToLeftEdge;
    if (maxAllowedInitialDistance > 0 && beginningLocation.x > maxAllowedInitialDistance) {
        return NO;
    }
    // 当push、pop动画正在执行时，手势不执行。
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    //  向左边(反方向)拖动，手势不执行。
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x < 0) {
        return NO;
    }
    
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if([self.topViewController respondsToSelector:@selector(bb_backGestureAction)]) {
            return [self.topViewController bb_backGestureAction];
        }
    }
    return YES;
}
@end
