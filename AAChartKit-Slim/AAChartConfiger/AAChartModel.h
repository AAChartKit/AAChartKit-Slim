//
//  AAChartModel.h
//  AAChartKit
//
//  Created by An An on 17/1/20.
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

#import <Foundation/Foundation.h>
#import "AAGlobalMacro.h"
#import "AASeriesElement.h"

#define AACHARTKIT_EXTERN     extern __attribute__((visibility ("default")))

typedef NS_ENUM(NSInteger,AAChartAnimation) {
    AAChartAnimationLinear = 0,
    AAChartAnimationEaseInQuad,
    AAChartAnimationEaseOutQuad,
    AAChartAnimationEaseInOutQuad,
    AAChartAnimationEaseInCubic,
    AAChartAnimationEaseOutCubic,
    AAChartAnimationEaseInOutCubic,
    AAChartAnimationEaseInQuart,
    AAChartAnimationEaseOutQuart,
    AAChartAnimationEaseInOutQuart,
    AAChartAnimationEaseInQuint,
    AAChartAnimationEaseOutQuint,
    AAChartAnimationEaseInOutQuint,
    AAChartAnimationEaseInSine,
    AAChartAnimationEaseOutSine,
    AAChartAnimationEaseInOutSine,
    AAChartAnimationEaseInExpo,
    AAChartAnimationEaseOutExpo,
    AAChartAnimationEaseInOutExpo,
    AAChartAnimationEaseInCirc,
    AAChartAnimationEaseOutCirc,
    AAChartAnimationEaseInOutCirc,
    AAChartAnimationEaseOutBounce,
    AAChartAnimationEaseInBack,
    AAChartAnimationEaseOutBack,
    AAChartAnimationEaseInOutBack,
    AAChartAnimationElastic,
    AAChartAnimationSwingFromTo,
    AAChartAnimationSwingFrom,
    AAChartAnimationSwingTo,
    AAChartAnimationBounce,
    AAChartAnimationBouncePast,
    AAChartAnimationEaseFromTo,
    AAChartAnimationEaseFrom,
    AAChartAnimationEaseTo,
};

typedef NSString *AAChartType;
typedef NSString *AAChartSubtitleAlignType;
typedef NSString *AAChartZoomType;
typedef NSString *AAChartStackingType;
typedef NSString *AAChartSymbolType;
typedef NSString *AAChartSymbolStyleType;
typedef NSString *AAChartFontWeightType;
typedef NSString *AALineDashSyleType;

AACHARTKIT_EXTERN AAChartType const AAChartTypeColumn;
AACHARTKIT_EXTERN AAChartType const AAChartTypeBar;
AACHARTKIT_EXTERN AAChartType const AAChartTypeArea;
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreaspline;
AACHARTKIT_EXTERN AAChartType const AAChartTypeLine;
AACHARTKIT_EXTERN AAChartType const AAChartTypeSpline;
AACHARTKIT_EXTERN AAChartType const AAChartTypeScatter;
AACHARTKIT_EXTERN AAChartType const AAChartTypePie;
AACHARTKIT_EXTERN AAChartType const AAChartTypeBubble;
AACHARTKIT_EXTERN AAChartType const AAChartTypePyramid;
AACHARTKIT_EXTERN AAChartType const AAChartTypeFunnel;
AACHARTKIT_EXTERN AAChartType const AAChartTypeColumnrange;
AACHARTKIT_EXTERN AAChartType const AAChartTypeArearange;
AACHARTKIT_EXTERN AAChartType const AAChartTypeAreasplinerange;
AACHARTKIT_EXTERN AAChartType const AAChartTypeBoxplot;
AACHARTKIT_EXTERN AAChartType const AAChartTypeWaterfall;
AACHARTKIT_EXTERN AAChartType const AAChartTypePolygon;

AACHARTKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft;
AACHARTKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter;
AACHARTKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight;

AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeNone;
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeX;
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeY;
AACHARTKIT_EXTERN AAChartZoomType const AAChartZoomTypeXY;

AACHARTKIT_EXTERN AAChartStackingType const AAChartStackingTypeFalse;
AACHARTKIT_EXTERN AAChartStackingType const AAChartStackingTypeNormal;
AACHARTKIT_EXTERN AAChartStackingType const AAChartStackingTypePercent;

AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeCircle;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeSquare;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeDiamond;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle;
AACHARTKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle_down;

AACHARTKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault;
AACHARTKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank;
AACHARTKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank;

AACHARTKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeThin;
AACHARTKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeRegular;
AACHARTKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeBold;

AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeSolid;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDash;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDot;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDashDot;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDashDotDot;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDot;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDash;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDash;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDashDot;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDashDot;
AACHARTKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDashDotDot;


@interface AAChartModel : NSObject

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, title);//标题内容
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitle);//副标题内容
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.

AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartType, chartType);//图表类型
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartStackingType, stacking);//堆积样式
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSymbolType, symbol);//折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartZoomType, zoomType);//缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartAnimation, animationType);//设置图表的渲染动画类型
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, animationDuration);//设置图表的渲染动画时长

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, pointHollow);//折线曲线的连接点是否为空心的
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, inverted);//x 轴是否垂直
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisReversed);// x 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisReversed);//y 轴翻转
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, crosshairs);//是否显示准星线(默认显示)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, gradientColorEnabled);//是否要为渐变色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, polar);//是否极化图形(变为雷达图)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, dataLabelEnabled);//是否显示数据
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, xAxisLabelsEnabled);//x轴是否显示数据
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, categories);//图表横坐标每个点对应的名称
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);//x轴网格线的宽度
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAxisLabelsEnabled);//y轴是否显示数据
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);//y轴标题
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);//y轴网格线的宽度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray <NSString *>*, colorsTheme);//图表主题颜色数组
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, series);
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL , connectNulls);//设置折线是否断点重连(是否连接空值点)


AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, legendEnabled);//是否显示图例
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//图表背景色
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, options3dEnable);//是否3D化图形(仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D图形深度

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL, yAllowDecimals);//是否允许y轴显示小数
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, yPlotLines);//y轴基线的配置
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMax);//y轴最大值
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yMin);//y轴最小值（设置为0就不会有负数）
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *, yTickPositions);//自定义Y轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）

@end
