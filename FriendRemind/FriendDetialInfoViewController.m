//
//  FriendDetialInfoViewController.m
//  FriendRemind
//
//  Created by renfrank on 15/7/21.
//  Copyright (c) 2015年 frank. All rights reserved.
//

#import "FriendDetialInfoViewController.h"
#import "BirthDayUtil.h"
@interface FriendDetialInfoViewController ()

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *birthdayLabel;
@property(nonatomic,strong) UILabel *howLongLabel;
@end

@implementation FriendDetialInfoViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _nameLabel = [[UILabel alloc] init];
        _birthdayLabel = [[UILabel alloc] init];
        _howLongLabel = [[UILabel alloc] init];
    }
    return self;
}

-(void)loadView
{
    UIView *view = [[UIView alloc] init];
    
    self.view = view;
    
    self.view.backgroundColor = [UIColor whiteColor];
    //init the birthday Content view
    UIView *birthView = [[UIView alloc] init];
    
    [self.view addSubview:birthView];
    
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.nameLabel];
    
    [self.view addSubview:self.howLongLabel];
    
    //create the birthDayLabelTitle
    UILabel *birthDayTitle = [[UILabel alloc] init];
    
    birthDayTitle.text = @"生日";
    
    [birthView addSubview:birthDayTitle];
    
    [birthView addSubview:self.birthdayLabel];
    
    NSDictionary *dicView = @{@"imageView":self.imageView};
    
    /*This is imageView constraints.*/
    NSArray *widthConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[imageView(150)]" options:0 metrics:nil views:dicView];
    
    NSArray *heightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView(150)]" options:0 metrics:nil views:dicView];
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:widthConstraint];
    
    [self.view addConstraints:heightConstraint];
    
    //垂直居中
    /*[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];*/
    
    
    /* why this code is error?*/
    /*[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0]];*/
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:0.25 constant:0]];
    
    //水平居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    /*This is nameLabel autolayout constraints*/
    NSArray *nameLabelVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView]-30-[nameLabel]" options:0 metrics:nil views:@{@"imageView":self.imageView,@"nameLabel":self.nameLabel}];
    
    
    NSLayoutConstraint *nameLabelHConstraints = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:nameLabelVConstraints];
    
    [self.view addConstraint:nameLabelHConstraints];
    
    //This is birthView autolayout constraints

    birthView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *birthViewVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[nameLabel]-20-[birthView]" options:0 metrics:nil views:@{@"nameLabel":self.nameLabel,@"birthView":birthView}];
    
    NSLayoutConstraint *birthViewHConstraints = [NSLayoutConstraint constraintWithItem:birthView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    [self.view addConstraints:birthViewVConstraints];
    
    [self.view addConstraint:birthViewHConstraints];
    //This is birthDayTitle and birthdayLabel autolayout constraints.
    birthDayTitle.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.birthdayLabel.translatesAutoresizingMaskIntoConstraints = NO;

    NSArray *birthDayHConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[birthDayTitle]-10-[birthDay]-0-|" options:0 metrics:nil views:@{@"birthDayTitle":birthDayTitle,@"birthDay":self.birthdayLabel}];
    
    NSArray *birthDayVConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[birthDayTitle]-0-|" options:0 metrics:nil views:@{@"birthDayTitle":birthDayTitle}];
    
    NSArray *birthDayVConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[birthDay]-0-|" options:0 metrics:nil views:@{@"birthDay":self.birthdayLabel}];
    
    [birthView addConstraints:birthDayHConstraints];
    
    [birthView addConstraints:birthDayVConstraints1];
    
    [birthView addConstraints:birthDayVConstraints2];
    
    self.howLongLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *howLongVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[birthView]-[howLongLabel]" options:0 metrics:nil views:@{@"birthView":birthView,@"howLongLabel":self.howLongLabel}];
    
    NSLayoutConstraint *howLongHConstraints = [NSLayoutConstraint constraintWithItem:self.howLongLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.view addConstraints:howLongVConstraints];
    
    [self.view addConstraint:howLongHConstraints];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"详细信息";
    self.imageView.image = [[UIImage alloc] initWithData:self.friend.friendImg];
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width * 0.1;
    self.imageView.layer.borderWidth = 0.5;
    self.imageView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.nameLabel.text = self.friend.name;
    
    self.birthdayLabel.text = self.friend.birthday;
    
    BirthDayUtil *util = [BirthDayUtil new];
    
    NSString *temp = [util howlongFromDate:self.friend.birthday];
    
    self.howLongLabel.text = [NSString stringWithFormat:@"距离生日还有：%@ 天",temp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
