//
//  ViewController.m
//  ccCollectionView
//
//  Created by mac on 2019/8/27.
//  Copyright © 2019 cc. All rights reserved.
//

#import "ViewController.h"
#import "ccCollectionView.h"
#import "firstViewController.h"

@interface ViewController ()

@property (nonatomic,strong) ccCollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"默认的collectionView";
    
    [self.view addSubview:self.collectionView];
}

-(ccCollectionView *)collectionView{
        if (_collectionView == nil) {
            _collectionView = [[ccCollectionView alloc] initCollectionViewWithItemClass:[UICollectionViewCell class] headClass:nil footClass:nil];
            _collectionView.frame = self.view.bounds;
            _collectionView.layout.sectionInset = UIEdgeInsetsMake(15, 15, 30, 15);
            _collectionView.layout.itemSize = CGSizeMake(100, 100);
            _collectionView.layout.minimumInteritemSpacing = 15;
            _collectionView.layout.minimumLineSpacing = 15;
            _collectionView.cc_CollectionDidSelectRowAtIndexPath(^(NSIndexPath * _Nonnull indexPath, UICollectionView * _Nonnull collectionView) {
                
                [self.navigationController pushViewController:[firstViewController new] animated:YES];
                
            }).cc_CollectionNumberOfRows(^NSInteger(NSInteger section, UICollectionView * _Nonnull collectionView) {
                
                return 5;
                
            }).cc_CollectionViewForCell(^UICollectionViewCell * _Nonnull(NSIndexPath * _Nonnull indexPath, UICollectionView * _Nonnull collectionView) {
                
                UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
                
                UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
                label.text = @"自定义cell";
                label.backgroundColor = [UIColor redColor];
                [cell addSubview:label];
                return cell;
            });
        }
        
        return _collectionView;
}

@end
