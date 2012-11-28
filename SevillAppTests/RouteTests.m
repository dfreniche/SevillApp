//
//  RouteTests.m
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "RouteTests.h"
#import "Route.h"

@implementation RouteTests

- (void) testCanCreateRoute {
    
    Route *r = [[Route alloc] initWithId:[NSNumber numberWithInt:10] andName:@"Golden Route" description:@"This route"];
    STAssertNotNil(r, @"Route must NOT be nil");

    STAssertEquals([r identifier], [NSNumber numberWithInt:10], @"number incorrect");
    STAssertEquals(@"Golden Route", [r name], @"");
    STAssertEquals(@"This route", [r description], @"");

}

- (void) testLoadRouteFromPListManually {
    NSString *plistFileName = @"PointOfInterestDataTest";
    
    Route *r = [[Route alloc] init];
    STAssertNotNil(r, @"Route must NOT be nil");

     NSString* plistPath = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];

    // NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    // STAssertNotNil(dict, @"Dictionary nil: faling to load plist file");
    // STAssertEquals([dict count], (NSUInteger)1, @"Incorrect count");

    
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    STAssertNotNil(array, @"Array nil: faling to load plist file");
    STAssertEquals([array count], (NSUInteger)2, @"Incorrect count");
    
    int n=0;
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
        if (n==0) {
            STAssertEqualObjects([p name], @"La Giralda", @"Name must be %@, but it's %@", @"La Giralda", [p name]);
            STAssertEqualObjects([p latitude], lat, @"Latitude must be %@, but it's %@", lat, [p latitude]);
            STAssertEqualObjects([p longitude], longit, @"Longitude must be %@, but it's %@", longit, [p longitude]);
            STAssertEqualObjects([p shortDescription], @"Test Description", @"ShortDescription must be %@, but it's %@", @"", [p shortDescription]);
            STAssertNotNil(photos, @"Photos must not be nil");
            STAssertEquals([photos count], (NSUInteger)2, @"Two photos in test plist");
        }
        
        if (n==1) {
            STAssertEqualObjects([p name], @"Test name", @"Name must be %@, but it's %@", @"Test name", [p name]);
            STAssertEqualObjects([p latitude], lat, @"Latitude must be %@, but it's %@", lat, [p latitude]);
            STAssertEqualObjects([p longitude], longit, @"Longitude must be %@, but it's %@", longit, [p longitude]);
            STAssertEqualObjects([p shortDescription], @"Test Description", @"ShortDescription must be %@, but it's %@", @"", [p shortDescription]);
            STAssertNotNil(photos, @"Photos must not be nil");
            STAssertEquals([photos count], (NSUInteger)2, @"Two photos in test plist");
        }
        
        n++;
    }
}


- (void) testLoadRouteFromPListUsingLoadMethod {
    NSString *plistFileName = @"PointOfInterestDataTest";
    
    Route *r = [[Route alloc] initWithId:[NSNumber numberWithInt:10] andName:@"Golden Route" description:@"This route"];
    STAssertNotNil(r, @"Route must NOT be nil");

    [r loadLocalRoutesFromFileName:plistFileName];
    STAssertNotNil([r pois], @"POIs can't be nil");
    STAssertEquals([r count], (NSUInteger)2, @"Incorrect count");
    
}

@end
