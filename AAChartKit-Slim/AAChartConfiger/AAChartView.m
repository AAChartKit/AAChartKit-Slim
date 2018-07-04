//
//  AAChartView.m
//  AAChartKit
//
//  Created by An An on 17/1/16.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit-Slim ***--- source code
//

/*
 
 * -------------------------------------------------------------------------------
 *
 * ❀❀❀   WARM TIPS!!!   ❀❀❀
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Slim/issues
 * ------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */
//

#import "AAChartView.h"
#import "AAJsonConverter.h"

@implementation AAChartView {
    NSString *_optionJson;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.AASelfWebViewDelegate =self;
        self.backgroundColor = [UIColor whiteColor];
        //        self.scrollView.bounces = NO;
    }
    return self;
}

- (NSURLRequest *)getJavaScriptFileURLRequest {
    NSString *webPath = [[NSBundle mainBundle] pathForResource:@"AAChartView" ofType:@"html"];
    NSURL *webURL = [NSURL fileURLWithPath:webPath];
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:webURL];
    return URLRequest;
}

- (void)configTheOptionsJsonWithChartModel:(AAChartModel *)chartModel {
 
    _optionJson = [AAJsonConverter getPureOptionsString:chartModel];
}
    


- (NSString *)configTheJavaScriptString {
    CGFloat chartViewContentWidth = self.contentWidth;
    CGFloat chartViewContentHeight = self.contentHeight == 0?self.frame.size.height:self.contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"loadTheHighChartView('%@','%@','%@')",_optionJson,[NSNumber numberWithFloat:chartViewContentWidth],[NSNumber numberWithFloat:chartViewContentHeight]];
    return javaScriptStr;
}

- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel {
    [self configTheOptionsJsonWithChartModel:chartModel];
    NSURLRequest *URLRequest = [self getJavaScriptFileURLRequest];
    [self loadRequest:URLRequest];
    
}

- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel {
    [self configTheOptionsJsonWithChartModel:chartModel];
    [self drawChart];
}
    
//- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series {
//    NSString *seriesJsonStr=[AAJsonConverter getPureSeriesString:series];
//    NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
//    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
//}
    
    


 
- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<NSDictionary *> *)series {
    [self aa_onlyRefreshTheChartDataWithChartModelSeries:series];
}



- (void)printTheErrorMessageWithError:(NSError *)error {
    if (error) {
        NSLog(@"WARNING!!!!! THERE ARE SOME ERROR INFOMATION_______%@",error);
    }
}
//
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
/////WKWebView页面加载完成之后调用
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    [self drawChart];
//    [self.delegate AAChartViewDidFinishLoad];
//}

//- (void)drawChart {
//    NSString *javaScriptStr = [self configTheJavaScriptString];
//    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
//}

- (void)setChartSeriesHidden:(BOOL)chartSeriesHidden {
    _chartSeriesHidden = chartSeriesHidden;
    NSString *javaScriptStr = [NSString stringWithFormat:@"chartSeriesContentHideOrShow(%d)",_chartSeriesHidden];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"showTheSeriesElementContentWithIndex(%ld)",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)evaluateJavaScriptWithFunctionNameString:(NSString *)funcitonNameStr {
//    [self  evaluateJavaScript:funcitonNameStr completionHandler:^(id item, NSError * _Nullable error) {
//        [self printTheErrorMessageWithError:error];
//    }];
    [self  stringByEvaluatingJavaScriptFromString:funcitonNameStr];

}

///UIWebView页面加载完成之后调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self drawChart];
    [self.delegate AAChartViewDidFinishLoad];
}

//- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
//    [self printTheErrorMessageWithError:error];
//}

- (void)drawChart {
    NSString *javaScriptStr =[self configTheJavaScriptString];
    [self  stringByEvaluatingJavaScriptFromString:javaScriptStr];
}

- (void)aa_onlyRefreshTheChartDataWithChartModel:(AAChartModel *)chartModel {
    NSString *seriesJsonStr=[AAJsonConverter getPureOptionsString:chartModel];
    NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
    [self  stringByEvaluatingJavaScriptFromString:javaScriptStr];
    
}

//#endif



@end
