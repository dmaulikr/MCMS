//
//  MagicalCreature.m
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name andAccessory:(NSString *)accessory{

    self = [super init];

    if (self) {
        self.name = name;
        self.accessory = accessory;
    }

    return self;
}

@end
