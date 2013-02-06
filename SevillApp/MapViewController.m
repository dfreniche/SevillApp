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
    seville.latitude = SEVILLE_LATITUDE;
    seville.longitude = SEVILLE_LONGITUDE;
    
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
        ann.poi = poi;
        [self.map addAnnotation:ann];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	    
    
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = nil;
    if (annotation != self.map.userLocation)
    {
        static NSString *defaultPinID = @"com.femtocoders.pin";
        pinView = (MKPinAnnotationView *)[self.map dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                          initWithAnnotation:annotation reuseIdentifier:defaultPinID] ;
        pinView.pinColor = MKPinAnnotationColorGreen;
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
        UIButton *goButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = goButton;
    }
    else {
        [self.map.userLocation setTitle:@"I am here"];
    }
    return pinView;
}


-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"pin tapped");
    DisplayMap *d = (DisplayMap *)view.annotation;
    NSLog(@"%@", d.poi.name);
    
    [self performSegueWithIdentifier:@"ShowDetailFromMapSegue" sender:d.poi];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowDetailFromMapSegue"]) {
        
        [[segue destinationViewController] setPoi:sender];
        
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"Pin touched");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
