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
@property UIColor *colorIfCancelled;
@property float redSliderFloat;
@property float blueSliderFloat;
@property float greenSliderFloat;

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
   
    Picture *picture = [self.pictureArray objectAtIndex:self.lastSelectedIndexPath.row];
        
    if ([button.titleLabel.text isEqualToString:@"Red"]) {
        self.color = [UIColor redColor];
        picture.frameColor = self.color;
        [self.collectionView reloadData];

        
    } else if ([button.titleLabel.text isEqualToString:@"Green"]) {
        self.color = [UIColor greenColor];
        picture.frameColor = self.color;
        [self.collectionView reloadData];


    } else if ([button.titleLabel.text isEqualToString:@"Blue"]) {
        self.color = [UIColor blueColor];
        picture.frameColor = self.color;
        [self.collectionView reloadData];


    } else if ([button.titleLabel.text isEqualToString:@"Done"]) {
        [self.customView removeFromSuperview];

        
    } else if ([button.titleLabel.text isEqualToString:@"Cancel"]) {
        picture.frameColor = self.colorIfCancelled;
        [self.collectionView reloadData];
        [self.customView removeFromSuperview];
    } else {
        
    }
    
}

-(void)sliderChanged:(UISlider *)slider {
    Picture *picture = [self.pictureArray objectAtIndex:self.lastSelectedIndexPath.row];
    
    if ([slider.accessibilityLabel isEqualToString:@"Red"]) {
        slider.thumbTintColor  = [UIColor colorWithHue:1.0 saturation:(slider.value) brightness:1.0 alpha:1.0];
        self.redSliderFloat = slider.value;
        
    } else if ([slider.accessibilityLabel isEqualToString:@"Green"]) {
        slider.thumbTintColor  = [UIColor colorWithHue:(100/360.f) saturation:(slider.value) brightness:1.0 alpha:1.0];
        self.greenSliderFloat = slider.value;
        
    } else if ([slider.accessibilityLabel isEqualToString:@"Blue"]) {
        slider.thumbTintColor  = [UIColor colorWithHue:(215 /360.f) saturation:(slider.value) brightness:1.0 alpha:1.0];
        self.blueSliderFloat = slider.value;
    }
        
    picture.frameColor = [UIColor colorWithRed:self.redSliderFloat green:self.greenSliderFloat blue:self.blueSliderFloat alpha:1];
    [self.collectionView reloadData];
    
    

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.customView = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    self.customView.customViewDelegate = self;
    self.lastSelectedIndexPath = indexPath;
    self.customView.frame = self.view.frame;
    self.customView.blurView.layer.cornerRadius = 30;
    self.customView.blurView.clipsToBounds = YES;
    [self.view addSubview:self.customView];
    
    //ensures that whatever happen in the popup, the color set can be reversed on cancel
     Picture *picture = [self.pictureArray objectAtIndex:self.lastSelectedIndexPath.row];
    self.colorIfCancelled = picture.frameColor;
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
