//
//  NewsTableViewController.h
//  RSS
//
//  Created by Abel Osorio on 7/13/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Articule.h"
#import "NewsDetailViewController.h"
#import "CustomNewsTableViewCell.h"

@interface NewsTableViewController : UITableViewController<NSXMLParserDelegate>{
    
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSMutableString *pubDate;
    NSMutableString *guid;
    NSMutableString *detail;
    NSString *element;
}


@end
