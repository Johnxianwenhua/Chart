//
//  Dhc_HomePageController.h
//  Fortune
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CyclicAnnular;

@interface Dhc_HomePageController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet CyclicAnnular *tAnnularView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tAnnularConstraints;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIStackView *tCountSortView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tColloctionViewConstraints;

@end

