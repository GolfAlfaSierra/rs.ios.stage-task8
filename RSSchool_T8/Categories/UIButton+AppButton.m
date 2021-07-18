//
//  UIButton+AppButton.m
//  RSSchool_T8
//
//  Created by John Kent on 17.07.2021.
//

#import "UIButton+AppButton.h"
#import "UIColor+AppColor.h"


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

- (void)setHighlighted:(BOOL)highlighted{
    if (highlighted) {
    [self.layer setShadowColor:[UIColor lightGreenSeaColor].CGColor];
    } else {
        [self.layer setShadowColor:[UIColor blackColor].CGColor];
    }
}

- (void)setEnabled:(BOOL)enabled{
    if (!enabled) {
        [self setAlpha:0.5];
        [self setUserInteractionEnabled:NO];
    } else {
        [self setAlpha:1];
        [self setUserInteractionEnabled:YES];
    }
}
@end
