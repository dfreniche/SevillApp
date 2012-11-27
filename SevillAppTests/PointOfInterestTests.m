//
//  SevillAppTests.m
//  SevillAppTests
//
//  Created by Diego Freniche Brito on 27/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "PointOfInterestTests.h"

@interface PointOfInterestTests()
@property (nonatomic, strong) PointOfInterest *point;
@end

@implementation PointOfInterestTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.point = [[PointOfInterest alloc] initWithId:[NSNumber numberWithInt:10] name:@"Test Point" shortDescription:@"The description" latitude:[NSNumber numberWithFloat:1.0] longitude:[NSNumber numberWithFloat:-2.3]];
    STAssertNotNil(self.point, @"Point must not be nil");
}

- (void)tearDown
{
    // Tear-down code here.
    self.point = nil;
    [super tearDown];
}

- (void)testDesignatedInitializer
{
    PointOfInterest *p = [[PointOfInterest alloc] init];
    STAssertNotNil(p, @"Point must not be nil");
    
    STAssertEqualObjects([p name], @"POI", @"Name must be POI, but it's %@", [p name]);
    STAssertEqualObjects([p latitude], [NSNumber numberWithFloat:kDEFAULT_LATITUDE], @"Latitude must be %@, but it's %@", [NSNumber numberWithFloat:kDEFAULT_LATITUDE], [p latitude]);
    
}

@end
