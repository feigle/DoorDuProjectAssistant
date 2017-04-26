//
//  PAAfterSaleTaskHandlingViewController.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/25.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAAfterSaleTaskHandlingViewController.h"
#import "PAAfterSaleTaskHandlingCollectionViewCell.h"
#import "PAAfterSaleTaskHandlingFlowLayout.h"

@interface PAAfterSaleTaskHandlingViewController ()

@property (nonatomic,strong) PAAfterSaleTaskHandlingFlowLayout * flowLayout;
/**展示页数*/
@property (nonatomic,strong) UILabel * showPageNumberLabel;

@end

@implementation PAAfterSaleTaskHandlingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor orangeColor];
    
    [self configUI];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
    self.showPageNumberLabel.top = (self.collectionView.height-820/2.0*kScreen6ScaleH)/2.0+820/2.0*kScreen6ScaleH+10*kScreen6ScaleH;
}

- (void)configUI
{
    [self.view addSubview:self.collectionView];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    [self.collectionView registerClass:[PAAfterSaleTaskHandlingCollectionViewCell class] forCellWithReuseIdentifier:@"PAAfterSaleTaskHandlingCollectionViewCell"];
    [self.view addSubview:self.showPageNumberLabel];
    self.customLayout = self.flowLayout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count+10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PAAfterSaleTaskHandlingCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PAAfterSaleTaskHandlingCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - 滑动判断，显示页数
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint pInView = [self.collectionView.superview convertPoint:self.collectionView.center toView:self.collectionView];
    // 通过坐标获取对应的indexpath
    NSIndexPath *indexPathNow = [self.collectionView indexPathForItemAtPoint:pInView];
    NSString * showPageStr = [NSString stringWithFormat:@"%ld/%ld",indexPathNow.row+1,self.dataArray.count+10];
    self.showPageNumberLabel.text = showPageStr;
}

#pragma mark - 懒加载
- (UILabel *)showPageNumberLabel
{
    if (!_showPageNumberLabel) {
        _showPageNumberLabel = [ControlManager lableFrame:CGRectMake(0, 0, KScreenWidth, font6Size(28/2.0).lineHeight) title:@"" font:font6Size(28/2.0) textColor:ColorHex(@"#999999") textAligment:NSTextAlignmentCenter];
    }
    return _showPageNumberLabel;
}

- (PAAfterSaleTaskHandlingFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout =[[PAAfterSaleTaskHandlingFlowLayout alloc]init];
        //1.1.布局item,设置item的大小
        _flowLayout.itemSize =CGSizeMake(KScreenWidth-60*kScreen6ScaleW, KScreenHeight*3/5-20);
        _flowLayout.itemSize =CGSizeMake(KScreenWidth-60*kScreen6ScaleW, 820/2.0*kScreen6ScaleH);
        //1.2.设置item的间距离
        _flowLayout.minimumInteritemSpacing = 15*kScreen6ScaleW;
        _flowLayout.minimumLineSpacing = 15*kScreen6ScaleW;
        _flowLayout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
        CGFloat oneX =self.view.center.x -_flowLayout.itemSize.width *0.5;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, oneX, 0, oneX);
    }
    return _flowLayout;
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
