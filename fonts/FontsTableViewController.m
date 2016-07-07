//
//  FontsTableViewController.m
//  fonts
//
//  Created by 李传格 on 16/5/22.
//  Copyright © 2016年 lichuange. All rights reserved.
//

#import "FontsTableViewController.h"

@interface FontsTableViewController ()

@property (nonatomic, strong) NSArray *fonts;

@end

@implementation FontsTableViewController

- (NSArray *)fonts {
    if (!_fonts) {
        
        NSMutableArray *fonts = [[NSMutableArray alloc] init];
        NSArray *familyNames = [UIFont familyNames];
        for (NSString *familyName in familyNames) {
            NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
            for (NSString *fontName in fontNames) {
                [fonts addObject:fontName];
            }
        }
        [fonts sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
            return [obj1 compare:obj2];
        }];
        
        _fonts = fonts;
    }
    
    return _fonts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.tableView.rowHeight = 80;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fonts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *fontName = self.fonts[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [NSString stringWithFormat:@"系统字体测试，当前字体为%@", fontName];
    cell.textLabel.font = [UIFont fontWithName:fontName size:18];
    
    return cell;
}

@end
