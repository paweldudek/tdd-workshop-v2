#import "Specs.h"

#import "AgendaViewController.h"
#import "AgendaProvider.h"
#import "AgendaCollectionViewDataSource.h"

SPEC_BEGIN(AgendaViewController)

describe(@"AgendaViewController", ^{
    __block AgendaViewController *viewController;

    beforeEach(^{
        viewController = [[AgendaViewController alloc] init];
    });

    afterEach(^{
        viewController = nil;
    });

    describe(@"title", ^{
        it(@"should be set to 'Agenda'", ^{
            expect(viewController.title).to.equal(@"Agenda");
        });
    });

    describe(@"tab bar item", ^{
        __block UITabBarItem *item;

        beforeEach(^{
            item = [viewController tabBarItem];
        });

        it(@"should have a agenda image", ^{
            expect(item.selectedImage).to.equal([UIImage imageNamed:@"agenda"]);
        });

        it(@"should have a 'Agenda' title", ^{
            expect(item.title).to.equal(@"Agenda");
        });
    });

    describe(@"loaded collection view", ^{
        __block UICollectionView *collectionView;

        beforeEach(^{
            [viewController loadView];
            [viewController viewDidLoad];

            collectionView = viewController.collectionView;
        });

        it(@"should have white background color", ^{
            expect(collectionView.backgroundColor).to.equal([UIColor whiteColor]);
        });

        it(@"should always bounce verticaly", ^{
            expect(collectionView.alwaysBounceVertical).to.beTruthy();
        });

        it(@"should should be inseted by 10 px from top and bottom", ^{
            expect(collectionView.contentInset).to.equal(UIEdgeInsetsMake(10, 0, 10, 0));
        });
    });

    describe(@"subviews layout", ^{
        beforeEach(^{
            [viewController viewDidLayoutSubviews];
        });

        it(@"should update item size", ^{
            UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) viewController.collectionViewLayout;
            expect(flowLayout.itemSize).to.equal(CGSizeMake(CGRectGetWidth(viewController.view.bounds), 66));
        });
    });

    describe(@"setup", ^{
        it(@"should initialize agenda provider", ^{
            expect(viewController.agendaProvider).notTo.beNil();
        });

        it(@"should initialize agenda data source", ^{
            expect(viewController.agendaDataSource).notTo.beNil();
        });

        it(@"should initialize agenda data source with agenda provider", ^{
            expect(viewController.agendaDataSource.agendaProvider).to.equal(viewController.agendaProvider);
        });
    });
});

SPEC_END