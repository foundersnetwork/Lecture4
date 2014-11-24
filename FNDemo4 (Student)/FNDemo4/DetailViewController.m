//
//  DetailViewController.m
//  FNDemo4
//
//  Created by Reid Vender on 2014-11-21.
//  Copyright (c) 2014 Founders Network. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ////////////////////////////////////////////
    // set the nameLabel to a string containing the person's first and last name
    ////////////////////////////////////////////
    
    ////////////////////////////////////////////
    // set the emailLabel to the person's email address
    ////////////////////////////////////////////
    
    ////////////////////////////////////////////
    // use type casting to set phoneNumLabel to a string containing the person's phone number
    ////////////////////////////////////////////
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd MMM yyyy ";
    
    ////////////////////////////////////////////
    // use type casting to set the birthdayLabel to the person's birthday
    ////////////////////////////////////////////
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
