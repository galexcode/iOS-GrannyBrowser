//
//  GBFlipsideViewController.h
//  GrannyBrowser
//
//  Created by Gem Barrett on 23/02/2012.
//  Copyright (c) 2012 Gem Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBFlipsideViewController;

//protocol declares method here
@protocol GBFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(GBFlipsideViewController *)controller;
@end

@interface GBFlipsideViewController : UIViewController

@property (weak, nonatomic) id <GBFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
