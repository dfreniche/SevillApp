//
//  PointOfInterest.h
//  SevillApp
//
//  Created by Diego Freniche Brito on 27/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PointOfInterest : NSObject
// id, name, shortDescription, description, photos[], videos[], latitude, longitude, address, tags[], pinIcon, thumbImage, url

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *videos;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *pinIcon;
@property (nonatomic, strong) NSString *thumbImage;
@property (nonatomic, strong) NSString *url;

- (id)initWithId:(NSNumber *)id name:(NSString *)name shortDescription:(NSString *)shortDescription latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;

@end
