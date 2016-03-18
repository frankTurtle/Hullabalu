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
    NSString *hexInput = self.hexConvertTextField.text; //............................... gets the input from the user text field
    NSArray *convertedFloats; //......................................................... variable to hold the array object once returned
    
    if( [hexInput length] == 6 && [ self isValidHex:[hexInput uppercaseString] ] ){ //... if the input length and values are correct
        convertedFloats = [self hexConvert:hexInput atIndex:START_INDEX]; //............. convert them to normalized floats and put into array
        NSLog(@"%@", convertedFloats); //................................................ print array to console
    }
    else{//.............................................................................. length or values are not correct
        NSLog(@"False");
    }

}

#pragma mark - Helper

// Method to convert the value from the TextField to a normalized floating point number
// populates the array with values as well
// returns an array of all converted values
-(NSArray *)hexConvert:(NSString *)hexToConvert atIndex:(int)index{
    if( [hexToConvert length] == 0 ){ //................................................................................ this stops the recursive calls
        self.redLabel.text =   [NSString stringWithFormat:@"%.2f", [normalizedArray[RED_INDEX]   floatValue] ]; //...... sets all label text
        self.greenLabel.text = [NSString stringWithFormat:@"%.2f", [normalizedArray[GREEN_INDEX] floatValue] ];
        self.blueLabel.text =  [NSString stringWithFormat:@"%.2f", [normalizedArray[BLUE_INDEX]  floatValue] ];
    }
    else{
        NSString *firstTwoCharacters = [hexToConvert substringToIndex:2]; //............................................ get the first two chars of the string to convert
        NSScanner *converter = [NSScanner scannerWithString:firstTwoCharacters];
        
        unsigned convertedHex = 0; //................................................................................... variable to hold the converted hex value
        [converter scanHexInt:&convertedHex]; //........................................................................ converts the hex to an int
        
        NSNumber *convertedNum = [NSNumber numberWithFloat:[self normalizeThisNumber:convertedHex withBase:255.0]]; //.. variable to convert the int above to a normalized float
        [normalizedArray insertObject:convertedNum atIndex:index]; //................................................... add normalized value to the array
        
        [self hexConvert:[hexToConvert substringFromIndex:2] atIndex:++index]; //....................................... recursively call itself with a substring
    }
    
    return [normalizedArray mutableCopy]; //............................................................................ return the array
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
