//
//  EEJSelectMenu.h
//  EEJSelectMenuExample
//
//  Created by Ehsan Jahromi
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EEJMenuItem.h"

/**
 *  @class EEJSelectMenu
 *  @brief The EEJSelectMenu class
 *  @discussion The EEJSelectMenu represents the collection of menu items that make the menu
 *  @superclass SuperClass: UIViewController
 */

typedef NS_OPTIONS(NSUInteger,AnimationStyle) {
    EEJAnimationStyleFadeIn = 0,
    EEJAnimationStyleWiden,
    EEJAnimationStyleScale,
    EEJAnimationStyleMoveInFromLeft,
    EEJAnimationStyleMoveInFromRight,
    EEJAnimationStyleAlternate
};

/**
 *  @protocol EEJSelectMenuDelegate
 *  @brief Contains methods that notify delegate that menu item was press
 *
 */
@protocol EEJSelectMenuDelegate <NSObject>

@optional

/**
 *  @brief Tells the delegate that the menu item was selected with button and title
 *  @param button The menu item object that was pressed
 *  @param title The title of the menu item that was pressed
 */
- (void)EEJSelectMenuButtonWasPressedWithTitle:(NSString *)title;

/**
 *  @brief Tells the delegate that the menu item was selected with tag
 *  @param tag The tag associated with the menu item that was pressed
 *  @discussion The tag starts at 100 and increments by one for each additional menu item
 */
- (void)EEJSelectMenuButtonWasPressedWithTag:(long)tag;

@end

@interface EEJSelectMenu : UIViewController

/**
 *  Initializes an instance of the menu with a single color for the entire menu
 *  @param buttons The array containing buttons names
 *  @param style The animation style to represent the menu buttons
 *  @param color A color of type UIColor for button background colors
 *  @param delegate The menu delegate that receives notification of the item pressed
 */
- (instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style color:(UIColor *)color andDelegate:(id<EEJSelectMenuDelegate>)delegate;

/**
 *  Initializes an instance of the menu with multiple colors for the menu
 *  @param buttons The array containing buttons names
 *  @param style The animation style to represent the menu buttons
 *  @param colors An array containing UIColor elements for menu button backgrounds in the order in which they appear
 */
- (instancetype)initWithButtons:(NSArray *)buttons animationStyle:(AnimationStyle)style andColors:(NSArray<UIColor *> *)colors;

/**
 *  The color of view that contains the menu items
 *  @note Default color is white
 */
@property (nonatomic,strong) UIColor *menuBackgroundColor;

/**
 *  The color of the selected button after it's been pressed
 */
@property (nonatomic,strong) UIColor *selectedButtonColor;

/**
 *  The array that contains the names for menu items
 */
@property (nonatomic,strong) NSArray *buttonNames;

/**
 *  The animation style in which menu items are represented
 */
@property (nonatomic) enum AnimationStyle animationStyle;

/**
 *  The menu delegate, receives notification of the item pressed
 */
@property (nonatomic,assign) id<EEJSelectMenuDelegate> delegate;



@end
