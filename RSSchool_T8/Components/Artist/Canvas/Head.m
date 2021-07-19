//
//  Head.m
//  RSSchool_T8
//
//  Created by John Kent on 19.07.2021.
//

#import "Head.h"

@interface Head ()
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (nonatomic) CGFloat from;
@property (nonatomic) CGFloat to;
@property (nonatomic) BOOL animating;
@end

@implementation Head
+(void)strokeOneWithColor:(UIColor*)color{
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    if (color != nil) {
        strokeColor = color;
    }
    
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(54.5, 20)];
    [bezierPath addLineToPoint: CGPointMake(70, 80)];
    [bezierPath addLineToPoint: CGPointMake(82, 103)];
    [bezierPath addLineToPoint: CGPointMake(99.5, 122.5)];
    [bezierPath addLineToPoint: CGPointMake(126.5, 145)];
    [bezierPath addLineToPoint: CGPointMake(150, 150.5)];
    [bezierPath addLineToPoint: CGPointMake(186, 133)];
    [bezierPath addLineToPoint: CGPointMake(213, 103)];
    [bezierPath addLineToPoint: CGPointMake(221.5, 91)];
    [bezierPath addLineToPoint: CGPointMake(221.5, 68.5)];
    [bezierPath addLineToPoint: CGPointMake(223.5, 41.5)];
    [bezierPath addLineToPoint: CGPointMake(211.5, 31.5)];
    [bezierPath addLineToPoint: CGPointMake(195, 34.5)];
    [bezierPath addLineToPoint: CGPointMake(184, 51.5)];
    [bezierPath addLineToPoint: CGPointMake(182, 74.5)];
    [bezierPath addLineToPoint: CGPointMake(186, 87)];
    [strokeColor setStroke];
    bezierPath.lineWidth = 1;
    bezierPath.miterLimit = 4;
    bezierPath.lineCapStyle = kCGLineCapRound;
    [bezierPath stroke];
}
+(void)strokeTwo:(UIColor*)color{
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    if (color != nil) {
        strokeColor = color;
    }
    
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(177, 91)];
    [bezier2Path addLineToPoint: CGPointMake(168.5, 89.5)];
    [bezier2Path addLineToPoint: CGPointMake(159, 91.5)];
    [bezier2Path addLineToPoint: CGPointMake(151, 92.5)];
    [bezier2Path addLineToPoint: CGPointMake(141.5, 91.5)];
    [bezier2Path addLineToPoint: CGPointMake(133, 90)];
    [bezier2Path addLineToPoint: CGPointMake(126.5, 89.5)];
    [bezier2Path addLineToPoint: CGPointMake(119, 91)];
    [bezier2Path addLineToPoint: CGPointMake(114.5, 93)];
    [bezier2Path addLineToPoint: CGPointMake(120.5, 95.5)];
    [bezier2Path addLineToPoint: CGPointMake(125, 99)];
    [bezier2Path addLineToPoint: CGPointMake(129.5, 104)];
    [bezier2Path addLineToPoint: CGPointMake(135.5, 106.5)];
    [bezier2Path addLineToPoint: CGPointMake(143, 107.5)];
    [bezier2Path addLineToPoint: CGPointMake(150, 106.5)];
    [bezier2Path addLineToPoint: CGPointMake(157.5, 107.5)];
    [bezier2Path addLineToPoint: CGPointMake(163.5, 106.5)];
    [bezier2Path addLineToPoint: CGPointMake(170, 102.5)];
    [bezier2Path addLineToPoint: CGPointMake(177, 94.5)];
    [bezier2Path addLineToPoint: CGPointMake(181.5, 88.5)];
    [bezier2Path addLineToPoint: CGPointMake(173.5, 87.5)];
    [bezier2Path addLineToPoint: CGPointMake(164.5, 86.5)];
    [bezier2Path addLineToPoint: CGPointMake(155.5, 84.5)];
    [bezier2Path addLineToPoint: CGPointMake(147, 84)];
    [bezier2Path addLineToPoint: CGPointMake(137, 85.5)];
    [bezier2Path addLineToPoint: CGPointMake(128, 87.5)];
    [bezier2Path addLineToPoint: CGPointMake(118, 88.5)];
    [bezier2Path addLineToPoint: CGPointMake(111, 88)];
    [bezier2Path addLineToPoint: CGPointMake(120.5, 82)];
    [bezier2Path addLineToPoint: CGPointMake(129.5, 75.5)];
    [bezier2Path addLineToPoint: CGPointMake(135.5, 72)];
    [bezier2Path addLineToPoint: CGPointMake(140.5, 73.5)];
    [bezier2Path addLineToPoint: CGPointMake(146, 75.5)];
    [bezier2Path addLineToPoint: CGPointMake(152.5, 74.5)];
    [bezier2Path addLineToPoint: CGPointMake(159, 73.5)];
    [bezier2Path addLineToPoint: CGPointMake(164.5, 73.5)];
    [bezier2Path addLineToPoint: CGPointMake(167.5, 75.5)];
    [bezier2Path addLineToPoint: CGPointMake(172.5, 80.5)];
    [bezier2Path addLineToPoint: CGPointMake(180, 85)];
    [strokeColor setStroke];
    bezier2Path.lineWidth = 1;
    bezier2Path.miterLimit = 4;
    bezier2Path.lineCapStyle = kCGLineCapRound;
    [bezier2Path stroke];
}
+(void)strokeThree:(UIColor*)color{
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    if (color != nil) {
        strokeColor = color;
    }
    
    
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(182.5, 93.5)];
    [bezier3Path addLineToPoint: CGPointMake(187, 99.5)];
    [bezier3Path addLineToPoint: CGPointMake(189.5, 106)];
    [bezier3Path addLineToPoint: CGPointMake(186, 115)];
    [bezier3Path addLineToPoint: CGPointMake(179, 123.5)];
    [bezier3Path addLineToPoint: CGPointMake(170, 130.5)];
    [bezier3Path addLineToPoint: CGPointMake(160.5, 123.5)];
    [bezier3Path addLineToPoint: CGPointMake(150, 119.5)];
    [bezier3Path addLineToPoint: CGPointMake(140.5, 119.5)];
    [bezier3Path addLineToPoint: CGPointMake(128.5, 123.5)];
    [bezier3Path addLineToPoint: CGPointMake(120.5, 133)];
    [bezier3Path addLineToPoint: CGPointMake(114, 145.5)];
    [bezier3Path addLineToPoint: CGPointMake(102.5, 138.5)];
    [bezier3Path addLineToPoint: CGPointMake(94.5, 128.5)];
    [bezier3Path addLineToPoint: CGPointMake(86, 119.5)];
    [bezier3Path addLineToPoint: CGPointMake(86, 133)];
    [bezier3Path addLineToPoint: CGPointMake(86, 161.5)];
    [bezier3Path addLineToPoint: CGPointMake(86, 178.5)];
    [bezier3Path addLineToPoint: CGPointMake(79, 190)];
    [bezier3Path addLineToPoint: CGPointMake(67.5, 198.5)];
    [bezier3Path addLineToPoint: CGPointMake(56.5, 205.5)];
    [bezier3Path addLineToPoint: CGPointMake(74, 212)];
    [bezier3Path addLineToPoint: CGPointMake(87.5, 220.5)];
    [bezier3Path addLineToPoint: CGPointMake(98, 234.5)];
    [bezier3Path addLineToPoint: CGPointMake(112, 252)];
    [bezier3Path addLineToPoint: CGPointMake(131, 270)];
    [bezier3Path addLineToPoint: CGPointMake(150, 276.5)];
    [bezier3Path addLineToPoint: CGPointMake(164, 276.5)];
    [bezier3Path addLineToPoint: CGPointMake(179, 268.5)];
    [bezier3Path addLineToPoint: CGPointMake(192.5, 252)];
    [bezier3Path addLineToPoint: CGPointMake(202.5, 230.5)];
    [bezier3Path addLineToPoint: CGPointMake(212, 214.5)];
    [bezier3Path addLineToPoint: CGPointMake(226.5, 208)];
    [bezier3Path addLineToPoint: CGPointMake(230, 208)];
    [bezier3Path addLineToPoint: CGPointMake(223.5, 192.5)];
    [bezier3Path addLineToPoint: CGPointMake(214, 164)];
    [bezier3Path addLineToPoint: CGPointMake(212, 141)];
    [bezier3Path addLineToPoint: CGPointMake(212, 117.5)];
    [bezier3Path addLineToPoint: CGPointMake(205, 128.5)];
    [bezier3Path addLineToPoint: CGPointMake(197, 136.5)];
    [bezier3Path addLineToPoint: CGPointMake(189.5, 145.5)];
    [bezier3Path addLineToPoint: CGPointMake(173, 161.5)];
    [bezier3Path addLineToPoint: CGPointMake(163, 176)];
    [bezier3Path addLineToPoint: CGPointMake(154.5, 197.5)];
    [bezier3Path addLineToPoint: CGPointMake(151.5, 223.5)];
    [bezier3Path addLineToPoint: CGPointMake(151.5, 252)];
    [bezier3Path addLineToPoint: CGPointMake(151.5, 270)];
    [strokeColor setStroke];
    bezier3Path.lineWidth = 1;
    bezier3Path.miterLimit = 4;
    bezier3Path.lineCapStyle = kCGLineCapRound;
    [bezier3Path stroke];

}

- (void)drawRect:(CGRect)rect{
    
    
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
    [Head strokeOneWithColor:nil];
    [Head strokeTwo:nil];
    [Head strokeThree:nil];
}




- (void)startAnimation
{
    if (self.displayLink == nil) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick)];
        
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                               forMode:NSDefaultRunLoopMode];
    }
}

- (void)tick
{
    
}

@end
