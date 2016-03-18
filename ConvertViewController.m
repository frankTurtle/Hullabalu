//
//  ConvertViewController.m
//  HexConverter
//
//  Created by OSX on 3/18/16.
//  Copyright © 2016 LebonTech Solutions. All rights reserved.
//

#import "ConvertViewController.h"
#define RED_INDEX  0
#define GREEN_INDEX  1
#define BLUE_INDEX  2

@interface ConvertViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hexConvertTextField; //. textField for user input
@property (weak, nonatomic) IBOutlet UILabel *redLabel; //................ red label to update once converted
@property (weak, nonatomic) IBOutlet UILabel *greenLabel; //.............. green label to update once converted
@property (weak, nonatomic) IBOutlet UILabel *blueLabel; //............... blue label to update once converted

@end

@implementation ConvertViewController

NSArray *normalizedArray; //. variable to hold the array of noramlized floats

- (void)viewDidLoad {
    [super viewDidLoad];
    
    normalizedArray = @[ @0.0, @0.0, @0.0 ]; //. initialize the array
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
    
    if( [hexInput length] == 6 && [ self isValidHex:[hexInput uppercaseString] ] ){
        [self hexConvert:hexInput];
    }
    else
        NSLog(@"False");
}

#pragma mark - Helper
-(void)hexConvert:(NSString *)hexToConvert{
    int index;
    
    if( [hexToConvert length] != 0 ){
        NSLog(@"%@", normalizedArray);
        self.redLabel.text =   [NSString stringWithFormat:@"%.2f", [normalizedArray[RED_INDEX] floatValue] ];
//        self.greenLabel.text = normalizedArray[ GREEN_INDEX ];
//        self.blueLabel.text =  normalizedArray[ BLUE_INDEX ];
    }
    
}

//-(int)normalizeThisNumber:(int)numberToConvert withBase:(int)base{
//    
//}

// Method to determine if the string contains valid characters in hex
-(BOOL)isValidHex:(NSString *)checkThisString{
    NSCharacterSet *hexChars = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"] invertedSet]; //. custom character set with all valid hex values
    return (NSNotFound == [ checkThisString rangeOfCharacterFromSet:hexChars].location ); //............................. checks to see if all characters are valid
}

@end
