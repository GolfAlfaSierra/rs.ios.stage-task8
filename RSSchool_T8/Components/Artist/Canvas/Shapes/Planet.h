//
//  Planet.h
//  RSSchool_T8
//
//  Created by John Kent on 20.07.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Planet : UIView
+(UIBezierPath*)getAsteroidsVector;
+(UIBezierPath*)getWindsVector;
+(UIBezierPath*)getPlanetVector;

@end

NS_ASSUME_NONNULL_END
