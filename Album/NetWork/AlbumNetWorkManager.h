//
//  AlbumNetWorkManager.h
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import <Foundation/Foundation.h>

#import <PromisesObjC/FBLPromises.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlbumNetWorkManager : NSObject

+ (instancetype)share;

- (FBLPromise<NSDictionary *> *)getDataWithParameters:(NSDictionary *)urlParameters;

@end

NS_ASSUME_NONNULL_END
