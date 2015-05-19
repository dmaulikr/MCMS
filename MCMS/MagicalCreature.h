//
//  MagicalCreature.h
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *accessory;

-(instancetype)initWithName:(NSString *)name andAccessory:(NSString *)accessory;

@end
