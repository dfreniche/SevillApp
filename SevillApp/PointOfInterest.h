//
//  PointOfInterest.h
//  SevillApp
//
//  Created by Diego Freniche Brito on 27/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPOI_DEFAULT_LATITUDE 37.386303
#define kPOI_DEFAULT_LONGITUDE -5.992396
#define kPOI_DEFAULT_NAME @"POI"

@interface PointOfInterest : NSObject
// id, name, shortDescription, description, photos[], videos[], latitude, longitude, address, tags[], pinIcon, thumbImage, url

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSMutableArray *videos;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSMutableArray *tags;
@property (nonatomic, strong) NSString *pinIconName;
@property (nonatomic, strong) NSString *thumbImageName;
@property (nonatomic, strong) NSString *url;

- (id)initWithId:(NSNumber *)id name:(NSString *)name shortDescription:(NSString *)shortDescription latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;

@end
