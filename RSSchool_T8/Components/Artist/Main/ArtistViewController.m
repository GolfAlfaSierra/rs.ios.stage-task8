//
//  MainViewController.m
//  RSSchool_T8
//
//  Created by John Kent on 16.07.2021.
//

#import "ArtistViewController.h"
#import "UIColor+AppColor.h"
#import "NSMutableArray+Shuffle.h"
#import "CanvasView.h"
#import "PalleteViewController.h"
#import "RSSchool_T8-Swift.h"
#import "BaseButton.h"


@class DrawingViewController;
@interface ArtistViewController ()

{
    NSMutableArray *selectedColors;
}
@property (weak, nonatomic) IBOutlet CanvasView *canvas;
@property (weak, nonatomic) IBOutlet BaseButton *ShareButton;
@property (weak, nonatomic) IBOutlet BaseButton *TimerButton;
@property (weak, nonatomic) IBOutlet BaseButton *PaletteButton;
@property (weak, nonatomic) IBOutlet BaseButton *DrawButton;



@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    
    selectedColors = [NSMutableArray arrayWithArray:@[UIColor.blackColor, UIColor.blackColor, UIColor.blackColor]];
    
    self.timerValue = 1;
    self.drawing = DrawingHead;
    
    
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"app-timer-saved" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@",note);
        
        
        self->_timerValue = 0 ; // TODO
    }];
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"app-drawing-saved" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@",note);
        
        NSString *drawi = (NSString*)[note object];
        
        if ([drawi isEqualToString:@"Head"]) {
            self->_drawing = DrawingHead;
        }
        if ([drawi isEqualToString:@"Planet"]) {
            self->_drawing = DrawingPlanet;
        }
        if ([drawi isEqualToString:@"Landscape"]) {
            self->_drawing = DrawingLandscape;
        }
        if ([drawi isEqualToString:@"Tree"]) {
            self->_drawing = DrawingTree;
        }
        
//        self->_drawing =  ;// TODO
    }];
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"app-color-saved" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@",note);
        
        self->selectedColors = [note object] ;
    }];
    
    
    
    
    
    
    
    
    
    
    
    [self.PaletteButton addTarget:self action:@selector(showPallete) forControlEvents:UIControlEventTouchUpInside];
    [self.DrawButton addTarget:self action:@selector(drawImage) forControlEvents:UIControlEventTouchUpInside];
    [self.ShareButton setEnabled:NO];
    [self.TimerButton addTarget:self action:@selector(showTimer) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
}


- (void)setLayersStrokeEndTo:(float)strokeEnd {
    _canvas.strokeLayer1.strokeEnd = strokeEnd;
    _canvas.strokeLayer2.strokeEnd = strokeEnd;
    _canvas.strokeLayer3.strokeEnd = strokeEnd;
}



-(void)drawImage{
    if ([self.DrawButton.titleLabel.text isEqualToString:@"Reset"]) {
        
        [self.DrawButton setEnabledState];
        [self.ShareButton setDisabledState];
        [self.PaletteButton setEnabledState];
        [self.TimerButton setEnabledState];
        
        [self setLayersStrokeEndTo:0];
        
        
        return;
    }
    
    
    [self.DrawButton setDisabledState];
    [self.ShareButton setDisabledState];
    [self.PaletteButton setDisabledState];
    [self.TimerButton setDisabledState];
    
    
    
    
    
    
    [selectedColors shuffle];
    switch (_drawing) {
            
        case DrawingTree:
            [_canvas drawTreeWithColors:selectedColors];
            break;
        case DrawingLandscape:
            [_canvas drawLandscapeWithColors:selectedColors];
            break;
        case DrawingPlanet:
            [_canvas drawPlanetWithColors:selectedColors];
            break;
        case DrawingHead:
            [_canvas drawHeadWithColors:selectedColors];
            break;
        default:
            break;
    }
    
    
    [_redrawTimer invalidate];
    [self setLayersStrokeEndTo:0];
    __block float stroke = 0;
    _redrawTimer = [NSTimer scheduledTimerWithTimeInterval:0.01667 repeats:YES block:^(NSTimer * _Nonnull timer) {
        stroke += (0.01667 / self->_timerValue);
        [self setLayersStrokeEndTo:stroke];
        if (stroke >= 1)  {
            [timer invalidate];
            
            
            [self.DrawButton setEnabledState];
            [self.ShareButton setEnabledState];
            self.DrawButton.titleLabel.text = @"Reset";
            
        }
    }];
    
    
}

-(void)showTimer{
    TimerViewController *vc = [[TimerViewController alloc] initWithNibName:@"Timer" bundle:nil];
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    vc.transitioningDelegate = vc;
    
    [self presentViewController:vc animated:YES completion:nil];

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
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings" style:UIBarButtonItemStylePlain target:self action:@selector(showDrawings)];
    
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
    
    //    [self.navigationItem.rightBarButtonItem setTar:@selector(showDrawings)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}


-(void)showDrawings{
    DrawingViewController *vc = [[DrawingViewController alloc] initWithNibName:@"Drawing" bundle:nil];

    [vc setDrawingWithDraw:self.drawing];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
