//
//  BooksViewController.m
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/31/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import "BooksViewController.h"
#import "BookCell.h"

static NSString * const kBookCellIdentifier = @"kBookCellIdentifier";

@interface BooksViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *bookDescriptions;
@property (strong, nonatomic) NSArray *bookTitles;
@end

@implementation BooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([BookCell class]) bundle:nil];
    [self.tableView registerNib:cellNib
         forCellReuseIdentifier:kBookCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bookTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:kBookCellIdentifier];
    cell.bookTitleLabel.text = self.bookTitles[indexPath.row];
    return cell;
}

#pragma mark - Private

- (NSArray *)bookTitles {
    if (!_bookTitles) {
        _bookTitles = [self.bookDescriptions allKeys];
    }
    return _bookTitles;
}

- (NSDictionary *)bookDescriptions {
    if (!_bookDescriptions) {
       _bookDescriptions = @{
          @"Harry Potter and the Deathly Hallows": @"The final book in the Harry Potter series.",
          @"The Blind Assasin": @"The Blind Assassin opens with these simple, resonant words: \"Ten days after the war ended, my sister Laura drove a car off a bridge.\" They are spoken by Iris, whose terse account of her sister's death in 1945 is followed by an inquest report proclaiming the death accidental. ",
          @"Special Topics in Calamity Physics": @"At the center of Special Topics in Calamity Physics is clever, deadpan Blue van Meer, who has a head full of literary, philosophical, scientific, and cinematic knowledge. But she could use some friends. Upon entering the elite St. Gallway School, she finds some—a clique of eccentrics known as the Bluebloods. One drowning and one hanging later, Blue finds herself puzzling out a byzantine murder mystery. ",
          @"Moby Dick" : @"This book is a whale of a good time!",
          @"Great Gatsby" : @"The book that inspired thousands of obliviously themed parties!",
          };
    }
    return _bookDescriptions;
}


@end
