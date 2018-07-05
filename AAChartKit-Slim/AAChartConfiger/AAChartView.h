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
#import <UIKit/UIKit.h>

@protocol AAChartViewDidFinishLoadDelegate<NSObject>

/**
 The delegate method of chart view finish loading
 */
- (void)AAChartViewDidFinishLoad;

@end

@interface AAChartView : UIWebView<UIWebViewDelegate>

@property (nonatomic, weak)   id<AAChartViewDidFinishLoadDelegate> chartViewDidFinishLoadDelegate;

/**
 Content width of AAChartView
 */
@property (nonatomic, assign) CGFloat  contentWidth;

/**
 Content height of AAChartView
 */
@property (nonatomic, assign) CGFloat  contentHeight;


/**
 Hide chart series content or not
 */
@property (nonatomic, assign) BOOL chartSeriesHidden;

/**
 Set the chart view background color be clear
 */
@property (nonatomic, assign) BOOL isClearBackgroundColor;



/**
 Function of drawing chart view
 
 @param chartModel The instance object of chart model
 */
- (void)aa_drawChartWithChartModel:(AAChartModel *)chartModel;

/**
 Function of only refresh the chart data
 
 @param series  Series array of AAChartModel instance object
 */
- (void)aa_onlyRefreshTheChartDataWithChartModelSeries:(NSArray<NSDictionary *> *)series;

/**
 Function of refreshing whole chart view content
 
 @param chartModel The instance object of chart model
 */
- (void)aa_refreshChartWithChartModel:(AAChartModel *)chartModel;




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

