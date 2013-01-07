//
//  GBAppDelegate.h
//  GrannyBrowser
//
//  Created by Gem Barrett on 23/02/2012.
//  Copyright (c) 2012 Gem Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBMainViewController;

@interface GBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GBMainViewController *mainViewController;

@end
