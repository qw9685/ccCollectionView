//
//  firstViewController.m
//  ccCollectionView
//
//  Created by mac on 2019/8/30.
//  Copyright © 2019 cc. All rights reserved.
//

#import "firstViewController.h"
#import "ccCollectionView.h"
#import "firstCollectionViewCell.h"
#import "firstCollectionReusableHeadView.h"
#import "firstCollectionReusableFootView.h"

@interface firstViewController ()

@property (nonatomic,strong) ccCollectionView *collectionView;

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义cell";
    
    [self.view addSubview:self.collectionView];
}

-(ccCollectionView *)collectionView{
        if (_collectionView == nil) {
            _collectionView = [[ccCollectionView alloc] initCollectionViewWithItemClass:[firstCollectionViewCell class] headClass:[firstCollectionReusableHeadView class] footClass:[firstCollectionReusableFootView class]];
            _collectionView.layout.headerReferenceSize = CGSizeMake(500, 66);
            _collectionView.layout.footerReferenceSize = CGSizeMake(500, 10);
            
            _collectionView.cc_sizeForItemAtIndexPath(^CGSize(UICollectionViewLayout * _Nonnull layout, NSIndexPath * _Nonnull indexPath) {
                
                return CGSizeMake(100, 110*2);
                
            }).cc_CollectionDidSelectRowAtIndexPath(^(NSIndexPath * _Nonnull indexPath, UICollectionView * _Nonnull collectionView) {
                
            }).cc_CollectionviewForElementOfKind(^UICollectionReusableView * _Nonnull(NSIndexPath * _Nonnull indexPath, NSString * _Nonnull kind, UICollectionView * _Nonnull collectionView) {
                //头部
               if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
                   firstCollectionReusableHeadView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier: NSStringFromClass([firstCollectionReusableHeadView class]) forIndexPath:indexPath];
                   view.backgroundColor = [UIColor yellowColor];
                return view;
               }else{
                    firstCollectionReusableFootView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier: NSStringFromClass([firstCollectionReusableFootView class]) forIndexPath:indexPath];
                    view.backgroundColor = [UIColor blackColor];
                   return view;
               }
            }).cc_CollectionNumberOfSections(^NSInteger(UICollectionView * _Nonnull collectionView) {
                return 3;
            }).cc_CollectionNumberOfRows(^NSInteger(NSInteger section, UICollectionView * _Nonnull collectionView) {
                return 5;
            }).cc_CollectionViewForCell(^UICollectionViewCell * _Nonnull(NSIndexPath * _Nonnull indexPath, UICollectionView * _Nonnull collectionView) {
                firstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([firstCollectionViewCell class]) forIndexPath:indexPath];
                cell.backgroundColor = [UIColor blueColor];
                return cell;
            });
        }
        
        return _collectionView;
}

@end
