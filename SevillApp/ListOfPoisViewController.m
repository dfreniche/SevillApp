//
//  ListOfPoisViewController.m
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "ListOfPoisViewController.h"
#import "Route.h"
#import "PoiCell.h"
#import "Seville.h"

@interface ListOfPoisViewController ()
@property (nonatomic, weak) Route *listOfPois;
@end

@implementation ListOfPoisViewController

#pragma mark - lazy getters



#pragma mark - init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.listOfPois = [Seville listOfPois];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listOfPois count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PointOfInterest *poi = [[self.listOfPois pois] objectAtIndex:indexPath.row];
    
    PoiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PoiCellIdentifier" forIndexPath:indexPath];
    cell.title.text = [poi name];
    cell.image.image = [UIImage imageNamed:[poi thumbImageName]];
    return cell;
}

@end
