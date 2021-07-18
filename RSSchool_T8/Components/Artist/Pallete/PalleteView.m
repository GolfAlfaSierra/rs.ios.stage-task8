//
//  PalleteView.m
//  RSSchool_T8
//
//  Created by John Kent on 18.07.2021.
//

#import "PalleteView.h"
#import "UIButton+AppButton.h"


@interface PalleteView ()

@end

@implementation PalleteView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
    
    
    
    
    [self setupColors];
}

-(void)setup{
    [self.layer setCornerRadius:40];
    
    
    [[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowOpacity:0.25];
    [[self layer] setShadowColor:[UIColor blackColor].CGColor];
    [[self layer] setShadowRadius:8];
    
    
}

-(void)setupColors{
}


@end
