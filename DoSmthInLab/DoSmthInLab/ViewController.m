//
//  ViewController.m
//  DoSmthInLab
//
//  Created by Евгений Сергеев on 26.02.15.
//  Copyright (c) 2015 Евгений Сергеев. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat leftBorderOfView;
}

@end

@implementation ViewController

@synthesize TopLayer = _TopLayer;
@synthesize layerPosition = _layerPosition;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    leftBorderOfView = 60;
    [self.myButton setTitle:@"show" forState:UIControlStateNormal];
    self.layerPosition = self.TopLayer.frame.origin.x;
}

- (void)animateLayerToPoint: (CGFloat)x
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
        CGRect frame = self.TopLayer.frame;
        frame.origin.x = x;
        self.TopLayer.frame = frame;
    } completion:^(BOOL finished) {
        self.layerPosition = self.TopLayer.frame.origin.x;
    }];
}

- (IBAction)clicked:(id)sender {
    UIButton *button = sender;
    if ([button.titleLabel.text isEqualToString:@"show"]) {
        [self moveBack:-60];
    } else if ([button.titleLabel.text isEqualToString:@"hide"]){
        [self moveRight:leftBorderOfView];
    }
}
-(void)moveRight:(CGFloat)transition{
    [UIView animateWithDuration:0.5 animations:^{
        [self.myButton setTitle:@"show" forState:UIControlStateNormal];
        CGRect rect = self.TopLayer.frame;
        self.TopLayer.frame = CGRectMake(0,rect.origin.y, rect.size.width, rect.size.height);
    }];
}
-(void)moveBack:(CGFloat)transition{
    [UIView animateWithDuration:0.5 animations:^{
        [self.myButton setTitle:@"hide" forState:UIControlStateNormal];
        CGRect rect = self.TopLayer.frame;
        self.TopLayer.frame = CGRectMake(leftBorderOfView, rect.origin.y, rect.size.width, rect.size.height);
    }];
}

- (IBAction)panLayer:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [pan translationInView:self.TopLayer];
        CGRect frame = self.TopLayer.frame;
        frame.origin.x = self.layerPosition + point.x;
        if (frame.origin.x < 0) frame.origin.x = 0;
        self.TopLayer.frame = frame;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.TopLayer.frame.origin.x <= 60) {
            [self.myButton setTitle:@"show" forState:UIControlStateNormal];
            [self animateLayerToPoint:0];
        } else {
            [self.myButton setTitle:@"hide" forState:UIControlStateNormal];
            [self animateLayerToPoint:60];
        }
    }
}

@end
