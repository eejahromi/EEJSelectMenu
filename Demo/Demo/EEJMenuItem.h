//
//  EEJMenuItem.h
//  EEJSelectMenuExample
//
//  Created by Ehsan Jahromi
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @class EEJMenuItem
 *  @brief The EEJMenuItem class
 *  @discussion The EEJMenuItem represents each menu item (button) in the menu
 *  @superclass SuperClass: UIView
 */

@class EEJMenuItem;

/**
 *  @protocol EEJMenuItemDelegate
 *  @brief Contains methods that notify delegate of the item press
 *
 */
@protocol EEJMenuItemDelegate <NSObject>

@optional
/**
 *  @brief Tells the delegate that the menu item was selected with button and title
 *  @param button The menu item object that was pressed
 *  @param title The title of the menu item that was pressed
 */
- (void)EEJMenuItemWasPressedWithButton:(EEJMenuItem *)button andTitle:(NSString *)title;

/**
 *  @brief Tells the delegate that the menu item was selected with tag
 *  @param tag The tag associated with the menu item that was pressed
 *  @discussion The tag starts at 100 and increments by one for each additional menu item
 */
- (void)EEJMenuItemWasPressedWithTag:(long)tag;

@end
@interface EEJMenuItem : UIView

/**
 *  The title of the menu item
 */
@property (nonatomic,strong) NSString *title;

/**
 *  The background image of the menu item
 */
@property (nonatomic,strong) UIImage *backgroundImage;

/**
 *  The color of the selected state when the menu item is pressed
 */
@property (nonatomic,strong) UIColor *selectedStateColor;

/**
 *  The menu item delegate, receives notification of the item pressed
 */
@property (nonatomic,assign) id<EEJMenuItemDelegate> delegate;

@end
