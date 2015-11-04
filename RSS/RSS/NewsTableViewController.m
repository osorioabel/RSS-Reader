//
//  NewsTableViewController.m
//  RSS
//
//  Created by Abel Osorio on 7/13/15.
//  Copyright (c) 2015 osorioabel. All rights reserved.
//

#import "NewsTableViewController.h"


@interface NewsTableViewController ()

@property (nonatomic, strong) CustomNewsTableViewCell *customCell;

@end


@implementation NewsTableViewController

@synthesize customCell;

- (void)viewDidLoad {
    self.title=@"GAMERS RSS";
    [super viewDidLoad];
    feeds = [[NSMutableArray alloc] init];
    [self retrieveNews];
    
}

-(void) retrieveNews{
    
    
    [Articule getPlaystationRSS:^(id responseObject, NSError *error) {
        if (!error) {
            parser= (NSXMLParser*) responseObject;
            [parser setShouldProcessNamespaces:YES];
            [parser setDelegate:self];
            [parser setShouldResolveExternalEntities:NO];
            [parser parse];
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving News"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (CustomNewsTableViewCell *)customCell
{
    if (!customCell)
    {
        customCell = [self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    return customCell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feeds.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self configureCell:self.customCell forRowAtIndexPath:indexPath];
    
    self.customCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.customCell.bounds));
    
    [self.customCell layoutIfNeeded];
    
    CGSize size = [self.customCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[CustomNewsTableViewCell class]])
    {
        CustomNewsTableViewCell *newcell = (CustomNewsTableViewCell *)cell;
        newcell.LB_title.text = [feeds[indexPath.row] objectForKey: @"title"];
        newcell.LB_description.text = [feeds[indexPath.row] objectForKey: @"detail"];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomNewsTableViewCell*cell = (CustomNewsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
        cell= [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(CustomNewsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.LB_title.text = [feeds[indexPath.row] objectForKey: @"title"];
    cell.LB_description.text = [feeds[indexPath.row] objectForKey: @"detail"];
    
}

#pragma mark - RSS PARSER

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    feeds = [[NSMutableArray alloc] init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        pubDate   = [[NSMutableString alloc] init];
        guid    = [[NSMutableString alloc] init];
        detail    = [[NSMutableString alloc] init];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    } else if ([element isEqualToString:@"pubDate"]) {
        [pubDate appendString:string];
    }else if ([element isEqualToString:@"description"]) {
        [detail appendString:string];
    } else{
        [guid appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [item setObject:detail forKey:@"detail"];
        [item setObject:guid forKey:@"guid"];
        [feeds addObject:[item copy]];
        
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] initWithNibName:@"NewsDetailViewController" bundle:nil];
    detailViewController.title =[feeds[indexPath.row] objectForKey: @"title"];
    detailViewController.url=[feeds[indexPath.row] objectForKey: @"link"];
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
