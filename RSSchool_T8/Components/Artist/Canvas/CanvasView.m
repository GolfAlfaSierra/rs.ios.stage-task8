//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by John Kent on 17.07.2021.
//

#import "CanvasView.h"
#import "UIColor+AppColor.h"
#import "Head.h"
#import "Tree.h"
#import "Planet.h"
#import "Landscape.h"

@implementation CanvasView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _strokeLayer1 = [[CAShapeLayer alloc] init];
        _strokeLayer2 = [[CAShapeLayer alloc] init];
        _strokeLayer3 = [[CAShapeLayer alloc] init];
    }
    return self;
}


- (void)drawHeadWithColors:(NSArray<UIColor*>*)colors {
    NSMutableArray<UIColor*> *kolors = [NSMutableArray arrayWithArray:colors];
    
    while ([kolors count] < 3) {
        UIColor *col = [UIColor blackColor];
        
        [kolors addObject:col];
    }
    
    [self.strokeLayer1 removeFromSuperlayer];
    [self.strokeLayer2 removeFromSuperlayer];
    [self.strokeLayer3 removeFromSuperlayer];
    
    self.strokeLayer1.strokeEnd = 0;
    self.strokeLayer1.path = [Head getHeadChinVector].CGPath;
    self.strokeLayer1.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer1.strokeColor = kolors[0].CGColor;
    self.strokeLayer1.lineWidth = 1.0;
    self.strokeLayer1.position = CGPointMake(61.5, 29);
    
    self.strokeLayer2.strokeEnd = 0;
    self.strokeLayer2.path = [Head getLipsHeadVector].CGPath;
    self.strokeLayer2.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer2.strokeColor = kolors[1].CGColor;
    self.strokeLayer2.lineWidth = 1.0;
    self.strokeLayer2.position = CGPointMake(118, 81);
    
    self.strokeLayer3.strokeEnd = 0;
    self.strokeLayer3.path = [Head getHeadNeckVector].CGPath;
    self.strokeLayer3.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer3.strokeColor = kolors[2].CGColor;
    self.strokeLayer3.lineWidth = 1.0;
    self.strokeLayer3.position = CGPointMake(63.5, 102.5);
    
    [self.layer addSublayer:self.strokeLayer1];
    [self.layer addSublayer:self.strokeLayer2];
    [self.layer addSublayer:self.strokeLayer3];
}

- (void)drawTreeWithColors:(NSArray<UIColor*>*)colors {
    NSMutableArray<UIColor*> *kolors = [NSMutableArray arrayWithArray:colors];
    
    while ([kolors count] < 3) {
        UIColor *col = [UIColor blackColor];
        
        [kolors addObject:col];
    }
    
    [self.strokeLayer1 removeFromSuperlayer];
    [self.strokeLayer2 removeFromSuperlayer];
    [self.strokeLayer3 removeFromSuperlayer];
    
    self.strokeLayer1.strokeEnd = 0;
    self.strokeLayer1.lineWidth = 0.5;
    self.strokeLayer1.path = [Tree getGrassVector].CGPath;
    self.strokeLayer1.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer1.strokeColor = colors[0].CGColor;
    self.strokeLayer1.position = CGPointMake(39.5, 246.17);
    
    self.strokeLayer2.strokeEnd = 0;
    self.strokeLayer2.path = [Tree getTreeVector].CGPath;
    self.strokeLayer2.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer2.strokeColor = colors[1].CGColor;
    self.strokeLayer2.position = CGPointMake(50, 145.5);
    
    self.strokeLayer3.strokeEnd = 0;
    self.strokeLayer3.path = [Tree getLeafsVector].CGPath;
    self.strokeLayer3.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer3.strokeColor = colors[2].CGColor;
    self.strokeLayer3.position = CGPointMake(24, 22.5);
    
    
    [self.layer addSublayer:self.strokeLayer1];
    [self.layer addSublayer:self.strokeLayer2];
    [self.layer addSublayer:self.strokeLayer3];
}

