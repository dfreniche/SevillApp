//
//  PointOfInterest.m
//  SevillApp
//
//  Created by Diego Freniche Brito on 27/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "PointOfInterest.h"

@implementation PointOfInterest

- (id)init {
    return [self initWithId:[NSNumber numberWithInt:1] name:kPOI_DEFAULT_NAME shortDescription:@"" latitude:[NSNumber numberWithFloat:37.386303] longitude:[NSNumber numberWithFloat:-5.992396]];
}

// designated initializer

- (id)initWithId:(NSNumber *)id name:(NSString *)name shortDescription:(NSString *)shortDescription latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude {
    if (self = [super init]) {
        _id = id;
        _name = name;
        _shortDescription = shortDescription;
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}


@end
