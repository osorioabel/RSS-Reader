//
//  NewsDetailViewController.h
//  RSS
//
//  Created by Abel Osorio on 7/13/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIWebView+AFNetworking.h>

@interface NewsDetailViewController : UIViewController<UIWebViewDelegate>{
    IBOutlet UIWebView *detailWebView;
}

@property (copy, nonatomic) NSString *url;
@property (retain,nonatomic ) IBOutlet UIWebView *detailWebView;



@end
