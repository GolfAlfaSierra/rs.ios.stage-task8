//
//  ColorButton.m
//  RSSchool_T8
//
//  Created by John Kent on 18.07.2021.
//

#import "ColorButton.h"

@interface ColorButton ()
@property (nonatomic, strong) NSTimer *timer;
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
    [self addSubview:sub];
    
    [sub setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    sub.center = CGPointMake(self.frame.size.width  / 2,
                             self.frame.size.height / 2);
    
    self.isChecked = NO;
    
}

-(UIColor*)getColor{
    return self.subviews.firstObject.backgroundColor;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (!self.isChecked) {
        [self setChecked];
        
    } else {
        [self setUnChecked];
        
    }
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"app-color" object:self userInfo:nil];
    
}

-(void)setUnChecked{
    
    [self.subviews.firstObject setFrame:CGRectMake(0,0 , 24, 24)];
    self.subviews.firstObject.center = CGPointMake(self.frame.size.width  / 2,
                                                   self.frame.size.height / 2);
    
    self.isChecked = NO;
    
}
-(void)setChecked{
    [self.subviews.firstObject setFrame:CGRectMake(0, 0 , 36, 36)];
    self.subviews.firstObject.center = CGPointMake(self.frame.size.width  / 2,
                                                   self.frame.size.height / 2);
    
    self.isChecked = YES;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(resetBackground) userInfo:nil repeats:NO];
    
    
    [self.superview.superview setBackgroundColor:[self getColor]];
}


-(void)resetBackground{
    [self.superview.superview setBackgroundColor:[UIColor whiteColor]];
}

@end
