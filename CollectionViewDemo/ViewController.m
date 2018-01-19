//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by icrdcyy on 2018/1/19.
//  Copyright © 2018年 yu. All rights reserved.
//

#import "ViewController.h"
//#define KCellId @"ID_CELL"

static NSString *const reuseIdentifier = @"ID_CELL";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // set the top,column,bottom
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collect.delegate   = self;
    collect.dataSource = self;
    
    
    collect.backgroundColor = [UIColor grayColor];
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:collect];
    
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
    
}
-(CGSize) collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*) collectionViewLayout
          sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake(60,60);
}

-(UICollectionViewCell*) collectionView:(UICollectionView*) collectionView
                 cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
 
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                           forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0
                                           green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    cell.layer.cornerRadius = 30;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
