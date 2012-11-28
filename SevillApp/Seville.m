//
//  Seville.m
//  SevillApp
//
//  Created by Diego Freniche Brito on 28/11/12.
//  Copyright (c) 2012 Diego Freniche Brito. All rights reserved.
//

#import "Seville.h"

@implementation Seville


+ (Route *)listOfPois {
    static Route *_listOfPois = nil;
    if (!_listOfPois) {
        _listOfPois = [[Route alloc] initWithId:[NSNumber numberWithInt:1]
                                        andName:NSLocalizedString(@"routeName", @"Monuments")
                                    description:NSLocalizedString(@"description", @"Monuments of Seville")];
        [_listOfPois loadLocalRoutesFromFileName:@"PointOfInterestData"];
    }
    return _listOfPois;
}
@end
