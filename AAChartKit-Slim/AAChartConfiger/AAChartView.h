//
//  AAChartView.h
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
#import "AAChartModel.h"

//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
//#import <WebKit/WebKit.h>
//#define AAWebView WKWebView
//#define AAWebViewDelegate WKNavigationDelegate
//#define AASelfWebViewDelegate navigationDelegate
//#elif
#import <UIKit/UIKit.h>
#define AAWebView UIWebView
#define AAWebViewDelegate UIWebViewDelegate
#define AASelfWebViewDelegate delegate
//#endif

@protocol AAChartViewDidFinishLoadDelegate<NSObject>

/**
 The delegate method of chart view finish loading
 */
- (void)AAChartViewDidFinishLoad;

@end

@interface AAChartView : AAWebView<AAWebViewDelegate>

@property (nonatomic, weak)   id<AAChartViewDidFinishLoadDelegate> delegate;

/**
 Content width of AAChartView
 */
@property (nonatomic, assign) CGFloat  contentWidth;

/**
 Content height of AAChartView
 */
@property (nonatomic, assign) CGFloat  contentHeight;

/**
 Set the chart view can scroll or not
 */
@property (nonatomic, assign) BOOL scrollEnabled;

/**
 Hide chart series content or not
 */
@property (nonatomic, assign) BOOL     chartSeriesHidden;


/**
 Function of drawing chart view
 
 @param chartModel The instance object of chart model
 */
- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of refreshing whole chart view content
 
 @param chartModel The instance object of chart model
 */
- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of only refresh the chart data
 
 @param series  Series array of AAChartModel instance object
 */
- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series;
    


    
/**
 Function of only refresh the chart data

 @param series Series array of AAOptions instance object
 */
- (void)aa_onlyRefreshTheChartDataWithOptionsSeries:(NSArray<NSDictionary *> *)series;




/**
 Show the series element content with index
 
 @param elementIndex element index
 */
- (void)aa_showTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex;

/**
 Hide the series element content with index
 
 @param elementIndex element index
 */
- (void)aa_hideTheSeriesElementContentWithSeriesElementIndex:(NSInteger)elementIndex;


@end

