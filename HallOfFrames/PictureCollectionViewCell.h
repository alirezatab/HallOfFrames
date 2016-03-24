//
//  PictureCollectionViewCell.h
//  HallOfFrames
//
//  Created by ALIREZA TABRIZI on 3/23/16.
//  Copyright © 2016 AR-T.com, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PictureCollectionViewCellDelegate
@end
@interface PictureCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
