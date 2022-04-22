//
//  BBViewController.m
//  BBLib
//
//  Created by bianruifeng on 04/22/2022.
//  Copyright (c) 2022 bianruifeng. All rights reserved.
//

#import "BBViewController.h"
#import "BBSecondViewController.h"
@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.orangeColor;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:[BBSecondViewController new] animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
