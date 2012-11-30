//
//  PointOfInterestDetailViewController.m
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "PointOfInterestDetailViewController.h"

@interface PointOfInterestDetailViewController ()

@end

@implementation PointOfInterestDetailViewController

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
    [self.scrollView setContentSize:CGSizeMake(320, 367)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    // if we have POI set, refresh all data on screen
    if (self.poi) {
        self.title = self.poi.name;
        self.shortDescription.text = self.poi.shortDescription;
        self.fullDescription.text = self.poi.description;
        self.thumbImage.image = [UIImage imageNamed:self.poi.thumbImageName];
        self.addressLabel.text = self.poi.address;
        self.buttonUrl.titleLabel.text = self.poi.url;
    }
    [self.scrollView setContentOffset:CGPointZero];
}

- (IBAction)openUrlOfPoi:(id)sender {
}
@end
