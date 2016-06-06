//
//  EEJSelectMenu.h
//  EEJSelectMenuExample
//
//  Created by Ehsan Jahromi
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EEJMenuItem.h"

typedef NS_OPTIONS(NSUInteger,AnimationStyle) {
    EEJAnimationStyleFadeIn = 0,
    EEJAnimationStyleWiden,
    EEJAnimationStyleScale,
    EEJAnimationStyleMoveInFromLeft,
    EEJAnimationStyleMoveInFromRight,
    EEJAnimationStyleAlternate
};

@protocol EEJSelectMenuDelegate <NSObject>

@optional
- (void)EEJSelectMenuButtonWasPressedWithTitle:(NSString *)title;
- (void)EEJSelectMenuButtonWasPressedWithTag:(long)tag;

@end

@interface EEJSelectMenu : UIViewController

- (instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style color:(UIColor *)color andDelegate:(id<EEJSelectMenuDelegate>)delegate;

- (instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style andColors:(NSArray<UIColor *> *)colors;

@property (nonatomic,strong) UIColor *menuBackgroundColor;
@property (nonatomic,strong) UIColor *selectedButtonColor;
@property (nonatomic,strong) NSArray *buttonNames;

@property (nonatomic) enum AnimationStyle animationStyle;

@property (nonatomic,assign) id<EEJSelectMenuDelegate> delegate;



@end
