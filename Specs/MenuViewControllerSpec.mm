#import <Cedar-iOS/Cedar-iOS.h>
#import "MenuViewController.h"
#import "BooksViewController.h"
#import "SimpleViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(MenuViewControllerSpec)

describe(@"MenuViewController", ^{
    __block MenuViewController *subject;
    __block UINavigationController *navController;

    beforeEach(^{
        subject = [[MenuViewController alloc] init];
        navController = [[UINavigationController alloc] initWithRootViewController:subject];
        subject.view should_not be_nil;
        [subject.tableView reloadData];
    });
    
    describe(@"the first option", ^{
        __block NSIndexPath *indexPath;
        __block UITableViewCell *cell;
        beforeEach(^{
            indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            cell = [subject.tableView cellForRowAtIndexPath:indexPath];
        });
        
        it(@"should have the 'Simple Fold' title", ^{
            cell.textLabel.text should equal(@"Simple View Fold");
        });
        
        describe(@"tapping the Simple Fold option", ^{
            beforeEach(^{
                [subject.tableView selectRowAtIndexPath:indexPath
                                               animated:NO
                                         scrollPosition:UITableViewScrollPositionMiddle];
                [subject.tableView.delegate tableView:subject.tableView
                              didSelectRowAtIndexPath:indexPath];
            });
            it(@"should push a SimpleViewController", ^{
                navController.topViewController should be_instance_of([SimpleViewController class]);
                navController.topViewController.view should_not be_nil;
                navController.topViewController.title should equal(@"Simple View Fold");
            });
        });
        
    });
    
    describe(@"the second option", ^{
        __block NSIndexPath *indexPath;
        __block UITableViewCell *cell;
        beforeEach(^{
            indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
            cell = [subject.tableView cellForRowAtIndexPath:indexPath];
        });
        
        it(@"should have the 'Simple Fold' title", ^{
            cell.textLabel.text should equal(@"Foldable UITableViewCells");
        });
        
        describe(@"tapping the UITableViewCell option", ^{
            beforeEach(^{
                [subject.tableView selectRowAtIndexPath:indexPath
                                               animated:NO
                                         scrollPosition:UITableViewScrollPositionMiddle];
                [subject.tableView.delegate tableView:subject.tableView
                              didSelectRowAtIndexPath:indexPath];
            });
            it(@"should push a SimpleViewController", ^{
                navController.topViewController should be_instance_of([BooksViewController class]);
                navController.topViewController.view should_not be_nil;
                navController.topViewController.title should equal(@"Foldable UITableViewCells");
            });
        });
        
    });
});

SPEC_END
