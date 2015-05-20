//
//  ViewController.m
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "Accessory.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;

@property (weak, nonatomic) IBOutlet UITextField *detailTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

@synthesize creatures;

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *unicorn = [[MagicalCreature alloc] initWithName:@"Unicorn" andDetail:@"Horn"];
    MagicalCreature *chupacabra = [[MagicalCreature alloc] initWithName:@"Chupacabra" andDetail:@"Claws"];
    MagicalCreature *catdog = [[MagicalCreature new] initWithName:@"CatDog" andDetail:@"Sharp teeth"];

    self.creatures = [NSMutableArray arrayWithObjects:unicorn, chupacabra, catdog, nil];

    Accessory *sword = [[Accessory alloc] initWithName:@"Sword" andValue:5];
    Accessory *spear = [[Accessory alloc] initWithName:@"Spear" andValue:4];
    Accessory *lightSaber = [[Accessory alloc] initWithName:@"Lightsaber" andValue:7];
    Accessory *nunchucks = [[Accessory alloc] initWithName:@"Nunchucks" andValue:3];
    Accessory *tshirtLauncher = [[Accessory alloc] initWithName:@"Tshirt Launcher" andValue:2];
    Accessory *pillow = [[Accessory alloc] initWithName:@"Pillow" andValue:1];
    Accessory *hammerOfThor = [[Accessory alloc] initWithName:@"Hammer of Thor" andValue:10];

    self.accessories = [NSMutableArray arrayWithObjects:sword, spear, lightSaber, nunchucks, tshirtLauncher, pillow, hammerOfThor, nil];

}

-(void)viewDidAppear:(BOOL)animated {

    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];

    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];

    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;

    return cell;
}

- (IBAction)onAddButtonTapped:(UIButton *)sender {

    if (![self.creatureTextField.text isEqualToString:@""] && ![self.detailTextField.text isEqualToString:@""]) {

        MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureTextField.text andDetail:self.detailTextField.text];

        [self.creatures addObject:creature];

        self.creatureTextField.text = @"";
        self.detailTextField.text = @"";

        [self.tableView reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    CreatureViewController *creatureVC = [segue destinationViewController];

    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];

    creatureVC.creature = creature;
    creatureVC.accessories = self.accessories;

    [self.creatures replaceObjectAtIndex:indexPath.row withObject:creatureVC.creature];

//    creatureVC.creatureName = creature.name;
//    creatureVC.accessory = creature.accessory;
}


@end
