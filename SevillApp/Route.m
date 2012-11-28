//
//  Route.m
//  SevillApp
//
//  Created by Diego Freniche Brito on 27/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "Route.h"

@implementation Route

- (id) initWithId:(NSNumber *)identifier andName:(NSString *)name description:(NSString *)description {
    if (self = [super init]) {
        _identifier = identifier;
        _name = name;
        _description = description;
    }
    return self;
}

#pragma mark - lazy getters


- (void) loadLocalRoutesFromFileName:(NSString *)plistFileName {
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray *tempPois = [[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary *d in array) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterNoStyle];
        NSNumber *lat = [f numberFromString:(NSString *)[d objectForKey:@"latitude"]];
        NSNumber *longit = [f numberFromString:(NSString *)[d objectForKey:@"longitude"]];
        NSArray *photos = [d objectForKey:@"photos"];
        
        PointOfInterest *p = [[PointOfInterest alloc] initWithId:[d objectForKey:@"id"]
                                                            name:[d objectForKey:@"name"]
                                                shortDescription:[d objectForKey:@"shortDescription"]
                                                        latitude:lat
                                                       longitude:longit];
        [p setPhotos:[NSMutableArray arrayWithArray:photos]];
        [tempPois addObject:p];
    }
    
    [self setPois:[NSArray arrayWithArray:tempPois]];
}

@end
