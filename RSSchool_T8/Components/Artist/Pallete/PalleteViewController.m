//
//  PalleteViewController.m
//  RSSchool_T8
//
//  Created by John Kent on 18.07.2021.
//

#import "PalleteViewController.h"
#import "HalfPresentationController.h"





@interface PalleteViewController () 
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIView *rowOne;
@property (weak, nonatomic) IBOutlet UIView *rowTwo;



@end

@implementation PalleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupColors];
    
    
    
//    [self.view setBackgroundColor:UIColor.redColor];
    
    [self.closeButton addTarget:self action:@selector(setupButton) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)setupColors{
    NSArray<UIColor*> *colors = @[
        [UIColor colorWithRed:0.89 green:0.11 blue:0.17 alpha:1],
        [UIColor colorWithRed:0.24 green:0.09 blue:0.8 alpha:1],
        [UIColor colorWithRed:0 green:0.49 blue:0.22 alpha:1],
        [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1],
        [UIColor colorWithRed:0.62 green:0.37 blue:0.92 alpha:1],
        [UIColor colorWithRed:1 green:0.48 blue:0.41 alpha:1],
        
        [UIColor colorWithRed:1 green:0.68 blue:0.33 alpha:1],
        [UIColor colorWithRed:0 green:0.68 blue:0.93 alpha:1],
        [UIColor colorWithRed:1 green:0.47 blue:0.64 alpha:1],
        [UIColor colorWithRed:0 green:0.18 blue:0.24 alpha:1],
        [UIColor colorWithRed:0.05 green:0.22 blue:0.09 alpha:1],
        [UIColor colorWithRed:0.38 green:0.06 blue:0.06 alpha:1]
    ];
    
    int counter = 0;
    for (UIView *colorView in self.rowOne.subviews) {
        [colorView.subviews.firstObject setBackgroundColor:colors[counter]];
        ++counter;
    }
    
    for (UIView *colorView in self.rowTwo.subviews) {
        [colorView.subviews.firstObject setBackgroundColor:colors[counter]];
        ++counter;
    }

}
-(void)setupButton{
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source{
    return [[HalfPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end



