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
    self.view.backgroundColor = [UIColor colorWithRed:0 green:(128 / 255.0) blue:(128 / 255.0) alpha:1];
    tempLabel.numberOfLines = 3;
    tempLabel.textAlignment = NSTextAlignmentJustified;
    tempLabel.text = [NSString stringWithFormat:@"ｉｔ ｉｓ %ld ｄｅｇｒｅｅｓ  ｆａｈｒｅｎｈｅｉｔ ｉｎ %@！！！",(long)self.city.temperature, self.city.name];
    [self.view addSubview:tempLabel];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:self.city.image];
    imageView.frame = CGRectMake(18, 90, imageView.frame.size.width, imageView.frame.size.height);
    [self.view addSubview:imageView];
    
    UIImageView *secondImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"stupidStatue"]];
    secondImageView.frame = CGRectMake((CGRectGetMidX(self.view.bounds)/2), CGRectGetMidY(self.view.bounds), 200, 200);
    [self.view addSubview:secondImageView];
    
    
    

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
