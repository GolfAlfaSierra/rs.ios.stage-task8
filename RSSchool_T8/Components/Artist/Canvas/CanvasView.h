//
//  CanvasView.h
//  RSSchool_T8
//
//  Created by John Kent on 17.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView
@property (strong, nonatomic) CAShapeLayer* strokeLayer1;
@property (strong, nonatomic) CAShapeLayer* strokeLayer2;
@property (strong, nonatomic) CAShapeLayer* strokeLayer3;
- (void)drawHeadWithColors:(NSArray<UIColor*>*)colors;

@end

NS_ASSUME_NONNULL_END
