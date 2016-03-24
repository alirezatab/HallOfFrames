//
//  CustomView.m
//  HallOfFrames
//
//  Created by ALIREZA TABRIZI on 3/23/16.
//  Copyright © 2016 AR-T.com, Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (IBAction)onButtonPress:(UIButton *)sender {
    [self.customViewDelegate colorButtonPress:sender];
}

- (IBAction)onSliderChanged:(UISlider *)sender {
    [self.customViewDelegate sliderChanged:sender];

}

@end
