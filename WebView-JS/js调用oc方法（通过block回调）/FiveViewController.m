//
//  FiveViewController.m
//  WebView-JS
//
//  Created by wushangkun on 16/4/19.
//  Copyright © 2016年 wushangkun. All rights reserved.
//

#import "FiveViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface FiveViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;


@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    //加载本地的html
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"Five" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:htmlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


//!!! 需要导入javascriptCore.framework
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //将对象赋给js中的对象
  //  GoodsModel *goodsModel = [[GoodsModel alloc]init];
    //给js注入一个对象
    
    //通过block回调
    // SelectGoods就是js的方法名
    context[@"SelectGoods"]  = ^(){
        
        //打印出所有接收到的参数
        NSArray *args = [JSContext currentArguments];
        NSLog(@"args = %@",args);
        
        //js参数是不固定的
        for (id obj in args) {
            NSLog(@"obj = %@",obj);
        }
    
    };
}


@end
