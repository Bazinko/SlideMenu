//
//  ViewController.h
//  DoSmthInLab
//
//  Created by Евгений Сергеев on 26.02.15.
//  Copyright (c) 2015 Евгений Сергеев. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *TopLayer;
@property (nonatomic) CGFloat layerPosition;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
- (IBAction)clicked:(id)sender;

@end

