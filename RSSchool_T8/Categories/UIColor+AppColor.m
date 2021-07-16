//
//  UIColor+AppColor.m
//  RSSchool_T8
//
//  Created by John Kent on 16.07.2021.
//

#import "UIColor+AppColor.h"


#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation UIColor (AppColor)

+(UIColor*)chillSkyColor{
    return UIColorFromRGB(0x00B2FF);
}

+(UIColor*)lightGreenSeaColor{
    return UIColorFromRGB(0x21B08E);
}


@end
