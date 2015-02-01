#import <Cedar-iOS/Cedar-iOS.h>
#import "BooksViewController.h"
#import "BookCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BooksViewControllerSpec)

describe(@"BooksViewController", ^{
    __block BooksViewController *subject;

    beforeEach(^{
        subject = [[BooksViewController alloc] init];
        subject.view should_not be_nil;
        [subject.tableView reloadData];
    });
    
    it(@"should list 5 books", ^{
        subject.tableView.visibleCells.count should equal(5);
    });
    
    it(@"should initially not show details for any book", ^{
        [subject.tableView layoutIfNeeded];
        for (BookCell *cell in subject.tableView.visibleCells) {
            cell.detailContainerView.frame.size.height should be_close_to(0.f);
        }
    });
    
    describe(@"tapping on a cell", ^{
        __block NSIndexPath *indexPath;
        __block BookCell *openCell;
        __block UITableViewCell *originalCell;
        
        beforeEach(^{
            indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            spy_on(subject.tableView);
            
            originalCell = [subject.tableView cellForRowAtIndexPath:indexPath];
            
            [subject.tableView selectRowAtIndexPath:indexPath
                                           animated:NO
                                     scrollPosition:UITableViewScrollPositionMiddle];
            
            [subject.tableView.delegate tableView:subject.tableView
                          didSelectRowAtIndexPath:indexPath];
            
            openCell = (id)[subject.tableView cellForRowAtIndexPath:indexPath];
        });
        
        it(@"should reload the cell", ^{
            openCell should_not be_same_instance_as(originalCell);
            
//            TODO: revisit this. Difficult to test since we don't control instatiation of it.
//            openCell should have_received(@selector(animateOpen));
        });
        
        it(@"should animate the new cell open", ^{
            openCell.frame.size.height should be_greater_than(originalCell.frame.size.height);
        });
        
        it(@"should expand the details on the cell", ^{
            openCell.detailContainerView.frame.size.height should be_greater_than(0);
        });
        
        describe(@"tapping the cell again", ^{
            __block BookCell *closedCell;
            
            beforeEach(^{
                spy_on(openCell);
                [(id <CedarDouble>)subject.tableView reset_sent_messages];
                [subject.tableView selectRowAtIndexPath:indexPath
                                               animated:NO
                                         scrollPosition:UITableViewScrollPositionMiddle];
                [subject.tableView.delegate tableView:subject.tableView
                              didSelectRowAtIndexPath:indexPath];
                
                closedCell = (id)[subject.tableView cellForRowAtIndexPath:indexPath];
            });
            
            
            it(@"should animate the old cell closed", ^{
                openCell should have_received(@selector(animateClosed));
                closedCell.frame.size.height should be_less_than(openCell.frame.size.height);
                closedCell.detailContainerView.frame.size.height should be_close_to(0.f);
            });
            
            it(@"should reload the cell", ^{
                closedCell should_not be_same_instance_as(openCell);

                subject.tableView should have_received(@selector(reloadRowsAtIndexPaths:withRowAnimation:)).with(@[indexPath], UITableViewRowAnimationNone);
            });

        });
    });
});

SPEC_END
