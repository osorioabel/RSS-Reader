//
//  NewsDetailViewController.m
//  RSS
//
//  Created by Abel Osorio on 7/13/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import "NewsDetailViewController.h"
#import <MRProgress/MRProgress.h>


@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

@synthesize detailWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding:
                                          NSUTF8StringEncoding]];
    NSURLRequest* request = [NSURLRequest requestWithURL:myURL];
    UIWebView *webview=[[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,self.view.frame.size.width,self.view.frame.size.height)];
    webview.delegate = self;
    [webview loadRequest:request];
    [self.view addSubview:webview];

}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
  [MRProgressOverlayView showOverlayAddedTo:self.view title:@"Loading" mode:MRProgressOverlayViewModeIndeterminateSmallDefault animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
