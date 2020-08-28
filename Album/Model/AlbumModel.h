//
//  AlbumModel.h
//  Album
//
//  Created by Fang on 2020/8/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlbumModel : NSObject

@property (nonatomic, strong) NSString * id;      // "fc43d157216c957872856579dd9b5882",
@property (nonatomic, assign) BOOL qqface_down_url;      // false,
@property (nonatomic, assign) BOOL downurl;      // false,
@property (nonatomic, strong) NSString * downurl_true;      //"https:\/\/dl.image.so.com\/d?imgurl=http%3A%2F%2Fimg1.juimg.com%2F160519%2F330891-16051Z1214388.jpg&purl=http%3A%2F%2Fwww.5671.info%2Fhh%2F%25E6%25B1%2589%25E5%25A0%25A1%25E5%258C%2585%25E8%2596%25AF%25E6%259D%25A1%25E5%258D%25A1%25E9%2580%259A%2F3.html&key=aa63db13db",
@property (nonatomic, assign) BOOL grpmd5;      // false,
@property (nonatomic, assign) NSInteger type;      // 0,
@property (nonatomic, strong) NSString * src;      // "1",
@property (nonatomic, assign) NSInteger color;      // 512,
@property (nonatomic, assign) NSInteger index;      // 0,
@property (nonatomic, strong) NSString * title;      // "\u6c49\u5821\u5305\u85af\u6761\u5361\u901a",
@property (nonatomic, strong) NSString * litetitle;      // "",
@property (nonatomic, assign) NSInteger width;      // "1000",
@property (nonatomic, strong) NSString * height;      // "667",
@property (nonatomic, strong) NSString * imgsize;      // "131KB",
@property (nonatomic, strong) NSString * imgtype;      // "JPEG",
@property (nonatomic, strong) NSString * key;      // "aa63db13db",
@property (nonatomic, strong) NSString * dspurl;      // "www.5671.info",
@property (nonatomic, strong) NSString * link;      // "http:\/\/www.5671.info\/hh\/%E6%B1%89%E5%A0%A1%E5%8C%85%E8%96%AF%E6%9D%A1%E5%8D%A1%E9%80%9A\/3.html",
@property (nonatomic, assign) NSInteger source;      // 10,
@property (nonatomic, strong) NSString * img;      // "http:\/\/img1.juimg.com\/160519\/330891-16051Z1214388.jpg",
@property (nonatomic, strong) NSString * thumb_bak;      // "https:\/\/p5.ssl.qhimgs1.com\/t018375c60b5ffa240f.jpg",
@property (nonatomic, strong) NSString * thumb;      // "https:\/\/p5.ssl.qhimgs1.com\/t018375c60b5ffa240f.jpg",
//@property (nonatomic, strong) NSString * _thumb_bak;      // "https:\/\/p5.ssl.qhimgs1.com\/sdr\/_240_\/t018375c60b5ffa240f.jpg",
//@property (nonatomic, strong) NSString * _thumb;      // "https:\/\/p5.ssl.qhimgs1.com\/sdr\/_240_\/t018375c60b5ffa240f.jpg",
@property (nonatomic, strong) NSString * imgkey;      // "t018375c60b5ffa240f.jpg",
@property (nonatomic, assign) NSInteger thumbWidth;      // 360,
@property (nonatomic, strong) NSString * dsptime;      // "",
@property (nonatomic, assign) NSInteger thumbHeight;      // 240,
@property (nonatomic, strong) NSString * grpcnt;      // "0",
@property (nonatomic, assign) BOOL fixedSize;      // false,
@property (nonatomic, strong) NSString * fnum;      // "0",
@property (nonatomic, strong) NSString * comm_purl;      // ""

@end

@interface AlbumListModel : NSObject


@property (nonatomic, assign) NSInteger total;      // 1500,
@property (nonatomic, assign) BOOL end;      // false,
@property (nonatomic, copy) NSString * sid;      // "9d7ee7000aa57087c3bcf4d691673946",
@property (nonatomic, assign) NSInteger ran;      // 0,
@property (nonatomic, assign) NSInteger ras;      // 6,
@property (nonatomic, assign) NSInteger cuben;      // 0,
@property (nonatomic, assign) NSInteger kn;      // 50,
@property (nonatomic, assign) NSInteger cn;      // 0,
@property (nonatomic, assign) NSInteger gn;      // 0,
@property (nonatomic, assign) NSInteger ps;      // 72,
@property (nonatomic, assign) NSInteger pc;      // 72,
@property (nonatomic, assign) NSInteger adstar;      // 0,
@property (nonatomic, assign) NSInteger lastindex;      // 120,
@property (nonatomic, assign) BOOL ceg;      // false,
@property (nonatomic, copy) NSArray<AlbumModel *> * list;

@end



NS_ASSUME_NONNULL_END
