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
    EJAnimationStyleFadeIn = 0,
    EJAnimationStyleWiden,
    EJAnimationStyleScale,
    EJAnimationStyleMoveInFromLeft,
    EJAnimationStyleMoveInFromRight,
    EJAnimationStyleAlternate
};

@protocol EJSelectMenuDelegate <NSObject>

@optional
-(void)EJSelectMenuButtonWasPressedWithTitle:(NSString *)title;
-(void)EJSelectMenuButtonWasPressedWithTag:(long)tag;

@end

@interface EEJSelectMenu : UIViewController

-(instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style andDelegate:(id<EJSelectMenuDelegate>)delegate;

@property (nonatomic,strong) UIColor *menuBackgroundColor;
@property (nonatomic,strong) UIColor *selectedButtonColor;
@property (nonatomic,strong) NSArray *buttonNames;

@property (nonatomic) enum AnimationStyle animationStyle;

@property (nonatomic,assign) id<EJSelectMenuDelegate> delegate;



@end
