//
//  PointOfInterestDetailViewController.h
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointOfInterestDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImage;
@property (weak, nonatomic) IBOutlet UITextView *shortDescription;
@property (weak, nonatomic) IBOutlet UITextView *fullDescription;

@end
