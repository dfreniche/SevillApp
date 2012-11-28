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

@end
