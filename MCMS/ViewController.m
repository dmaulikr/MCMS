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
    MagicalCreature *chupacabra = [MagicalCreature new];
    MagicalCreature *catdog = [MagicalCreature new];

    unicorn.name = @"Unicorn";
    chupacabra.name = @"Chupacabra";
    catdog.name = @"Catdog";

    self.creatures = [NSMutableArray arrayWithObjects:unicorn, chupacabra, catdog, nil];

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

    return cell;
}

- (IBAction)onAddButtonTapped:(UIButton *)sender {

    NSLog(@"BOO");

    if (![self.creatureTextField.text isEqualToString:@""] && ![self.detailTextField.text isEqualToString:@""]) {

        NSLog(@"YAY");

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

    [self.creatures replaceObjectAtIndex:indexPath.row withObject:creatureVC.creature];

//    creatureVC.creatureName = creature.name;
//    creatureVC.accessory = creature.accessory;
}


@end
