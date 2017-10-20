



//
//  HeHuoRenViewController.m
//  Running
//
//  Created by Admin on 2017/10/20.
//  Copyright © 2017年 吕志杰. All rights reserved.
//
#import "HeHuoRenCell.h"
#import "HeHuoRenViewController.h"

@interface HeHuoRenViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UINib *nib;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@end

@implementation HeHuoRenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"合伙人";
     nib =  [UINib nibWithNibName:@"HeHuoRenViewController" bundle:nil];
    [self.collection registerNib:[UINib nibWithNibName:@"HeHuoRenCell" bundle:nil] forCellWithReuseIdentifier:@"CellID"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
//
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(90,100);
}


- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];

    return cell;
}



























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
