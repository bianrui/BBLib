//
//  BackButtonHandlerProtocol.h
//  BBLib
//
//  Created by creatbot on 2022/4/22.
//

#ifndef BackButtonHandlerProtocol_h
#define BackButtonHandlerProtocol_h

@protocol BackButtonHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
- (BOOL)bb_backGestureAction;

- (BOOL)bb_backBarButtonItemDidClickAction;
@end

#endif /* BackButtonHandlerProtocol_h */
