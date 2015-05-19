//
//  ViewController.m
//  MCMS
//
//  Created by Tony Dakhoul on 5/19/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;

@property (weak, nonatomic) IBOutlet UITextField *accessoryTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *unicorn = [MagicalCreature new];
    MagicalCreature *chupacabra = [MagicalCreature new];
    MagicalCreature *catdog = [MagicalCreature new];

    unicorn.name = @"Unicorn";
    chupacabra.name = @"Chupacabra";
    catdog.name = @"Catdog";

    self.creatures = [NSMutableArray arrayWithObjects:unicorn, chupacabra, catdog, nil];

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

    if (![self.creatureTextField.text isEqualToString:@""] && ![self.accessoryTextField.text isEqualToString:@""]) {

        NSLog(@"YAY");

        MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureTextField.text andAccessory:self.accessoryTextField.text];

        [self.creatures addObject:creature];

        self.creatureTextField.text = @"";
        self.accessoryTextField.text = @"";

        [self.tableView reloadData];
    }
}


@end
