//
//  EEJMenuItem.m
//  EEJSelectMenuExample
//
//  Created by Ehsan Jahromi
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "EEJMenuItem.h"

@implementation EEJMenuItem {
    UIButton *button;
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self defaultInit:frame];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self defaultInit:CGRectZero];
    }
    return self;
}

- (void)defaultInit:(CGRect)frame {
    self.alpha = 0.0;
    [self setButtonTitle:self.title];
    button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.userInteractionEnabled = YES;
    [self addSubview:button];
}


- (void)setTitle:(NSString *)title {
    [self setButtonTitle:title];
}


- (void)setButtonTitle:(NSString *)title {
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }else{
        [button setTitle:@"Button" forState:UIControlStateNormal];
    }
    
}

- (void)buttonPressed:(UIButton *)buttonItem {

    buttonItem.backgroundColor = self.selectedStateColor ? self.selectedStateColor : [UIColor purpleColor];
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(EJMenuItemWasPressedWithButton:andTitle:)]) {
            [self.delegate EJMenuItemWasPressedWithButton:self andTitle:buttonItem.titleLabel.text];
        }
        

    }
}

@end

