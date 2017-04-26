//
//  DDCollectionViewController.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "HttpRequestViewController.h"

@interface DDCollectionViewController : HttpRequestViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

/**必须是流式布局才这样用*/
@property (nonatomic,strong) UICollectionViewLayout *customLayout;

@property (nonatomic,assign) UICollectionViewScrollDirection collectionDirection;


@end
