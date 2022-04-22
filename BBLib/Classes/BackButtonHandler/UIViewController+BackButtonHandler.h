//
//  UIViewController+BackButtonHandler.h
//  BBLib
//
//  Created by creatbot on 2022/4/22.
//

#import <UIKit/UIKit.h>
#import "BackButtonHandlerProtocol.h"

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>
//是否禁用手势
@property (nonatomic, assign) BOOL bb_interactivePopDisabled;
//手势返回的最大交互距离，默认全屏
@property (nonatomic, assign) CGFloat bb_interactiveDistanceToLeftEdge;
@end

