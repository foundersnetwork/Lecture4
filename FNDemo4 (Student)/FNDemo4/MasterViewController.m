//
//  MasterViewController.m
//  FNDemo4
//
//  Created by Reid Vender on 2014-11-21.
//  Copyright (c) 2014 Founders Network. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddPersonViewController.h"


@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.objects) {
        ////////////////////////////////////////////
        // initialize the blank objects array
        ////////////////////////////////////////////
    }
    
    [self.objects addObject:[[Contact alloc]initWithFirstName:@"Mark" lastName:@"Hall" email:@"mark@gmail.com" phoneNum:51988233785 birthday:[NSDate date]]];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(Contact*)person {
    ////////////////////////////////////////////
    // add the instance of our Contact class called person to the objects array
    ////////////////////////////////////////////
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

// Have a look at the method below, it allows us to retreive the information from our AddPersonViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *destController=[segue destinationViewController];
        NSIndexPath* pathOfTheCell = [self.tableView indexPathForCell:sender];
        NSInteger rowOfTheCell = [pathOfTheCell row];
        destController.person=_objects[rowOfTheCell];
    }
    else if([[segue identifier] isEqualToString:@"addPerson"]){
        AddPersonViewController *addPersonVC=[segue destinationViewController];
        addPersonVC.parent=self;
        
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ////////////////////////////////////////////
    // return the number of elements in objects
    ////////////////////////////////////////////
    return ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(!cell)
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    ////////////////////////////////////////////
    // set up the table cells which display the contacts' first and last names
    ////////////////////////////////////////////
    
    // store the Contact object in the objects array in a variable called person with type Contact
    
    // set the cell's label text to a string with the person's first and last name
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
