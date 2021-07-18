//
//  ColorButton.m
//  RSSchool_T8
//
//  Created by John Kent on 18.07.2021.
//

#import "ColorButton.h"

@interface ColorButton ()



@end

@implementation ColorButton

- (void)awakeFromNib{
    [super awakeFromNib];
    // border radius
    [self.layer setCornerRadius:10];
    
    [self.layer setBackgroundColor:UIColor.whiteColor.CGColor];
    
    [self.layer setShadowOffset:CGSizeZero];
    [self.layer setShadowOpacity:0.25];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowRadius:2];
    
    //innerColor
    UIView *sub = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    
    
    
    
    [sub.layer setCornerRadius:6];
//    [sub setBackgroundColor:UIColor.blueColor];
    [self addSubview:sub];
    
    [sub setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    sub.center = CGPointMake(self.frame.size.width  / 2,
                                     self.frame.size.height / 2);

}

- (void)pressesEnded:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event{
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}

@end
