//
//  ViewController.m
//  HallOfFrames
//
//  Created by ALIREZA TABRIZI on 3/23/16.
//  Copyright © 2016 AR-T.com, Inc. All rights reserved.
//

#import "ViewController.h"
#import "PictureCollectionViewCell.h"
#import "Picture.h"
#import "CustomView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, PictureCollectionViewCellDelegate, CustomViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property CustomView *customView;
@property UIColor *color;
@property NSMutableArray *pictureArray;
@property NSIndexPath *lastSelectedIndexPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    Picture *picture1 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"achaemenidWingedLion"]];
    Picture *picture2 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"Shedu.jpg"]];
    Picture *picture3 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"Basilisk.png"]];
    Picture *picture4 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"cyclops.png"]];
    Picture *picture5 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"Dragon.png"]];
    Picture *picture6 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"phoenix.png"]];
    Picture *picture7 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"Unicorn.png"]];
    
    self.pictureArray = [[NSMutableArray alloc]initWithObjects:picture1, picture2, picture3, picture4, picture5, picture6, picture7, nil];
}

-(void)colorButtonPress:(UIButton *)button {
    if ([button.titleLabel.text isEqualToString:@"Red"]) {
        self.color = [UIColor redColor];
    }else if ([button.titleLabel.text isEqualToString:@"Green"]){
        self.color = [UIColor greenColor];
    }else{
        self.color = [UIColor blueColor];
    }
    Picture *picture = [self.pictureArray objectAtIndex:self.lastSelectedIndexPath.row];
    picture.frameColor = self.color;
    [self.collectionView reloadData];

    [self.customView removeFromSuperview];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.customView = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    self.customView.customViewDelegate = self;
    self.lastSelectedIndexPath = indexPath;
    [self.view addSubview:self.customView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pictureArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    Picture *picture = self.pictureArray[indexPath.row];
    cell.backgroundColor = picture.frameColor;
    cell.imageView.image = picture.image;
    return cell;
}

@end
