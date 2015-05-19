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

@end
