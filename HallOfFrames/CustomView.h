//
//  CustomView.h
//  HallOfFrames
//
//  Created by ALIREZA TABRIZI on 3/23/16.
//  Copyright © 2016 AR-T.com, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate
@optional
-(void) colorButtonPress:(UIButton *)button;
@end

@interface CustomView : UIView
@property (nonatomic, assign) id<CustomViewDelegate> customViewDelegate;

@end
