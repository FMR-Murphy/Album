//
//  ViewController.m
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import "ViewController.h"


#import <PromisesObjC/FBLPromises.h>
#import "AlbumViewModel.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "LZSwipeableView.h"
#import "AlbumViewCell.h"
#import "AlbumModel.h"

@interface ViewController () <LZSwipeableViewDelegate, LZSwipeableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) AlbumViewModel * viewModel;
@property (nonatomic, strong) UISearchBar * searchBar;
@property (nonatomic, strong) LZSwipeableView * swipeableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    [self bindSignal];
    
    [self.viewModel searchWithText:@"汉堡包"];
    
}

- (void)bindSignal {
    @weakify(self);
    
    [[[RACObserve(self, viewModel.listModel) deliverOnMainThread] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.swipeableView reloadData];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.searchBar.searchTextField resignFirstResponder];
}

- (void)createUI {
    [self.view addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.height.equalTo(@44);
    }];
    
    [self.view addSubview:self.swipeableView];
//    [self.swipeableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@20);
//        make.right.equalTo(@-20);
//        make.top.equalTo(self.searchBar.mas_bottom).offset(30);
//        make.height.equalTo(@400);
//    }];
}


#pragma mark - LZSwipeableViewDelegate | LZSwipeableViewDataSource
- (NSInteger)swipeableViewNumberOfRowsInSection:(LZSwipeableView *)swipeableView {
    
    return self.viewModel.listModel.list.count;
}

- (LZSwipeableViewCell *)swipeableView:(LZSwipeableView *)swipeableView cellForIndex:(NSInteger)index {
    AlbumViewCell * cell = [swipeableView dequeueReusableCellWithIdentifier:NSStringFromClass([AlbumViewCell class])];
    cell.model = self.viewModel.listModel.list[index];
    return cell;
}

- (NSInteger)swipeableViewMaxCardNumberWillShow:(LZSwipeableView *)swipeableView {
    return 3;
}

- (void)swipeableView:(LZSwipeableView *)swipeableView didLastCardShow:(LZSwipeableViewCell *)cell {
    
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.viewModel searchWithText:self.searchBar.searchTextField.text];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.viewModel searchWithText:self.searchBar.searchTextField.text];
}

#pragma mark - lazy
- (AlbumViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[AlbumViewModel alloc] init];
    }
    return _viewModel;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _searchBar.placeholder = @"请输入～";
        _searchBar.backgroundColor = [UIColor grayColor];
        _searchBar.delegate = self;
        
    }
    return _searchBar;
}

- (LZSwipeableView *)swipeableView {
    if (!_swipeableView) {
        _swipeableView = [[LZSwipeableView alloc] initWithFrame:CGRectMake(30, 150, [UIScreen mainScreen].bounds.size.width - 60, 450)];
        _swipeableView.delegate = self;
        _swipeableView.datasource = self;
        [_swipeableView registerClass:[AlbumViewCell class] forCellReuseIdentifier:NSStringFromClass([AlbumViewCell class])];
        _swipeableView.backgroundColor = [UIColor whiteColor];
    }
    return _swipeableView;
}
@end
