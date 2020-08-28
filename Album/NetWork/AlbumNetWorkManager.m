//
//  AlbumNetWorkManager.m
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import "AlbumNetWorkManager.h"

#import <AFNetworking/AFNetworking.h>
#import <PromisesObjC/FBLPromises.h>

#define BaseUrl @"https://image.so.com/j?"

@interface AlbumNetWorkManager ()



@end

@implementation AlbumNetWorkManager

+ (instancetype)share {
    static AlbumNetWorkManager * netWork = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWork = [[AlbumNetWorkManager alloc] init];
    });
    return netWork;
}

- (FBLPromise<NSDictionary *> *)getDataWithParameters:(NSDictionary *)urlParameters {
    return [self getFromUrl:BaseUrl parameters:urlParameters];
}

- (FBLPromise<NSDictionary *> *)getFromUrl:(NSString *)path parameters:(NSDictionary *)urlParameters {
    
    return [FBLPromise async:^(FBLPromiseFulfillBlock  _Nonnull fulfill, FBLPromiseRejectBlock  _Nonnull reject) {
        
        AFHTTPSessionManager * manager = [self manager];
        
        [manager GET:path parameters:urlParameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSString * receiveStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            NSData* data = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError * error;
            NSDictionary*jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            if (error) {
                reject(error);
            }
            fulfill(jsonDict);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            reject(error);
        }];
    }];
}

- (AFHTTPSessionManager *)manager {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return  manager;
}


@end
