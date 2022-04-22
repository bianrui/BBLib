//
//  BBSecondViewController.m
//  BBLib_Example
//
//  Created by creatbot on 2022/4/22.
//  Copyright © 2022 bianruifeng. All rights reserved.
//

#import "BBSecondViewController.h"

@interface BBSecondViewController ()

@end

@implementation BBSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
}
- (BOOL)bb_backGestureAction {
    NSLog(@"右滑手势返回");
    [self.navigationController popViewControllerAnimated:YES];
    return NO;
}

- (BOOL)bb_backBarButtonItemDidClickAction {
    NSLog(@"back返回按钮");
    [self.navigationController popViewControllerAnimated:YES];
    return NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
