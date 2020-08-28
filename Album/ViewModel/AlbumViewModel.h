//
//  AlbumViewModel.h
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import <Foundation/Foundation.h>

@class AlbumListModel;

NS_ASSUME_NONNULL_BEGIN

@interface AlbumViewModel : NSObject

@property (nonatomic, strong) AlbumListModel * listModel;

- (void)searchWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
