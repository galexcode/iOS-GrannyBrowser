//
//  GBMainViewController.m
//  GrannyBrowser
//
//  Created by Gem Barrett on 23/02/2012.
//  Copyright (c) 2012 Gem Designs. All rights reserved.
//

#import "GBMainViewController.h"

@interface GBMainViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong)NSArray *sites;

- (void)displayHomeMessage;
- (void)displaySiteAtRow:(NSInteger)row;


@end

@implementation GBMainViewController

//create _sites variable to store row titles
@synthesize webView = _webView;
@synthesize pickerView = _pickerView;
@synthesize sites = _sites;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //list titles of rows on picker
    self.sites = [NSArray arrayWithObjects:
                  @"Home", @"",
                  @"Blog", @"http://gembarrett.com",
                  @"Twitter", @"http://twitter.com/gembarrett",
                  @"Search", @"http://google.com",
                  @"News", @"http://google.com/news",
                nil];    
    //load the persisted state and display the corresponding site
    NSInteger lastSelectedRow = [[NSUserDefaults standardUserDefaults] integerForKey:@"lastSelectedRow"];
    //call helper method to display the correct site
    [self displaySiteAtRow:lastSelectedRow];
    //load previous picker choice
    [self.pickerView selectRow:lastSelectedRow inComponent:0 animated:NO];
    
}



- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setPickerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.sites = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(GBFlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    //respond to tap on info button
    GBFlipsideViewController *controller = [[GBFlipsideViewController alloc] initWithNibName:@"GBFlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

#pragma mark - UIPickerViewDataSource methods

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //return number of titles in sites array, divide by two to ignore urls
    return [self.sites count]/2;
}

#pragma mark UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
    //get titles for picker rows from sites array
    NSString *title = [self.sites objectAtIndex:row*2];
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //persist the selected row
    [[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"lastSelectedRow"];
    //persist it every time
    [[NSUserDefaults standardUserDefaults] synchronize];
    //and display it
    [self displaySiteAtRow:row];
 }

#pragma mark - UIWebViewDelegate methods
- (void)webViewDidStartLoad:(UIWebView *)webView 
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView 
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error 
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - Private methods
- (void)displayHomeMessage
{
    // display the home message
    NSString *homeMessage = @"<h1>Hi Granny!</h1><p>Please select a site from the selection below to view it.</p>";
    [self.webView loadHTMLString:homeMessage baseURL:nil];

}

- (void)displaySiteAtRow:(NSInteger)row
{
    //for the first row, display the home message
    if (row == 0) {
        [self displayHomeMessage];
        return;
    }
    //for all other rows, load the corresponding URL
    NSString *urlString = [self.sites objectAtIndex:row*2+1];
    //load urls as strings
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

@end
