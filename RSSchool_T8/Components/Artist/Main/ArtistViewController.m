//
//  MainViewController.m
//  RSSchool_T8
//
//  Created by John Kent on 16.07.2021.
//

#import "ArtistViewController.h"
#import "UIColor+AppColor.h"
#import "CanvasView.h"
#import "PalleteViewController.h"

@interface ArtistViewController ()
@property (weak, nonatomic) IBOutlet CanvasView *canvas;
@property (weak, nonatomic) IBOutlet UIButton *ShareButton;
@property (weak, nonatomic) IBOutlet UIButton *TimerButton;
@property (weak, nonatomic) IBOutlet UIButton *PaletteButton;
@property (weak, nonatomic) IBOutlet UIButton *DrawButton;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    
    
    
    
    [self.PaletteButton addTarget:self action:@selector(showPallete) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.ShareButton setEnabled:NO];
    
    // Do any additional setup after loading the view.
}




-(void)showPallete{
    
    PalleteViewController *vc = [[PalleteViewController alloc] initWithNibName:@"Pallete" bundle:nil];
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    vc.transitioningDelegate = vc;
    
    [self presentViewController:vc animated:YES completion:nil];
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