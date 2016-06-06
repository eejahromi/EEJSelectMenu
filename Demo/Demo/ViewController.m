//
//  ViewController.m
//  Demo
//
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "EEJSelectMenu.h"

@interface ViewController () <EEJSelectMenuDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)threeButtons:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"ROCK",@"PAPER",@"SCISSORS"]
                                                 animationStyle:EEJAnimationStyleFadeIn
                                                          color:[UIColor colorWithRed:88/255.0 green:115/255.0 blue:160/255.0 alpha:1.0] andDelegate:self];
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)fourButtonWiden:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"COFFEE",@"TEA",@"WATER",@"SODA"]
                                                 animationStyle:EEJAnimationStyleWiden
                                                      andColors:@[[UIColor colorWithRed:11/255.0 green:94/255.0 blue:86/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:26/255.0 green:163/255.0 blue:163/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:134/255.0 green:190/255.0 blue:203/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:178/255.0 green:229/255.0 blue:229/255.0 alpha:1.0]]];
    menu.delegate = self;
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)fiveButtonScale:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"MERCURY",@"JUPITER",@"EARTH",@"MARS",@"VENUS"]
                                                 animationStyle:EEJAnimationStyleScale
                                                      andColors:@[[UIColor colorWithRed:46/255.0 green:55/255.0 blue:64/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:29/255.0 green:32/255.0 blue:37/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:76/255.0 green:83/255.0 blue:89/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:121/255.0 green:140/255.0 blue:138/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:122/255.0 green:135/255.0 blue:152/255.0 alpha:1.0]]];
    menu.delegate = self;
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)sixButtonFromLeft:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"COKE",@"SPRITE",@"FANTA",@"PEPSI",@"MOUNTAIN DEW",@"DR.PEPPER"]
                                                 animationStyle:EEJAnimationStyleMoveInFromLeft
                                                      andColors:@[[UIColor colorWithRed:90/255.0 green:24/255.0 blue:70/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:148/255.0 green:11/255.0 blue:63/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:199/255.0 green:0/255.0 blue:77/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:255/255.0 green:88/255.0 blue:52/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:255/255.0 green:195/255.0 blue:1/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:243/255.0 green:231/255.0 blue:83/255.0 alpha:1.0]]];
    menu.delegate = self;
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)sixButtonsFromRight:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"PIZZA",@"BURGER",@"SOUP",@"SALAD",@"STEAK",@"LOBSTER"]
                                                 animationStyle:EEJAnimationStyleMoveInFromRight
                                                          color:[UIColor colorWithRed:90/255.0 green:72/255.0 blue:85/255.0 alpha:1.0] andDelegate:self];
    [self presentViewController:menu animated:NO completion:nil];
}

- (IBAction)sixButtonsAlternate:(UIButton *)sender {
    EEJSelectMenu *menu = [[EEJSelectMenu alloc]initWithButtons:@[@"COKE",@"SPRITE",@"FANTA",@"PEPSI",@"MOUNTAIN DEW",@"DR.PEPPER"]
                                                 animationStyle:EEJAnimationStyleAlternate
                                                      andColors:@[[UIColor colorWithRed:82/255.0 green:85/255.0 blue:100/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:116/255.0 green:130/255.0 blue:143/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:150/255.0 green:192/255.0 blue:206/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:190/255.0 green:185/255.0 blue:181/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:194/255.0 green:81/255.0 blue:86/255.0 alpha:1.0],
                                                                  [UIColor colorWithRed:222/255.0 green:219/255.0 blue:167/255.0 alpha:1.0]]];
    menu.delegate = self;
    [self presentViewController:menu animated:NO completion:nil];
}

- (void)EEJSelectMenuButtonWasPressedWithTitle:(NSString *)title {
    self.label.text = title;
}

@end
