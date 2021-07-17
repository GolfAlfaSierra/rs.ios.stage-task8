//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by John Kent on 17.07.2021.
//

#import "CanvasView.h"
#import "UIColor+AppColor.h"

@implementation CanvasView


-(void)awakeFromNib{
    [super awakeFromNib];
    
    [[self layer] setCornerRadius:8];
    
    [[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowOpacity:0.25];
    [[self layer] setShadowColor:[UIColor chillSkyColor].CGColor];
    [[self layer] setShadowRadius:8];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
