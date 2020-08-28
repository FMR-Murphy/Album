//
//  AlbumViewCell.m
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import "AlbumViewCell.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>
#import "AlbumModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface AlbumViewCell ()


@property (nonatomic, strong) UIView * backView;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * label;

@end

@implementation AlbumViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        
        @weakify(self);
        [[[[RACObserve(self, backView.bounds) distinctUntilChanged] deliverOnMainThread] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
            CGRect bounds = [x CGRectValue];
            @strongify(self);
            

            self.backView.layer.backgroundColor = [UIColor whiteColor].CGColor;
            self.backView.layer.shadowColor = [UIColor blackColor].CGColor;
            self.backView.layer.shadowOpacity = 0.5;
            self.backView.layer.shadowRadius = 10;
            self.backView.layer.shadowOffset = CGSizeMake(5, 5);
            self.backView.layer.shadowPath = [UIBezierPath bezierPathWithRect:bounds].CGPath;
            
        }];
        
    }
    return self;
}


- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.backView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
    }];
    
    [self.backView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
        make.bottom.equalTo(@-10);
    }];
    
}

- (void)setModel:(AlbumModel *)model {
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.label.text = model.src;
}

#pragma mark - lazy
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
    }
    return _backView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.backgroundColor = [UIColor orangeColor];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 2;
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
