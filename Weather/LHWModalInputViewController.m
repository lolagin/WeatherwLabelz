//
//  LHWModalInputViewController.m
//  Weather
//
//  Created by Jeffrey C Rosenthal on 3/24/15.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "LHWModalInputViewController.h"
#import "LHWCityModel.h"
#import "LHWViewController.h"

@interface LHWModalInputViewController () <UITextFieldDelegate>
@property (strong, nonatomic)LHWCityModel *city;

-(int)fieldScanner:(NSString *)fieldInput;
-(LHWViewController *)cityWithNameAndImage;
-(UIImage *)checkTemperature;

@end

@implementation LHWModalInputViewController {
    NSString *nameInput;
    NSInteger tempInput;
    CGFloat width;
    CGFloat height;
    NSInteger questionCount;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    questionCount = 0;
    width = self.view.frame.size.width;
    height = self.view.frame.size.height;
    self.view.backgroundColor = [UIColor colorWithRed:0 green:(128 / 255.0) blue:(128 / 255.0) alpha:1];
    
    UITextField *cityTextField = [[UITextField alloc]initWithFrame:CGRectMake((width / 6), 73, ((width / 3) * 2), (height / 3))];
    cityTextField.delegate = self;
    cityTextField.textColor = [UIColor whiteColor];
    cityTextField.borderStyle = UITextBorderStyleBezel;
    cityTextField.placeholder = @"whats yr name, city???";
    cityTextField.returnKeyType = UIReturnKeyDone;
    cityTextField.delegate = self;
    
    [self.view addSubview:cityTextField];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



-(LHWViewController *)cityWithNameAndImage{
    if (tempInput && nameInput) {
        LHWCityModel *aCity = [[LHWCityModel alloc]initCustomName:nameInput Temperature:tempInput Image:[self checkTemperature]];
        return [LHWViewController cityViewWithCity:aCity];
    }
    else {
        return [LHWViewController cityViewWithCity:[LHWCityModel initCardiff]];
    }
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (questionCount == 0) {
        nameInput = textField.text;
        textField.placeholder = @"thx man. Now what is the temperature there?";
        textField.text = @"";
        questionCount = 1;
        [textField resignFirstResponder];
        return YES;
    }
    else if (questionCount == 1) {
        tempInput = [self fieldScanner:textField.text];
        NSMutableArray *temp = [self.tabBarController.viewControllers mutableCopy];
        LHWViewController *cityController = [self cityWithNameAndImage];
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:cityController];
        [temp addObject:navController];
        self.tabBarController.viewControllers = [NSArray arrayWithArray:temp];
        
        temp = nil;
        nameInput = nil;
        questionCount = 0;
        textField.placeholder = @"wtg buddy! you added an entire city";
        textField.text = @"";
        [textField resignFirstResponder];
        return YES;
        
    }
    else {
        questionCount = 0;
        textField.placeholder = @"huh? Lets start again. Name?";
        textField.text = @"";
        [textField resignFirstResponder];
        return YES;
    }
}

-(UIImage *)checkTemperature{
    NSString *imageName = [[NSString alloc]init];
    if (tempInput >= 90) {
        imageName = @"default";
    }
    else if (tempInput >= 75 &&tempInput < 90) {
        imageName = @"clear-day";
    }
    else if (tempInput < 75 &&tempInput >= 60) {
        imageName = @"clear-night";
    }
    else if (tempInput >= 45 &&tempInput < 60) {
        imageName = @"wind";
    }
    else if (tempInput >= 30 &&tempInput < 45) {
        imageName = @"fog";
    }
    else if (tempInput > 15 &&tempInput < 30) {
        imageName = @"snow";
    }
    else if (tempInput <= 15) {
        imageName = @"sleet";
    }
    UIImage *wtfImage = [UIImage imageNamed:imageName];
    return wtfImage;
}

-(int)fieldScanner:(NSString *)fieldInput{
    NSMutableString *numberCatcher = [[NSMutableString alloc]init];
    NSScanner *numberScanner = [NSScanner scannerWithString:fieldInput];
    [numberScanner setCharactersToBeSkipped:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
    [numberScanner scanCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&numberCatcher];
    NSString *wtf = [NSString stringWithString:[numberCatcher copy]];
    int lol = [wtf intValue];
    return lol;
}

@end
