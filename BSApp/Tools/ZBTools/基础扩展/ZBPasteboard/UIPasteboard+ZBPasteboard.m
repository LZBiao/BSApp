//
//  UIPasteboard+ZBPasteboard.m
//  BSApp
//
//  Created by lizb on 2017/11/30.
//  Copyright © 2017年 lizb. All rights reserved.
//

#import "UIPasteboard+ZBPasteboard.h"

@implementation UIPasteboard (ZBPasteboard)

+ (void)copyString:(NSString *)string{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = string;
    NSString *st = [NSString stringWithFormat:@"复制完成：%@",pasteboard.string];
    [ZBHud initWithStr:st hideAfter:0.8 view:[UIApplication sharedApplication].keyWindow];
}

@end
