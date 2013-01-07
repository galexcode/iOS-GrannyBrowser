//
//  GBMainViewController.h
//  GrannyBrowser
//
//  Created by Gem Barrett on 23/02/2012.
//  Copyright (c) 2012 Gem Designs. All rights reserved.
//

#import "GBFlipsideViewController.h"
//<we have signed up to the contracts inside these brackets>
@interface GBMainViewController : UIViewController <GBFlipsideViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIWebViewDelegate>

- (IBAction)showInfo:(id)sender;

@end
