//
//  GoodsModel.h
//  WebView-JS
//
//  Created by wushangkun on 16/4/20.
//  Copyright © 2016年 wushangkun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

// 需要遵守JSExport协议
@protocol GoodsModelProtocol <JSExport>
-(void)selectGoodsId:(NSString *)goodsId withPrice:(NSString *)price;

@end

@interface GoodsModel : NSObject <GoodsModelProtocol>

@end
