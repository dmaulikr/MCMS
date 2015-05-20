//
//  Accessory.h
//  MCMS
//
//  Created by Tony Dakhoul on 5/20/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Accessory : NSObject

@property NSString *name;
@property NSInteger value;

-(instancetype)initWithName:(NSString *)name andValue:(NSInteger)value;

@end
