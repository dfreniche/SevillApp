//
//  PointOfInterestDetailViewController.h
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PointOfInterest.h"
#import "FGalleryViewController.h"

@interface PointOfInterestDetailViewController : UIViewController <FGalleryViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImage;
@property (weak, nonatomic) IBOutlet UITextView *shortDescription;
@property (weak, nonatomic) IBOutlet UITextView *fullDescription;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonUrl;

@property (weak, nonatomic) PointOfInterest *poi;


- (IBAction)openUrlOfPoi:(id)sender;
- (IBAction)showPhotos:(id)sender;

@end
