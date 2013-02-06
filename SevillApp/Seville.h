//
//  Seville.h
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Route.h"

#define SEVILLE_LATITUDE 37.386303
#define SEVILLE_LONGITUDE -5.992396;

@interface Seville : NSObject

+ (Route *)listOfPois;

@end
