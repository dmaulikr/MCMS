//
//  Accessory.m
//  MCMS
//
//  Created by Tony Dakhoul on 5/20/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "Accessory.h"

@implementation Accessory

-(instancetype)initWithName:(NSString *)name andValue:(NSInteger)value {

    self = [super init];

    if (self ) {

        self.name = name;
        self.value = value;
    }

    return self;
}

@end
