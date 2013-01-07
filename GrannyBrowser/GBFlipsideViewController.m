//
//  GBFlipsideViewController.m
//  GrannyBrowser
//
//  Created by Gem Barrett on 23/02/2012.
//  Copyright (c) 2012 Gem Designs. All rights reserved.
//

#import "GBFlipsideViewController.h"

@interface GBFlipsideViewController ()

@end

@implementation GBFlipsideViewController

@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
