//
//  MagicalCreature.m
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name andDetail:(NSString *)detail{

    self = [super init];

    if (self) {
        self.name = name;
        self.detail = detail;
    }

    return self;
}

@end
