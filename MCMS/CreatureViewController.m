//
//  CreatureViewController.m
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "CreatureViewController.h"
#import "ViewController.h"
#import "Accessory.h"

@interface CreatureViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.creatureNameTextField.hidden = YES;
    self.detailTextField.hidden = YES;
    self.editing = false;

    self.creatureNameLabel.text = self.creature.name;
    self.detailLabel.text = self.creature.detail;


//    Accessory *sword = [[Accessory alloc] initWithName:@"Sword" andValue:5];
//    Accessory *spear = [[Accessory alloc] initWithName:@"Spear" andValue:4];
//    Accessory *lightSaber = [[Accessory alloc] initWithName:@"Lightsaber" andValue:7];
//    Accessory *nunchucks = [[Accessory alloc] initWithName:@"Nunchucks" andValue:3];
//    Accessory *tshirtLauncher = [[Accessory alloc] initWithName:@"Tshirt Launcher" andValue:2];
//    Accessory *pillow = [[Accessory alloc] initWithName:@"Pillow" andValue:1];
//    Accessory *hammerOfThor = [[Accessory alloc] initWithName:@"Hammer of Thor" andValue:10];
//
//    self.accessories = [NSMutableArray arrayWithObjects:sword, spear, lightSaber, nunchucks, tshirtLauncher, pillow, hammerOfThor, nil];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.accessories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccessoryCellID"];

    Accessory *accessory = self.accessories[indexPath.row];

    cell.textLabel.text = accessory.name;

    if ([self.creature.accessories containsObject:self.accessories[indexPath.row]]) {

        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    if (cell.accessoryType != UITableViewCellAccessoryCheckmark) {

        cell.accessoryType = UITableViewCellAccessoryCheckmark;

        Accessory *accessory = [self.accessories objectAtIndex:indexPath.row];

        [self.creature.accessories addObject:accessory];

    } else {

        cell.accessoryType = UITableViewCellAccessoryNone;

        [self.creature.accessories removeObject:self.accessories[indexPath.row]];
    }

//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (IBAction)onEditTapped:(UIBarButtonItem *)sender {

    if (self.editing) {

        self.editing = false;

        if (![self.creatureNameTextField.text isEqualToString:@""] && ![self.detailTextField.text isEqualToString:@""]) {

            self.creatureNameLabel.text = self.creatureNameTextField.text;
            self.detailLabel.text = self.detailTextField.text;

            self.creatureNameTextField.text = @"";
            self.detailTextField.text = @"";

            self.creature.name = self.creatureNameLabel.text;
            self.creature.detail = self.detailLabel.text;
        }

        self.creatureNameLabel.hidden = NO;
        self.detailLabel.hidden = NO;

        self.detailTextField.hidden = YES;
        self.creatureNameTextField.hidden = YES;

        sender.title = @"Edit";
        sender.style = UIBarButtonItemStylePlain;
    } else {

        self.editing = true;

        self.creatureNameLabel.hidden = YES;
        self.detailLabel.hidden = YES;

        self.detailTextField.hidden = NO;
        self.creatureNameTextField.hidden = NO;

        sender.title = @"Done";
        sender.style = UIBarButtonItemStyleDone;
    }
}

@end
