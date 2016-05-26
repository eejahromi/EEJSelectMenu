//
//  ViewController.m
//  Example
//
//  Created by Ehsan on 5/25/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "EEJSelectMenu.h"

@interface ViewController () <EJSelectMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)threeButtonsFadePressed:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"ROCK",@"PAPER",@"SCISSORS"]
                                                 animationStyle:EJAnimationStyleFadeIn
                                                    andDelegate:self];
    [self presentViewController:menu animated:NO completion:nil];
}

#pragma mark - EJSelectMenuDelegate

- (void)EJSelectMenuButtonWasPressedWithTitle:(NSString *)title {
    
}

@end
