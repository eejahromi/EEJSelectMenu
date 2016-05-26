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
@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)threeButtonsFadePressed:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"ROCK",@"PAPER",@"SCISSORS"]
                                                 animationStyle:EJAnimationStyleFadeIn
                                                    andDelegate:self];
    menu.selectedButtonColor = [UIColor grayColor];
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)fourButtonsLeftPressed:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]init];
    menu.buttonNames = @[@"COFFEE",@"TEA",@"WATER",@"SODA"];
    menu.animationStyle = EJAnimationStyleMoveInFromLeft;
    menu.delegate = self;
    menu.selectedButtonColor = [UIColor orangeColor];
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)fiveButtonsRightPressed:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"MERCURY",@"JUPITER",@"EARTH",@"MARS",@"VENUS"]
                                                 animationStyle:EJAnimationStyleMoveInFromRight
                                                    andDelegate:self];
    menu.selectedButtonColor = [UIColor lightGrayColor];
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)fiveButtonsWidenPressed:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"LEBRON",@"KOBE",@"K.D",@"STEPH",@"RUSSELL"]
                                                 animationStyle:EJAnimationStyleWiden
                                                    andDelegate:self];
    menu.selectedButtonColor = [UIColor grayColor];
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)sixButtonScalePressed:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]init];
    menu.buttonNames = @[@"COKE",@"SPRITE",@"FANTA",@"PEPSI",@"MOUNTAIN DEW",@"DR.PEPPER"];
    menu.animationStyle = EJAnimationStyleScale;
    menu.delegate = self;
    menu.selectedButtonColor = [UIColor yellowColor];
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)sixButtonsAlternatePressed:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]init];
    menu.buttonNames = @[@"PIZZA",@"BURGER",@"SOUP",@"SALAD",@"STEAK",@"LOBSTER"];
    menu.animationStyle = EJAnimationStyleAlternate;
    menu.delegate = self;
    menu.selectedButtonColor = [UIColor blackColor];
    [self presentViewController:menu animated:NO completion:nil];
}

#pragma mark - EJSelectMenuDelegate

- (void)EJSelectMenuButtonWasPressedWithTitle:(NSString *)title {
    self.buttonLabel.text = title;
}

@end
