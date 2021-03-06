//
//  ZBStatusBar.m
//  giseGnmGkapp
//
//  Created by lizb on 2018/8/23.
//  Copyright © 2018年 baothink. All rights reserved.
//

#import "ZBStatusBar.h"

@implementation ZBStatusBar

-(UIView *)statusBar{
    
    
    if (!_statusBar) {
        NSLog(@"systemVersion2_%f,%d",systemVersionFloat,systemVersionInt);
        
        if(systemVersionInt < 13){
            _statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];

        }else{
            
            UIView *_localStatusBar = [[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager performSelector:@selector(createLocalStatusBar)];
            _statusBar = [_localStatusBar performSelector:@selector(statusBar)];
            
            UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].keyWindow.windowScene.statusBarManager;
            id _statusBar = nil;
            if ([statusBarManager respondsToSelector:@selector(createLocalStatusBar)]) {
                UIView *_localStatusBar = [statusBarManager performSelector:@selector(createLocalStatusBar)];
//                for( id vv in _localStatusBar.subviews){
//                    if ([vv isKindOfClass:[UIView class]]){
//                        UIView *fff = (UIView *)vv;
//                        fff.backgroundColor = [UIColor greenColor];
//                    }
//                }
               if ([_localStatusBar respondsToSelector:@selector(statusBar)]) {
                   _statusBar = [_localStatusBar performSelector:@selector(statusBar)];
               }
           }
            
        }

    }
    return _statusBar;
}


#pragma mark - 状态栏 显示状态：显示：NO，隐藏：YES
-(void)setStatusBarHidden:(BOOL)statusBarHidden{
    _statusBar.hidden = statusBarHidden;
}

+(void)statusBarHidden:(BOOL)isHidden{
    UIView *statusBar = [[[ZBStatusBar alloc]init] statusBar];//[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setHidden:)]) {
        statusBar.hidden = isHidden;
    }
}
+(void)statusbarHideWithUIApplication:(BOOL)isHidden{
    [[UIApplication sharedApplication] setStatusBarHidden:isHidden withAnimation:UIStatusBarAnimationNone];
}





#pragma mark - 状态栏 背景颜色
- (void)backgroundColor:(UIColor *)color;{
    [ZBStatusBar backgroundColor:color];
}

+ (void)backgroundColor:(UIColor *)color {
    UIView *statusBar = [[[ZBStatusBar alloc]init] statusBar];//[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if (systemVersionInt < 13) {
         if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
             statusBar.backgroundColor = color;
         }
     }else{
         if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
             statusBar.backgroundColor = color;
         }
         
         if (statusBar) {
             statusBar.backgroundColor = color;
         }
     }
 
}

#pragma mark - 状态栏 渐变颜色 图层
-(CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.locations = @[@0.0, @1.0];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1.0, 0);
        _gradientLayer.frame = CGRectMake(0, 0,kScreenWidth, kStatusBarHeight);
    }
    return _gradientLayer;
}

- (void)gradientLayer:(NSArray *)colors{
    
    NSMutableArray *cl = [NSMutableArray array];
    for (int i = 0; i < colors.count; i++) {
        UIColor *col = colors[i];
        [cl addObject:(__bridge id)col.CGColor];
    }
    colors = [cl mutableCopy];
    self.gradientLayer.colors = colors;
    
//    for (__strong id lay in statusBar.layer.sublayers) {
//        if ([lay isKindOfClass:[CAGradientLayer class]]){
//            //            [lay removeFromSuperlayer];
//            lay = (CAGradientLayer *)self.gradientLayer;
//            lay = self.gradientLayer;
//        }
//    }
    [self.statusBar.layer insertSublayer:self.gradientLayer atIndex:0];
}


#pragma mark - 状态栏 style
+ (void)statusBarStyle:(UIStatusBarStyle)statusBarStyle{
    [[UIApplication sharedApplication] setStatusBarStyle:statusBarStyle];
}


@end
