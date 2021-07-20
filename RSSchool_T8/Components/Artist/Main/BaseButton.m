//
//  BaseButton.m
//  RSSchool_T8
//
//  Created by John Kent on 18.07.2021.
//

#import "BaseButton.h"
#import "UIColor+AppColor.h"
@implementation BaseButton

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.layer setCornerRadius:10];
    
    [self.layer setBackgroundColor:UIColor.whiteColor.CGColor];
    
    [self.layer setShadowOffset:CGSizeZero];
    [self.layer setShadowOpacity:0.25];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowRadius:2];
}

- (void)setHighlighted:(BOOL)highlighted{
    if (highlighted) {
        [self.layer setShadowColor:[UIColor lightGreenSeaColor].CGColor];
        [self.layer setShadowOpacity:1];
    } else {
        [self.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.layer setShadowOpacity:0.25];
    }
}

//- (void)setEnabled:(BOOL)enabled{
//    if (!enabled) {
//        [self setAlpha:0.5];
//        [self setUserInteractionEnabled:NO];
//    } else {
//        [self setAlpha:1];
//        [self setUserInteractionEnabled:YES];
//    }
//}

-(void)setEnabledState{
    self.layer.shadowRadius   = 2.0;
    self.layer.shadowColor    = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity  = 0.25;
    self.alpha                = 1;
    self.titleLabel.textColor = [UIColor lightGreenSeaColor];
    
    [self setEnabled:YES];
    [self setUserInteractionEnabled:YES];
}
-(void)setDisabledState{
    self.layer.shadowRadius   = 2.0;
    self.layer.shadowColor    = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity  = .25;
    self.alpha = 0.5;
    
    [self setEnabled: NO];
    [self setUserInteractionEnabled:NO];
}

//- (void)setSelected:(BOOL)selected{
//    if (selected) {
//        [self.layer setShadowColor:[UIColor lightGreenSeaColor].CGColor];
//        [self.layer setShadowOpacity:1];
//    } else {
//        [self.layer setShadowColor:[UIColor blackColor].CGColor];
//        [self.layer setShadowOpacity:0.25];
//    }
//}

@end
