//
//  MainViewController.h
//  RSSchool_T8
//
//  Created by John Kent on 16.07.2021.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SelectedDrawing) {
    DrawingHead,
    DrawingTree,
    DrawingPlanet,
    DrawingLandscape
};


NS_ASSUME_NONNULL_BEGIN

@interface ArtistViewController : UIViewController
@property (nonatomic, strong) NSArray *slectedColors;
@property                  float timerValue;
@property(nonatomic) SelectedDrawing drawing;
@property(nonatomic, copy) NSTimer  *redrawTimer;
@end

NS_ASSUME_NONNULL_END
