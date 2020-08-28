//
//  AlbumViewCell.h
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import "LZSwipeableView.h"

@class AlbumModel;

NS_ASSUME_NONNULL_BEGIN

@interface AlbumViewCell : LZSwipeableViewCell

@property (nonatomic, strong) AlbumModel * model;

@end

NS_ASSUME_NONNULL_END
