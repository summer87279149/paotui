//
//  Lun_View.m
//  Running
//
//  Created by 吕志杰 on 2017/8/31.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Lun_View.h"
#import "Go_Buy_CollectionViewCell.h"

@implementation Lun_View

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.title_array = [NSMutableArray array];
        [self add_collrctiobview];
    }
    return self;
}

- (void)add_collrctiobview
{
    _collectionLayout = [[UICollectionViewFlowLayout alloc]init];
    _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, 180) collectionViewLayout:_collectionLayout];
    _CollectionView.backgroundColor = [UIColor whiteColor];
    _CollectionView.delegate = self;
    _CollectionView.dataSource = self;
    [_CollectionView registerNib:[UINib nibWithNibName:@"Go_Buy_CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"buy_cell"];
    [self addSubview:_CollectionView];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/4-16, 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(4, 4,4, 4);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Go_Buy_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"buy_cell" forIndexPath:indexPath];
    cell.title_lab.text = self.title_array[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

@end
