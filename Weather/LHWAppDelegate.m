//
//  LHWAppDelegate.m
//  Weather
//
//  Created by Steven Masuch on 2014-07-30.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHWAppDelegate.h"
#import "LHWViewController.h"

@implementation LHWAppDelegate{
    NSMutableArray *cityArray;
    NSInteger selectedCity;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.tintColor = [UIColor redColor];
    
    UINavigationController *firstTabItem = [[UINavigationController alloc]initWithRootViewController:[LHWViewController cityViewWithCity:[LHWCityModel initCardiff]]];
    UINavigationController *secondTabItem = [[UINavigationController alloc]initWithRootViewController:[LHWViewController cityViewWithCity:[LHWCityModel initChicago]]];

    
//        UINavigationController *thirdTabItem = [[UINavigationController alloc]initWithRootViewController:[LHWViewController cityViewWithCity:[LHWCityModel initMoscow]]];
//        UINavigationController *fourthTabItem = [[UINavigationController alloc]initWithRootViewController:[LHWViewController cityViewWithCity:[LHWCityModel initPhnomPenh]]];
//        UINavigationController *fifthTabItem = [[UINavigationController alloc]initWithRootViewController:[LHWViewController cityViewWithCity:[LHWCityModel initPortland]]];
    
    
//   cityArray = [NSMutableArray arrayWithArray:@[firstTabItem, secondTabItem, thirdTabItem, fourthTabItem, fifthTabItem]];
    cityArray = [NSMutableArray arrayWithArray:@[firstTabItem, secondTabItem]];
    selectedCity = 0;

    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = cityArray;
    tabBarController.selectedViewController = cityArray[selectedCity];
    
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

@end
