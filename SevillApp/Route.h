//
//  Route.h
//  SevillApp
//
//  Created by Diego Freniche Brito on 27/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PointOfInterest.h"

@interface Route : NSObject

// id, name, description, POIs[]

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSArray *pois;

- (id) initWithId:(NSNumber *)identifier andName:(NSString *)name description:(NSString *)description;
- (void) loadLocalRoutesFromFileName:(NSString *)plistFileName;
- (NSUInteger)count;


- (void) loadDataIntoPoiArrayUsingArray:(NSArray *)array;

@end
