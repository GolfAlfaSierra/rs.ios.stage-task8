//
//  Landscape.h
//  RSSchool_T8
//
//  Created by John Kent on 20.07.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Landscape : UIView

+(UIBezierPath*) getMountainsVector;
+(UIBezierPath*) getDownhillVector;
+(UIBezierPath*) getHillsVector;

@end

NS_ASSUME_NONNULL_END
