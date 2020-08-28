//
//  AlbumModel.m
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import "AlbumModel.h"
#import <YYModel/YYModel.h>


@implementation AlbumModel



@end

@implementation AlbumListModel

- (NSDictionary *)modelCustomPropertyMapper {
    return  @{};
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"list":[AlbumModel class],
    };
}

@end
