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
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
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

- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series {
    NSString *seriesJsonStr=[AAJsonConverter getPureSeriesString:series];
    NSString *javaScriptStr = [NSString stringWithFormat:@"onlyRefreshTheChartDataWithSeries('%@')",seriesJsonStr];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel {
    [self configTheOptionsJsonWithChartModel:chartModel];
    [self drawChart];
}

- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"showTheSeriesElementContentWithIndex(%ld)",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)aa_hideTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex {
    NSString *javaScriptStr = [NSString stringWithFormat:@"hideTheSeriesElementContentWithIndex(%ld)",(long)elementIndex];
    [self evaluateJavaScriptWithFunctionNameString:javaScriptStr];
}

- (void)evaluateJavaScriptWithFunctionNameString:(NSString *)funcitonNameStr {
    [self  stringByEvaluatingJavaScriptFromString:funcitonNameStr];
}

///UIWebView页面加载完成之后调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self drawChart];
    [self.chartViewDidFinishLoadDelegate AAChartViewDidFinishLoad];
}

- (void)drawChart {
    NSString *javaScriptStr =[self configTheJavaScriptString];
    [self  stringByEvaluatingJavaScriptFromString:javaScriptStr];
}

- (void)setContentWidth:(CGFloat)contentWidth {
    _contentWidth = contentWidth;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentWidth(%f)",_contentWidth];
    [self evaluateJavaScriptWithSetterMethodNameString:javaScriptStr];
}

- (void)setContentHeight:(CGFloat)contentHeight {
    _contentHeight = contentHeight;
    NSString *javaScriptStr = [NSString stringWithFormat:@"setTheChartViewContentHeight(%f)",_contentHeight];
    [self evaluateJavaScriptWithSetterMethodNameString:javaScriptStr];
}

- (void)setChartSeriesHidden:(BOOL)chartSeriesHidden {
    _chartSeriesHidden = chartSeriesHidden;
    NSString *jsStr = [NSString stringWithFormat:@"setChartSeriesHidden(%d)",_chartSeriesHidden];
    [self evaluateJavaScriptWithSetterMethodNameString:jsStr];
}

- (void)setIsClearBackgroundColor:(BOOL)isClearBackgroundColor {
    _isClearBackgroundColor = isClearBackgroundColor;
    if (_isClearBackgroundColor == YES) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setOpaque:NO];
    }
}

- (void)evaluateJavaScriptWithSetterMethodNameString:(NSString *)JSFunctionStr {
    if (_optionJson) {
        [self evaluateJavaScriptWithFunctionNameString:JSFunctionStr];
    }
}


@end
