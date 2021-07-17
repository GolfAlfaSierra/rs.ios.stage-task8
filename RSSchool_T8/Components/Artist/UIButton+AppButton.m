//
//  UIButton+AppButton.m
//  RSSchool_T8
//
//  Created by John Kent on 17.07.2021.
//

#import "UIButton+AppButton.h"



@implementation UIButton (AppButton)

- (void)awakeFromNib{
    [super awakeFromNib];
    
    // border radius
    [self.layer setCornerRadius:10];
    
    [self.layer setBackgroundColor:UIColor.whiteColor.CGColor];
    
    [self.layer setShadowOffset:CGSizeZero];
    [self.layer setShadowOpacity:0.25];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowRadius:1];
    
    
}

@end
