//
//  EEJMenuItem.h
//  EEJSelectMenuExample
//
//  Created by Ehsan Jahromi
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EEJMenuItem;

@protocol EJMenuItemDelegate <NSObject>

@optional
- (void)EJMenuItemWasPressedWithButton:(EEJMenuItem *)button andTitle:(NSString *)title;
- (void)EJMenuItemWasPressedWithTag:(long)tag;

@end
@interface EEJMenuItem : UIView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIImage *backgroundImage;
@property (nonatomic,strong) UIColor *selectedStateColor;

@property (nonatomic,assign) id<EJMenuItemDelegate> delegate;

@end
