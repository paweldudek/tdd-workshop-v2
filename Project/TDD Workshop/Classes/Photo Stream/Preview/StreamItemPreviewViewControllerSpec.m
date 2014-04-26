#import "Specs.h"
#import "StreamItemPreviewViewController.h"
#import "StreamItemPreviewLayout.h"
#import "StreamItem.h"

SPEC_BEGIN(StreamItemPreviewViewControllerSpec)
describe(@"StreamItemPreviewViewController", ^{

    __block StreamItemPreviewViewController *streamItemPreviewViewController;

    beforeEach(^{
        streamItemPreviewViewController = [StreamItemPreviewViewController new];
    });

    afterEach(^{
        streamItemPreviewViewController = nil;
    });

    describe(@"when view is loaded", ^{

        __block UICollectionView *collectionView;

        beforeEach(^{
            collectionView = (UICollectionView *) streamItemPreviewViewController.view;
        });

        it(@"should view is collection view kind", ^{
            expect(streamItemPreviewViewController.view).to.beKindOf([UICollectionView class]);
        });

        it(@"should view has white background", ^{
            expect(streamItemPreviewViewController.view.backgroundColor).to.equal([UIColor whiteColor]);
        });

        it(@"should have custom layout", ^{
            expect(collectionView.collectionViewLayout).to.beKindOf([StreamItemPreviewLayout class]);
        });

        it(@"should have horizontally scrolled view", ^{
            StreamItemPreviewLayout *layout = (StreamItemPreviewLayout *) collectionView.collectionViewLayout;
            expect(layout.scrollDirection).to.equal(UICollectionViewScrollDirectionHorizontal);
        });

        it(@"should have data source set", ^{
            expect(collectionView.dataSource).to.equal(streamItemPreviewViewController);
        });


    });

    describe(@"when intiliazed with items", ^{

        __block NSArray *items;
        __block UICollectionView *collectionView;

        beforeEach(^{
            items = @[[StreamItem new], [StreamItem new]];
            streamItemPreviewViewController = [[StreamItemPreviewViewController alloc] initWithStreamItems:items];
            collectionView = (UICollectionView *) streamItemPreviewViewController.view;
        });

        it(@"should return number of cell equal to count of items", ^{
            expect([streamItemPreviewViewController collectionView:collectionView numberOfItemsInSection:0]).to.equal([items count]);
        });

        it(@"should return cell for each item", ^{
            for (NSInteger j = 0; j < [items count]; j++) {
                NSIndexPath *path = [NSIndexPath indexPathForItem:j inSection:0];
                expect([streamItemPreviewViewController collectionView:collectionView cellForItemAtIndexPath:path]).notTo.beNil();
            }
        });
        
    });
    


});
SPEC_END