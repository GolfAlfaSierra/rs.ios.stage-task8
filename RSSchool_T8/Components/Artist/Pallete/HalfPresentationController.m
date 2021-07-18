//
//  HalfPresentationController.m
//  RSSchool_T8
//
//  Created by John Kent on 18.07.2021.
//

#import "HalfPresentationController.h"

@implementation HalfPresentationController



- (CGRect)frameOfPresentedViewInContainerView{
    CGSize bounds = self.containerView.bounds.size;
    
    return CGRectMake(0, bounds.height /2 , bounds.width, bounds.height /2);
}

@end

