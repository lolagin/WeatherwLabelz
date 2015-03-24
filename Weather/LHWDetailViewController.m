//
//  LHWDetailViewController.m
//  Weather
//
//  Created by Jeffrey C Rosenthal on 3/24/15.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "LHWDetailViewController.h"

@interface LHWDetailViewController ()
@property (strong, nonatomic)LHWCityModel *city;

@end

@implementation LHWDetailViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 73, (self.view.bounds.size.width - 16), (self.view.bounds.size.height / 2))];
    tempLabel.backgroundColor = [UIColor greenColor];
    tempLabel.text = [NSString stringWithFormat:@"It is %ld degrees fahrenheit in %@!!!",(long)self.city.temperature, self.city.name];
    [self.view addSubview:tempLabel];
    
    UIImage *tempImage = self.city.image;
//    tempImage.boun
    
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
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
-(instancetype)initWithCity:(LHWCityModel *)city{
    self = [super init];
    if (self){
        self.city = city;
    }
    return self;
}

@end
