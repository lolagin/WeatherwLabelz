//
//  LHWViewController.m
//  Weather
//
//  Created by Jeffrey C Rosenthal on 3/24/15.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//
#import "LHWModalInputViewController.h"
#import "LHWViewController.h"


@interface LHWViewController ()
-(void)detailButtonPressed;
-(void)modalCityPresent;
@property (strong, nonatomic)UIButton *button;
@property (strong, nonatomic)LHWCityModel *city;
@property (strong, nonatomic)UILabel *label;
@end

@implementation LHWViewController



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake((self.view.frame.size.width / 3), (self.view.frame.size.height / 3), 160, 30);
    [self.button setTitle:@"ｄｅｔａｉｌｓ！！！" forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor blueColor]];
    [self.button addTarget:self action:@selector(detailButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(8, 73, (self.view.bounds.size.width - 16), (self.view.bounds.size.height - 133))];
    UIBarButtonItem *addCityButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(modalCityPresent)];
    self.navigationItem.rightBarButtonItem = addCityButton;
    
    
    self.label.text = self.city.name;
    self.label.numberOfLines = 3;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.view.backgroundColor = [UIColor colorWithRed:0 green:(128 / 255.0) blue:(128 / 255.0) alpha:1];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"angst"]];
    imageView.frame = CGRectMake((self.view.bounds.size.width/3), (CGRectGetMidY(self.view.bounds)+50), 200, 200);
    
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
    [self.view addSubview:imageView];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    
    
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


+(instancetype)cityViewWithCity:(LHWCityModel *)city{
    
    LHWViewController *theView = [[LHWViewController alloc]init];
    theView.city = city;
    theView.tabBarItem = [[UITabBarItem alloc]initWithTitle:city.name image:city.image tag:0];
    return theView;
}




-(void)detailButtonPressed{
    LHWDetailViewController *dvc = [[LHWDetailViewController alloc] initWithCity:self.city];
    [self.navigationController pushViewController:dvc animated:true];
}


-(void)modalCityPresent{
   

    LHWModalInputViewController *modalView = [[LHWModalInputViewController alloc]init];
    [self.navigationController pushViewController:modalView animated:true];
}




@end
