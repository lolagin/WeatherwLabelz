//
//  LHWCityModel.h
//  Weather
//
//  Created by Jeffrey C Rosenthal on 3/24/15.
//  Copyright (c) 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHWCityModel : NSObject
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger temperature;
@property (strong, nonatomic) UIImage *image;


+(instancetype)initChicago;
+(instancetype)initPortland;
+(instancetype)initMoscow;
+(instancetype)initCardiff;
+(instancetype)initPhnomPenh;

//initwname
//initoverride (with a name,)
@end
