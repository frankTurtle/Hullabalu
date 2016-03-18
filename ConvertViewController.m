//
//  ConvertViewController.m
//  HexConverter
//
//  Created by OSX on 3/18/16.
//  Copyright © 2016 LebonTech Solutions. All rights reserved.
//

#import "ConvertViewController.h"

@interface ConvertViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hexConvertTextField;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
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

- (IBAction)convertButton:(id)sender {
}
@end
