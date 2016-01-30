//
//  PieChart.m
//  PieChart
//
//  Created by Donovan Cotter on 1/30/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "PieChart.h"

@implementation PieChart

-(id) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //Set up colorSlices
        NSArray *colorSlices = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.25], [NSNumber numberWithFloat:0.25], [NSNumber numberWithFloat:0.25], [NSNumber numberWithFloat:0.25], nil];
        
        self.sliceArray = colorSlices;
        
        //set up the colors for the colorSlices
        NSArray *colors = [NSArray arrayWithObjects:
                           (id)[UIColor yellowColor].CGColor,
                           (id)[UIColor blueColor].CGColor,
                           (id)[UIColor redColor].CGColor,
                           (id)[UIColor greenColor].CGColor, nil];
        
        self.colorsArray = colors;
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect {
    
    //get the current graphics context so Quartz can draw into it, and pass that context to our drawPieChart method.
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawPieChart:context];
    
}

- (void)drawPieChart:(CGContextRef)context  {
    CGPoint circleCenter = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    // Set the radius of your pie chart
    self.circleRadius = 100;
    
    for (NSUInteger i = 0; i < [self.sliceArray count]; i++) {
        NSLog(@"%lu", i);
        // Determine start angle
        CGFloat startValue = 0;
        for (int k = 0; k < i; k++) {
            startValue += [[self.sliceArray objectAtIndex:k] floatValue];
        }
        CGFloat startAngle = startValue * 2 * M_PI - M_PI/2;
        
        // Determine end angle
        CGFloat endValue = 0;
        for (int j = (int)i; j >= 0; j--) {
            endValue += [[self.sliceArray objectAtIndex:j] floatValue];
        }
        
        CGFloat endAngle = endValue * 2 * M_PI - M_PI/2;
        
        NSObject *o = [self.colorsArray objectAtIndex:i];
        
        NSLog(@"array index: %lu", (unsigned long)[self.colorsArray indexOfObject:o]);

        CGContextSetFillColorWithColor(context, (CGColorRef)[self.colorsArray objectAtIndex:i]);
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
        CGContextAddArc(context, circleCenter.x, circleCenter.y, self.circleRadius, startAngle, endAngle, 0);
        CGContextClosePath(context);
        CGContextFillPath(context);
    }
}

@end