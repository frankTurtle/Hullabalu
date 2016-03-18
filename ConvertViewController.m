//
//  ConvertViewController.m
//  HexConverter
//
//  Created by OSX on 3/18/16.
//  Copyright © 2016 LebonTech Solutions. All rights reserved.
//

#import "ConvertViewController.h"
#define RED_INDEX   0
#define GREEN_INDEX 1
#define BLUE_INDEX  2
#define START_INDEX 0

@interface ConvertViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hexConvertTextField; //. textField for user input
@property (weak, nonatomic) IBOutlet UILabel *redLabel; //................ red label to update once converted
@property (weak, nonatomic) IBOutlet UILabel *greenLabel; //.............. green label to update once converted
@property (weak, nonatomic) IBOutlet UILabel *blueLabel; //............... blue label to update once converted

@end

@implementation ConvertViewController

NSMutableArray *normalizedArray; //. variable to hold the array of noramlized float objects

- (void)viewDidLoad {
    [super viewDidLoad];
    
    normalizedArray = [[NSMutableArray alloc] initWithCapacity:3]; //. initizlize array with 3 values
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
    NSArray *convertedFloats;
    
    if( [hexInput length] == 6 && [ self isValidHex:[hexInput uppercaseString] ] ){
        convertedFloats = [self hexConvert:hexInput atIndex:START_INDEX];
        NSLog(@"%@", convertedFloats);
    }
    else
        NSLog(@"False");
}

#pragma mark - Helper

// Method to convert the value from the TextField to a normalized floating point number
// populates the array with values as well
-(NSArray *)hexConvert:(NSString *)hexToConvert atIndex:(int)index{
    if( [hexToConvert length] == 0 ){
        self.redLabel.text =   [NSString stringWithFormat:@"%.2f", [normalizedArray[RED_INDEX]   floatValue] ];
        self.greenLabel.text = [NSString stringWithFormat:@"%.2f", [normalizedArray[GREEN_INDEX] floatValue] ];
        self.blueLabel.text =  [NSString stringWithFormat:@"%.2f", [normalizedArray[BLUE_INDEX]  floatValue] ];
    }
    else{
        NSString *firstTwoCharacters = [hexToConvert substringToIndex:2];
        NSScanner *converter = [NSScanner scannerWithString:firstTwoCharacters];
        
        unsigned convertedHex = 0;
        [converter scanHexInt:&convertedHex];
        
        NSNumber *convertedNum = [NSNumber numberWithFloat:[self normalizeThisNumber:convertedHex withBase:255.0]];
        [normalizedArray insertObject:convertedNum atIndex:index];
        
        [self hexConvert:[hexToConvert substringFromIndex:2] atIndex:++index];
    }
    
    return [normalizedArray mutableCopy];
}

// Method to normalize a number passed in with a certain base
-(float)normalizeThisNumber:(unsigned)numberToConvert withBase:(float)base{
    return numberToConvert / base;
}

// Method to determine if the string contains valid characters in hex
-(BOOL)isValidHex:(NSString *)checkThisString{
    NSCharacterSet *hexChars = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"] invertedSet]; //. custom character set with all valid hex values
    return (NSNotFound == [ checkThisString rangeOfCharacterFromSet:hexChars].location ); //............................. checks to see if all characters are valid
}

@end
