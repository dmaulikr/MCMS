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
@property NSString *detail;
@property NSMutableArray *accessories;

-(instancetype)initWithName:(NSString *)name andDetail:(NSString *)detail;

@end
