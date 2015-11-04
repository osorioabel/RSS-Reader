//
//  AppDelegate.h
//  RSS
//
//  Created by Abel Osorio on 7/13/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NewsTableViewController *newsVC;
@property (strong, nonatomic) UINavigationController *navVC;



@end

