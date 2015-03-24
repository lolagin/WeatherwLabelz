//
//  LHWViewController.m
//  Weather
//
//  Created by Jeffrey C Rosenthal on 3/24/15.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "LHWViewController.h"


@interface LHWViewController ()
-(void)handleTap;
@property (strong, nonatomic)UIGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic)LHWCityModel *city;
@property (strong, nonatomic)UILabel *label;
@end

@implementation LHWViewController

-(void)handleTap{
    LHWDetailViewController *dvc = [[LHWDetailViewController alloc] initWithCity:self.city];
    [self.navigationController pushViewController:dvc animated:true];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.label = [[UILabel alloc]initWithFrame:CGRectMake(8, 73, (self.view.bounds.size.width - 16), (self.view.bounds.size.height - 133))];
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap)];
    
    self.label.text = self.city.name;
    self.label.userInteractionEnabled = true;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor greenColor];

    [self.label addGestureRecognizer:self.tapGestureRecognizer];

    
    [self.view addSubview:self.label];
    // Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.label removeGestureRecognizer:self.tapGestureRecognizer];


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
    theView.view.tintColor = [UIColor blueColor];
    return theView;
}



@end
