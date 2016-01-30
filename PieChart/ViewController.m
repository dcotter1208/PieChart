//
//  ViewController.m
//  PieChart
//
//  Created by Donovan Cotter on 1/30/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "ViewController.h"
#import "PieChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PieChart *pieChart = [[PieChart alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pieChart.center = [super.view center];
//
//    PieChart *pieChart = [[PieChart alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pieChart.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pieChart];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
