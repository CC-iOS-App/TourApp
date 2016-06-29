//
//  XMBaiduAccount.m
//  XMTour
//
//  Created by 梁亦明 on 15/3/21.
//  Copyright (c) 2015年 xiaoming. All rights reserved.
//

#import "XMBaiduAccount.h"
#import "NSString+Hash.h"

@implementation XMBaiduAccount
-(instancetype) initWithContent:(NSString *)content fromLanguageCode:(NSString*)fromCode toLanguageCode:(NSString *)toCode
{
    if (self = [super init]) {
        self.app_id = @"20160430000019961";
        self.salt = @"20160501";
        self.key = @"XBw3fNU35VTOXKrZwlIS";
//        self.url = @"http://openapi.baidu.com/public/2.0/bmt/translate";
        self.url = @"http://api.fanyi.baidu.com/api/trans/vip/translate";
        
        self.fromCode = fromCode;
        self.toCode = toCode;
        self.content = content;
        // 获取sign
        NSString *sign = [NSString stringWithFormat:@"%@%@%@%@",self.app_id,self.content,self.salt,self.key];
        self.sign = sign.md5String;
    }
    return self;
}
+(instancetype) accountWithContent:(NSString *)content fromLanguageCode:(NSString*)fromCode toLanguageCode:(NSString *)toCode
{
    return [[self alloc] initWithContent:content fromLanguageCode:fromCode toLanguageCode:toCode];
}

-(NSMutableDictionary *) accountDict
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"appid"] = self.app_id;
    dict[@"q"] = self.content;
    dict[@"from"] = self.fromCode;
    dict[@"to"] = self.toCode;
    dict[@"salt"] = self.salt;
    dict[@"sign"] = self.sign;
    return dict;
}
@end
