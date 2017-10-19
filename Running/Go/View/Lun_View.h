//
//  Lun_View.h
//  Running
//
//  Created by 吕志杰 on 2017/8/31.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lun_View : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic) UICollectionView *CollectionView;
@property (strong,nonatomic) UICollectionViewFlowLayout *collectionLayout;
@property (strong,nonatomic) NSMutableArray *title_array;
@end
