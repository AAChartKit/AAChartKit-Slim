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


#import <objc/runtime.h>

@implementation AAJsonConverter

+ (NSDictionary*)getObjectData:(id)obj {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    Class class = [obj class];
    do {
        objc_property_t *props = class_copyPropertyList(class, &propsCount);
        for (int i = 0;i < propsCount; i++) {
            objc_property_t prop = props[i];
            
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            id value = [obj valueForKey:propName];
            if (value == nil) {
                value = [NSNull null];
                continue;
            } else {
                value = [self getObjectInternal:value];
            }
            [dic setObject:value forKey:propName];
        }
        free(props);
        class = [class superclass];
    } while (class != [NSObject class]);
    
    return dic;
}

+ (NSData*)getJSON:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error {
    return [NSJSONSerialization dataWithJSONObject:[self getObjectData:obj] options:options error:error];
}

+ (id)getObjectInternal:(id)obj {
    if (   [obj isKindOfClass:[NSString class]]
        || [obj isKindOfClass:[NSNumber class]]
        || [obj isKindOfClass:[NSNull   class]] ) {
        return obj;
    }
    
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for (int i = 0;i < objarr.count; i++) {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for (NSString *key in objdic.allKeys) {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}

+ (NSString*)convertDictionaryIntoJson:(NSDictionary *)dictionary {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *string =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return string;
}

+ (NSString*)wipeOffTheLineBreakAndBlankCharacter:(NSString *)originalString {
    NSString *str =[originalString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}

+ (NSString *)getPureOptionsString:(id)optionsObject {
    NSDictionary *dic;
    if ([optionsObject isKindOfClass:[NSDictionary class]] ) {
        dic = optionsObject;
    } else {
        dic = [self getObjectData:optionsObject];
    }
    NSString *str = [self convertDictionaryIntoJson:dic];
    return [self wipeOffTheLineBreakAndBlankCharacter:str];
}

+ (NSString *)getPureSeriesString:(NSArray<NSDictionary*> *)series {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:series options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *seriesStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [self wipeOffTheLineBreakAndBlankCharacter:seriesStr];
}

@end


