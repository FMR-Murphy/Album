//
//  AlbumViewModel.m
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import "AlbumViewModel.h"

#import "AlbumNetWorkManager.h"
#import <YYModel/YYModel.h>
#import "AlbumModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface AlbumViewModel ()

@property (nonatomic, copy)NSString * searchString;
@property (nonatomic, assign) NSInteger pageNum;

@end

@implementation AlbumViewModel


- (void)searchWithText:(NSString *)text {
    self.searchString = text;
    self.pageNum = 0;
    [self loadData];
}

- (void)loadData {
    AlbumNetWorkManager * netWork = [AlbumNetWorkManager share];
    
    @weakify(self);
    [[netWork getDataWithParameters:@{@"q":self.searchString,@"sn":@(self.pageNum),@"pn":@"50"}] then:^id _Nullable(NSDictionary * _Nullable value) {
        @strongify(self);
        AlbumListModel * listModel = [AlbumListModel yy_modelWithDictionary:value];
        
        if (self.pageNum != 0) {
            NSArray * array = [self.listModel.list arrayByAddingObjectsFromArray:listModel.list];
            self.listModel.list = array;
        } else {
            self.listModel = listModel;
        }
        
        return nil;
    }];
}



@end
