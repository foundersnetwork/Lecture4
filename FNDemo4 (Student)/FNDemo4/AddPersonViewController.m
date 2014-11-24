//
//  AddPersonViewController.m
//  FNDemo4
//
//  Created by Reid Vender on 2014-11-21.
//  Copyright (c) 2014 Founders Network. All rights reserved.
//

#import "AddPersonViewController.h"

#import "Contact.h"

@interface AddPersonViewController ()
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *fnameField;
@property (weak, nonatomic) IBOutlet UITextField *lnameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end

@implementation AddPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dateChanged:(UIDatePicker *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd MMM yyyy ";
    _birthdayField.text=[formatter stringFromDate:sender.date];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd MMM yyyy ";
    if(![_fnameField.text isEqualToString:@""] && ![_lnameField.text isEqualToString:@""] && ![_emailField.text isEqualToString:@""] && ![_phoneField.text isEqualToString:@""] && ![_birthdayField.text isEqualToString:@""]){
        Contact *newPerson=[[Contact alloc]initWithFirstName:_fnameField.text lastName:_lnameField.text email:_emailField.text phoneNum:[_phoneField.text longLongValue]  birthday:[formatter dateFromString:_birthdayField.text]];
        [_parent.objects addObject:newPerson];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
