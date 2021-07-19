//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by John Kent on 17.07.2021.
//

#import "CanvasView.h"
#import "UIColor+AppColor.h"
#import "Head.h"

@implementation CanvasView


-(void)awakeFromNib{
    [super awakeFromNib];
    
    [[self layer] setCornerRadius:8];
    
    [[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowOpacity:0.25];
    [[self layer] setShadowColor:[UIColor chillSkyColor].CGColor];
    [[self layer] setShadowRadius:8];
    
    Head *head = [[Head alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    
    [self addSubview:head];
    [head startAnimation];
}

+ (void)DrawHead:(UIColor *)one two:(UIColor *)two three:(UIColor *)three{
}
+ (void)DrawTree{}
+ (void)DrawPlanet{}
+ (void)DrawLandscape{}
@end
