//
//  ConvertViewController.m
//  HexConverter
//
//  Created by OSX on 3/18/16.
//  Copyright © 2016 LebonTech Solutions. All rights reserved.
//

#import "ConvertViewController.h"

@interface ConvertViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hexConvertTextField; //. textField for user input
@property (weak, nonatomic) IBOutlet UILabel *redLabel; //................ red label to update once converted
@property (weak, nonatomic) IBOutlet UILabel *greenLabel; //.............. green label to update once converted
@property (weak, nonatomic) IBOutlet UILabel *blueLabel; //............... blue label to update once converted

@end

@implementation ConvertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ConvertButton

// Method to handle the convert button being pressed
// converts the hex-code input to an array of three normalized floating point numbers
- (IBAction)convertButton:(id)sender {
    NSString *hexInput = self.hexConvertTextField.text;
    
    NSLog(@"%@", hexInput);
}

#pragma mark - Helper
-(void)hexConvert:(NSString *)hexToConvert{
//    NSArray *normalizedArray = @[ @0.0, @0.0, @0.0 ];
    
}

//-(int)normalizeThisNumber:(int)numberToConvert withBase:(int)base{
//    
//}

@end
