//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemPreviewViewController.h"
#import "StreamItem.h"
#import "StreamItemPreviewLayout.h"

NSString *const kCellId = @"CellId";

@interface StreamItemPreviewViewController ()
@property(nonatomic, strong) NSArray *items;
@end


@implementation StreamItemPreviewViewController

#pragma mark - Object life cycle

- (id)initWithStreamItems:(NSArray *)items {
    self = [super init];
    if (self) {
        self.items = items;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                               target:self
                                                                                               action:@selector(doneBarButtonPressed:)];


    }
    return self;
}

#pragma mark - View life cycle

- (void)loadView {
    StreamItemPreviewLayout *layout = [StreamItemPreviewLayout new];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellId];
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    self.view = collectionView;
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Actions

- (void)doneBarButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    StreamItem *streamItem = self.items[(NSUInteger) indexPath.item];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[streamItem image]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.backgroundView = imageView;
    return cell;
}


@end