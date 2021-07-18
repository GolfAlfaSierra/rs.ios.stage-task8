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

@end

@implementation PalleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [self.view setBackgroundColor:UIColor.redColor];
    [self.view.layer setCornerRadius:40];
    [self.closeButton addTarget:self action:@selector(setupButton) forControlEvents:UIControlEventTouchUpInside];
    
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



