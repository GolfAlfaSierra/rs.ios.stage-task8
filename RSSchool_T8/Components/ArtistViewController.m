//
//  MainViewController.m
//  RSSchool_T8
//
//  Created by John Kent on 16.07.2021.
//

#import "ArtistViewController.h"
#import "UIColor+AppColor.h"

@interface ArtistViewController ()

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    
    // Do any additional setup after loading the view.
}

-(void)setupNavigation{
    
    const UIFont *font = [UIFont fontWithName:@"Montserrat-Regular" size:17];
    
    
    
    // Title
    [self setTitle:@"Artist"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     font, NSFontAttributeName,
                                                                     nil]];
    
    // Drawing button
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [barButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           font, NSFontAttributeName,
                                           [UIColor lightGreenSeaColor], NSForegroundColorAttributeName,
                                           nil]
                                 forState:UIControlStateNormal];
    [barButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           font, NSFontAttributeName,
                                           [UIColor lightGreenSeaColor], NSForegroundColorAttributeName,
                                           nil]
                                 forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}


@end
