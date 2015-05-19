//
//  CreatureViewController.m
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "CreatureViewController.h"
#import "ViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessoryLabel;

@property (weak, nonatomic) IBOutlet UITextField *creatureNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *accessoryTextField;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.creatureNameTextField.hidden = YES;
    self.accessoryTextField.hidden = YES;
    self.editing = false;

    self.creatureNameLabel.text = self.creature.name;
    self.accessoryLabel.text = self.creature.detail;


}

- (IBAction)onEditTapped:(UIBarButtonItem *)sender {

    if (self.editing) {

        self.editing = false;

        if (![self.creatureNameTextField.text isEqualToString:@""] && ![self.accessoryTextField.text isEqualToString:@""]) {

            self.creatureNameLabel.text = self.creatureNameTextField.text;
            self.accessoryLabel.text = self.accessoryTextField.text;

            self.creatureNameTextField.text = @"";
            self.accessoryTextField.text = @"";

            self.creature.name = self.creatureNameLabel.text;
            self.creature.detail = self.accessoryLabel.text;

        }

        self.creatureNameLabel.hidden = NO;
        self.accessoryLabel.hidden = NO;

        self.accessoryTextField.hidden = YES;
        self.creatureNameTextField.hidden = YES;

        sender.title = @"Edit";
        sender.style = UIBarButtonItemStylePlain;
    } else {

        self.editing = true;

        self.creatureNameLabel.hidden = YES;
        self.accessoryLabel.hidden = YES;

        self.accessoryTextField.hidden = NO;
        self.creatureNameTextField.hidden = NO;

        sender.title = @"Done";
        sender.style = UIBarButtonItemStyleDone;
    }

}

@end