- (void)drawLandscapeWithColors:(NSArray<UIColor*>*)colors {
    NSMutableArray<UIColor*> *kolors = [NSMutableArray arrayWithArray:colors];
    
    while ([kolors count] < 3) {
        UIColor *col = [UIColor blackColor];
        
        [kolors addObject:col];
    }
    
    
    
    //TODO: FIX layer addition/removal logic
    [self.strokeLayer1 removeFromSuperlayer];
    [self.strokeLayer2 removeFromSuperlayer];
    [self.strokeLayer3 removeFromSuperlayer];
    
    self.strokeLayer1.strokeEnd = 0;
    self.strokeLayer1.lineWidth = 1.0;
    self.strokeLayer1.path = [Landscape getMountainsVector].CGPath;
    self.strokeLayer1.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer1.strokeColor = colors[0].CGColor;
    self.strokeLayer1.position = CGPointMake(30, 40);
    
    self.strokeLayer2.strokeEnd = 0;
    self.strokeLayer2.lineWidth = 0.5;
    self.strokeLayer2.path = [Landscape getHillsVector].CGPath;
    self.strokeLayer2.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer2.strokeColor = colors[1].CGColor;
    self.strokeLayer2.position = CGPointMake(31.5, 112);
    
    self.strokeLayer3.strokeEnd = 0;
    self.strokeLayer3.lineWidth = 1.0;
    self.strokeLayer3.path = [Landscape getDownhillVector].CGPath;
    self.strokeLayer3.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer3.strokeColor = colors[2].CGColor;
    self.strokeLayer3.position = CGPointMake(28, 154);
    
    [self.layer addSublayer:self.strokeLayer1];
    [self.layer addSublayer:self.strokeLayer2];
    [self.layer addSublayer:self.strokeLayer3];
}

- (void)drawPlanetWithColors:(NSArray<UIColor*>*)colors {
    NSMutableArray<UIColor*> *kolors = [NSMutableArray arrayWithArray:colors];
    
    while ([kolors count] < 3) {
        UIColor *col = [UIColor blackColor];
        
        [kolors addObject:col];
    }
    
    
    
    [self.strokeLayer1 removeFromSuperlayer];
    [self.strokeLayer2 removeFromSuperlayer];
    [self.strokeLayer3 removeFromSuperlayer];
    
    self.strokeLayer1.strokeEnd = 0;
    self.strokeLayer1.lineWidth = 1.0;
    self.strokeLayer1.path = [Planet getAsteroidsVector].CGPath;
    self.strokeLayer1.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer1.strokeColor = colors[0].CGColor;
    self.strokeLayer1.position = CGPointMake(30, 40);
    
    self.strokeLayer2.strokeEnd = 0;
    self.strokeLayer2.lineWidth = 1.0;
    self.strokeLayer2.path = [Planet getWindsVector].CGPath;
    self.strokeLayer2.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer2.strokeColor = colors[1].CGColor;
    self.strokeLayer2.position = CGPointMake(10, 60);
    
    self.strokeLayer3.strokeEnd = 0;
    self.strokeLayer3.lineWidth = 1.0;
    self.strokeLayer3.path = [Planet getPlanetVector].CGPath;
    self.strokeLayer3.fillColor = UIColor.clearColor.CGColor;
    self.strokeLayer3.strokeColor = colors[2].CGColor;
    self.strokeLayer3.position = CGPointMake(24, 60);
    
    [self.layer addSublayer:self.strokeLayer1];
    [self.layer addSublayer:self.strokeLayer2];
    [self.layer addSublayer:self.strokeLayer3];
}




-(void)awakeFromNib{
    [super awakeFromNib];
    
    [[self layer] setCornerRadius:8];
    
    [[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowOpacity:0.25];
    [[self layer] setShadowColor:[UIColor chillSkyColor].CGColor];
    [[self layer] setShadowRadius:8];
    
}

@end
