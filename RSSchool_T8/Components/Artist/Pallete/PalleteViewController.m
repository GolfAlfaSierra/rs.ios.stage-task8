//
//  PalleteViewController.m
//  RSSchool_T8
//
//  Created by John Kent on 18.07.2021.
//

#import "PalleteViewController.h"
#import "HalfPresentationController.h"
#import "ColorButton.h"


@interface PalleteViewController ()
{
    NSMutableArray *selectedColors;
}
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIView *rowOne;
@property (weak, nonatomic) IBOutlet UIView *rowTwo;

//@property (strong, nonatomic) NSMutableArray *selectedColors;



@end

@implementation PalleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupColors];
    
    if (selectedColors == nil) {
        selectedColors = [NSMutableArray array];
    }
    
    
    
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"app-Color" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@", [note object]);
        
        ColorButton *button = [note object];
        UIColor *color = [button getColor];
        BOOL checked = [button isChecked];
        
        if (checked) {
            [self addColor:button];
        } else {
            [self removeColor:color];
            [button setUnChecked];
        }
        
        
//        NSLog(@"%@", [button getColor]);
        
//        [button isChecked];
    }];
    
    
//    [self.view setBackgroundColor:UIColor.redColor];
    
    [self.closeButton addTarget:self action:@selector(setupButton) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)addColor:(ColorButton*)colorButton{
    [selectedColors addObject:colorButton];
    if (selectedColors.count > 3) {
        [selectedColors.firstObject setUnChecked];
        [selectedColors removeObjectAtIndex:0];
    }
}

-(void)removeColor:(UIColor*)color{
    [selectedColors removeObject:color];
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
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"app-colors-saved" object:selectedColors];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source{
    return [[HalfPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end



