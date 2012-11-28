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

- (void)testDefaultInitializer {
    PointOfInterest *p = [[PointOfInterest alloc] init];
    STAssertNotNil(p, @"Point must not be nil");
    
    STAssertEqualObjects([p latitude], [NSNumber numberWithFloat:kPOI_DEFAULT_LATITUDE], @"Latitude must be %@, but it's %@", [NSNumber numberWithFloat:kPOI_DEFAULT_LATITUDE], [p latitude]);
    STAssertEqualObjects([p longitude], [NSNumber numberWithFloat:kPOI_DEFAULT_LONGITUDE], @"Longitude must be %@, but it's %@", [NSNumber numberWithFloat:kPOI_DEFAULT_LONGITUDE], [p longitude]);
    STAssertEqualObjects([p name], kPOI_DEFAULT_NAME, @"Name must be %@, but it's %@", kPOI_DEFAULT_NAME, [p name]);
    
    
}

- (void)testDesignatedInitializer {
    NSUInteger ident = 25;
    NSString *name = @"The name";
    NSString *shortDescription = @"This is a short description";
    NSNumber *lat = [NSNumber numberWithFloat:kPOI_DEFAULT_LATITUDE];
    NSNumber *longit = [NSNumber numberWithFloat:kPOI_DEFAULT_LONGITUDE];
    
    PointOfInterest *p = [[PointOfInterest alloc] initWithId:[NSNumber numberWithInt:ident] name:name shortDescription:shortDescription latitude:lat longitude:longit];
    STAssertNotNil(p, @"Point must not be nil");
    
    STAssertEqualObjects([p name], name, @"Name must be %@, but it's %@", name, [p name]);
    STAssertEqualObjects([p latitude], lat, @"Latitude must be %@, but it's %@", lat, [p latitude]);
    STAssertEqualObjects([p longitude], longit, @"Longitude must be %@, but it's %@", longit, [p longitude]);
    STAssertEqualObjects([p shortDescription], shortDescription, @"ShortDescription must be %@, but it's %@", shortDescription, [p shortDescription]);
}

- (void) testAllProperties {
    NSString *address = @"one address";
    [self.point setAddress:address];
    STAssertEqualObjects([self.point address], address, @"Address must be %@, but it's %@", address, [self.point address]);

    NSString *pinIconName = @"pin.png";
    self.point.pinIconName = pinIconName;
    STAssertEqualObjects([self.point pinIconName], pinIconName, @"PinIconName must be %@, but it's %@", pinIconName, [self.point pinIconName]);
}

- (void) testPhotos {
    STAssertNotNil([self.point photos], @"Photos must NOT be nil");
    [[self.point photos] addObject:@"newPhoto.png"];
    STAssertEqualObjects([[self.point photos] lastObject], @"newPhoto.png", @"Name of photo is not equal");
}

@end
