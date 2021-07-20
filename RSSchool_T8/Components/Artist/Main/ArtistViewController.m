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
#import "RSSchool_T8-Swift.h"


@class DrawingViewController;
@interface ArtistViewController ()

{
    NSArray *selectedColors;
}
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
    
    selectedColors = @[UIColor.blackColor, UIColor.blackColor, UIColor.blackColor];
    self.timerValue = 1;
    self.drawing = DrawingHead;
    
    
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"app-timer-saved" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@",note);
        
        
        self->_timerValue = 0 ; // TODO
    }];
    
    [NSNotificationCenter.defaultCenter addObserverForName:@"app-drawing-saved" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@",note);
        
        self->_drawing = DrawingHead ;// TODO
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
    
    
    [_canvas drawHeadWithColors:selectedColors];
    [_redrawTimer invalidate];
    [self setLayersStrokeEndTo:0];
    __block float stroke = 0;
    _redrawTimer = [NSTimer scheduledTimerWithTimeInterval:0.01667 repeats:YES block:^(NSTimer * _Nonnull timer) {
        stroke += (0.01667 / self->_timerValue);
        [self setLayersStrokeEndTo:stroke];
        if (stroke >= 1)  {
            [timer invalidate];
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

    
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
