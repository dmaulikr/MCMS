//
//  CreatureViewController.h
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface CreatureViewController : UIViewController

@property NSString *creatureName;
@property NSString *detail;

@property MagicalCreature *creature;

@end
