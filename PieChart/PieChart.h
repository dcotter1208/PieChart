//
//  PieChart.h
//  PieChart
//
//  Created by Donovan Cotter on 1/30/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieChart : UIView

@property (nonatomic, assign) CGFloat circleRadius;
@property (nonatomic, retain) NSArray *sliceArray;
@property (nonatomic, retain) NSArray *colorsArray;

-(void)drawPieChart: (CGContextRef)context;


@end
