//
//  LHWViewController.h
//  Weather
//
//  Created by Jeffrey C Rosenthal on 3/24/15.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHWCityModel.h"
#import "LHWDetailViewController.h"


@interface LHWViewController : UIViewController



+(instancetype)cityViewWithCity:(LHWCityModel *)city;


@end
