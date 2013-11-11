
-(void)setupMainView
{
    
    UINib *CartonCellNib = [UINib nibWithNibName:@"CartonCell" bundle:nil];
    
    [self.collectionView registerNib:CartonCellNib forCellWithReuseIdentifier:@"CartonCell"];
    
    //    self.collectionView.frame = CGRectMake(0, 64+122, ScreenWidth, 345);
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setItemSize:CGSizeMake(100, 150)];
    
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:layout];
    
}
#pragma mark - UICollectionViewDataSource Method----------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *cellArray = [self.dataArray objectAtIndex:section];
    
    return [cellArray count];
    //    return [_toyModel];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSMutableArray *cellArray = [self.dataArray objectAtIndex:indexPath.section];
    //    NSString *cellString = [cellArray objectAtIndex:indexPath.row];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CartonCell" forIndexPath:indexPath];
    
    UILabel *lable;
    UIImageView *paintingView,*modelView;
    
    lable = (UILabel *)[cell viewWithTag:10];
    paintingView = (UIImageView *)[cell viewWithTag:5];
    modelView = (UIImageView *)[cell viewWithTag:6];
    
    //    lable.text = _toyModel.owner;
    //    paintingView.image = [UIImage imageWithURL:_toyModel.paintingURL];
    //    modelView.image = [UIImage imageWithURL:_toyModel.modelURL];
    
    //    imageView.image = [UIImage imageNamed:@"01.png"];
    
    return cell;
}
//#pragma mark - UICollectionViewDelegate Method----------------



