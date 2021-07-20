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
        
        id num = [note.userInfo valueForKey:@"time"];
        
        float number = [[NSNumber numberWithDouble:[num floatValue]] floatValue];

        
        self->_timerValue = number;
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
        }[note.userInfo valueForKey:@"time"];
    }];
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"app-color-saved" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@",note);
        
        self->selectedColors = [note object] ;
    }];
    
    
    
    
    
    
    
    
    
    
    
    [self.PaletteButton addTarget:self action:@selector(showPallete) forControlEvents:UIControlEventTouchUpInside];
    [self.DrawButton addTarget:self action:@selector(drawImage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.ShareButton addTarget:self action:@selector(shareImage) forControlEvents:UIControlEventTouchUpInside];
    [self.TimerButton addTarget:self action:@selector(showTimer) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.ShareButton setDisabledState];
    
    
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
        
        [self.DrawButton setTitle:@"Draw" forState:UIControlStateNormal];
        
        
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

            
            [self.ShareButton setEnabledState];
            
            self.DrawButton.layer.shadowRadius   = 2.0;
            self.DrawButton.layer.shadowColor    = [[UIColor blackColor] CGColor];
            self.DrawButton.layer.shadowOpacity  = 0.25;
            self.DrawButton.alpha                = 1;
            self.DrawButton.titleLabel.textColor = [UIColor lightGreenSeaColor];
            self.DrawButton.userInteractionEnabled = YES;
            [self.DrawButton setEnabled:YES];
            
            
            [self.DrawButton setTitle:@"Reset" forState:UIControlStateNormal];
            
        }
    }];
    
    
}

-(void)showTimer{
    TimerViewController *vc = [[TimerViewController alloc] initWithNibName:@"Timer" bundle:nil];
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    vc.transitioningDelegate = vc;
    [vc setTimerSliderValueWithVal:_timerValue];
    
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

-(void)shareImage{
    UIGraphicsBeginImageContext(_canvas.frame.size);
    [_canvas.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *canvasImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *pngData = UIImagePNGRepresentation(canvasImage);
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[pngData] applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
