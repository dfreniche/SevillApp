//
//  ListOfPoisViewController.h
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListOfPoisViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;

- (IBAction)loadJsonFromServer:(id)sender;

@end
