//
//  MapViewController.m
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "MapViewController.h"
#import "DisplayMap.h"
#import "Seville.h"

@interface MapViewController ()
@property (nonatomic, weak) Route *listOfPois;
@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)centerMap:(id)sender {
    [self centerMapInOrigin];
}

- (void)centerMapInOrigin {
    CLLocationCoordinate2D seville;
    seville.latitude = 37.386303;
    seville.longitude = -5.992396;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(seville, 2000.0, 2000.0);
    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:viewRegion];
    
    [self.map setRegion:adjustedRegion animated:YES];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self centerMapInOrigin];
    self.listOfPois = [Seville listOfPois];
    
    
    for (PointOfInterest *poi in [self.listOfPois pois] ) {
        DisplayMap *ann = [[DisplayMap alloc] init];
        ann.title = poi.name;
        ann.subtitle = poi.shortDescription;
        CLLocationCoordinate2D coord;
        coord.latitude = [poi.latitude floatValue];
        coord.longitude = [poi.longitude floatValue];
        
        ann.coordinate = coord;
        [self.map addAnnotation:ann];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	    
    
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = nil;
    if (annotation != self.map.userLocation)
    {
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKPinAnnotationView *)[self.map dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                          initWithAnnotation:annotation reuseIdentifier:defaultPinID] ;
        pinView.pinColor = MKPinAnnotationColorGreen;
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
    }
    else {
        [self.map.userLocation setTitle:@"I am here"];
    }
    return pinView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
