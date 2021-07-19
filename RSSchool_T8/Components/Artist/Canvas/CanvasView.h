//
//  CanvasView.h
//  RSSchool_T8
//
//  Created by John Kent on 17.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView

+(UIBezierPath*)DrawHead:(UIColor*)one two:(UIColor*)two three:(UIColor*)three;
+(void)DrawTree;
+(void)DrawLandscape;
+(void)DrawPlanet;


@end

NS_ASSUME_NONNULL_END
