//
//  EEJSelectMenu.m
//  EEJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "EEJSelectMenu.h"

@interface EEJSelectMenu () <EJMenuItemDelegate>
@property (strong,nonatomic) EEJMenuItem *item;
@property (strong,nonatomic) NSMutableArray *buttons;
@property (assign,nonatomic) long numberOfButtons;
@end

@implementation EEJSelectMenu {
    BOOL even;
}

- (instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style andDelegate:(id<EJSelectMenuDelegate>)delegate {
    self = [super init];
    if (self) {
        self.buttonNames = buttons;
        self.animationStyle = style;
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMenuItems];
}

- (void)setupMenuItems {
    
    [self setBackgroundColor:self.menuBackgroundColor];
    self.buttons = [NSMutableArray array];
    self.numberOfButtons = self.buttonNames.count;
    
    CGFloat heightBasedOnNumberOfButtons = ((self.view.bounds.size.height - 20) / self.numberOfButtons) - 1.0;
    
    for (int i=0; i<self.numberOfButtons; i++) {
        self.item = [[EEJMenuItem alloc]
                     initWithFrame:CGRectMake(1, 20 + (i * heightBasedOnNumberOfButtons) + i, self.view.bounds.size.width - 2, heightBasedOnNumberOfButtons)];
        self.item.title = self.buttonNames[i];

        self.item.backgroundColor = [UIColor colorWithRed:88/255.0 green:115/255.0 blue:160/255.0 alpha:1.0];
        self.item.selectedStateColor = self.selectedButtonColor;
        self.item.tag = 100 + i;
        self.item.delegate = self;
        
        
        [self.buttons addObject:self.item];
        [self.view addSubview:self.item];
    }
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    __block float delay = 0.0;
    NSEnumerationOptions enumOption = 0;
    
    switch (self.animationStyle) {
    
        case EJAnimationStyleFadeIn:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                EEJMenuItem *menu = (EEJMenuItem *)obj;
                [self performSelector:@selector(fadeInAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            
            break;
        case EJAnimationStyleWiden:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                EEJMenuItem *menu = (EEJMenuItem *)obj;
                [self performSelector:@selector(widenAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
        
        case EJAnimationStyleScale:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                EEJMenuItem *menu = (EEJMenuItem *)obj;
                [self performSelector:@selector(scaleAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        case EJAnimationStyleMoveInFromLeft:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                EEJMenuItem *menu = (EEJMenuItem *)obj;
                [self performSelector:@selector(moveInFromLeftAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        case EJAnimationStyleMoveInFromRight:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                EEJMenuItem *menu = (EEJMenuItem *)obj;
                [self performSelector:@selector(moveInFromRightAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        case EJAnimationStyleAlternate:{
            [self.buttons enumerateObjectsWithOptions:enumOption usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                EEJMenuItem *menu = (EEJMenuItem *)obj;
                [self performSelector:@selector(alternateAnimation:) withObject:menu afterDelay:delay];
                delay += 0.1;
            }];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Animations

- (void)fadeInAnimation:(EEJMenuItem *)item {
    [UIView animateWithDuration:0.3 animations:^{
        item.alpha = 1.0;
    }];
}

- (void)widenAnimation:(EEJMenuItem *)item {
    // Grow from middle animation
    item.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:0.3 animations:^{
        item.transform = CGAffineTransformMakeScale(1.0, 1.0);
        item.alpha = 1.0;
    }];
}

- (void)scaleAnimation:(EEJMenuItem *)item {
    // zoom out from middle animation
    item.transform = CGAffineTransformMakeScale(5.0, 5.0);
    [UIView animateWithDuration:0.3 animations:^{
        item.transform = CGAffineTransformMakeScale(1.0, 1.0);
        item.alpha = 1.0;
    }];
}

- (void)moveInFromLeftAnimation:(EEJMenuItem *)item {
    // animate in from sides
    item.frame = CGRectMake(-self.view.bounds.size.width, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
        item.alpha = 1.0;
    }];
}

- (void)moveInFromRightAnimation:(EEJMenuItem *)item {
    // animate in from sides
    item.frame = CGRectMake(self.view.bounds.size.width, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height); //for sides
        item.alpha = 1.0;
    }];
}

- (void)alternateAnimation:(EEJMenuItem *)item {
    CGFloat xPosition;
    if (even) {
        even = !even;
        xPosition = -self.view.bounds.size.width;
    }else {
        even = !even;
        xPosition = self.view.bounds.size.width;
    }
    
    // animate in from sides
    item.frame = CGRectMake(xPosition, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        item.frame = CGRectMake(1.0, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
        item.alpha = 1.0;
    }];
}

#pragma mark - Colors

- (void)setColor:(UIColor *)color {

    [self setBackgroundColor:color];
}

- (void)setBackgroundColor:(UIColor *)color {
    
    self.view.backgroundColor = color ? color : [UIColor whiteColor];
}

- (void)setMenuItemColor:(UIColor *)menuItemColor {

    [self setItemColor:menuItemColor];
}

-(void)setItemColor:(UIColor *)color{
    
    self.item.backgroundColor = color ? color : [UIColor orangeColor];
}

#pragma mark - item delegation and animation

- (void)EJMenuItemWasPressedWithButton:(EEJMenuItem *)button andTitle:(NSString *)title {
    [self selectedAnimation:button];
    
    if (self.delegate) {
        if([self.delegate respondsToSelector:@selector(EJSelectMenuButtonWasPressedWithTitle:)]) {
            [self.delegate EJSelectMenuButtonWasPressedWithTitle:title];
        }
        
        if([self.delegate respondsToSelector:@selector(EJSelectMenuButtonWasPressedWithTag:)]) {
            [self.delegate EJSelectMenuButtonWasPressedWithTag:button.tag];
        }
    }
}

- (void)selectedAnimation:(EEJMenuItem *)button {
    
    for (EEJMenuItem *btn in self.buttons) {
        if (btn.tag == button.tag){
            continue;
        }
        [UIView animateWithDuration:0.3 animations:^{
            btn.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:nil];
        }];
    }
    
}

#pragma mark - Display configurations
- (BOOL)shouldAutorotate {
    return NO;
}

@end

