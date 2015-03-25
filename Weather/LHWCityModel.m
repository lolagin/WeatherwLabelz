//
//  LHWCityModel.m
//  Weather
//
//  Created by Jeffrey C Rosenthal on 3/24/15.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import "LHWCityModel.h"


@implementation LHWCityModel

-(instancetype)initCustomName:(NSString *)name Temperature:(NSInteger)temp Image:(UIImage *)image{
    self = [super init];
    if (self){
        self.name = name;
        self.temperature = temp;
        self.image = image;

    }
    return self;
}

+(instancetype)initChicago{
    LHWCityModel *city = [[LHWCityModel alloc] initCustomName:@"ｃｈｉｃａｇｏ" Temperature:33 Image:[UIImage imageNamed:@"snow"]];
    return city;
}
+(instancetype)initPortland{
    LHWCityModel *city = [[LHWCityModel alloc] initCustomName:@"ｐｏｒｔｌａｎｄ" Temperature:54 Image:[UIImage imageNamed:@"fog"]];
    return city;
    
}
+(instancetype)initMoscow{
    LHWCityModel *city = [[LHWCityModel alloc] initCustomName:@"ｍｏｓｃｏｗ" Temperature:32 Image:[UIImage imageNamed:@"sleet"]];
    return city;
}
+(instancetype)initCardiff{
    LHWCityModel *city = [[LHWCityModel alloc] initCustomName:@"ｃａｒｄｉｆｆ" Temperature:37 Image:[UIImage imageNamed:@"rain"]];
    return city;
}
+(instancetype)initPhnomPenh{
    LHWCityModel *city = [[LHWCityModel alloc] initCustomName:@"ｐｈｎｏｍ  ｐｅｎｈ" Temperature:93 Image: [UIImage imageNamed:@"clear-day"]];
    return city;
}
@end
