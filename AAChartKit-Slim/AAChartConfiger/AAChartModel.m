
//
//  AAChartModel.m
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

#import "AAChartModel.h"
//@interface AAChartModel() {
//    NSString *, _title);//标题内容
//    NSString *, _subtitle);//副标题内容
//    AAChartSubtitleAlignType, _subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
//
//    AAChartType, _chartType);//图表类型
//    AAChartStackingType, _stacking);//堆积样式
//    AAChartSymbolType, _symbol);//折线曲线连接点的类型："circle", _"square", _"diamond", _"triangle","triangle-down"，默认是"circle"
//    AAChartZoomType, _zoomType);//缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
//    AAChartAnimation, _animationType);//设置图表的渲染动画类型
//    NSNumber *, _animationDuration);//设置图表的渲染动画时长
//
//    BOOL, _pointHollow);//折线曲线的连接点是否为空心的
//    BOOL, _inverted);//x 轴是否垂直
//    BOOL, _xAxisReversed);// x 轴翻转
//    BOOL, _yAxisReversed);//y 轴翻转
//    BOOL, _crosshairs);//是否显示准星线(默认显示)
//    BOOL, _gradientColorEnable);//是否要为渐变色
//    BOOL, _polar);//是否极化图形(变为雷达图)
//    BOOL, _dataLabelEnabled);//是否显示数据
//    BOOL, _xAxisLabelsEnabled);//x轴是否显示数据
//    NSArray *, _categories);//图表横坐标每个点对应的名称
//    NSNumber *, _xAxisGridLineWidth);//x轴网格线的宽度
//    BOOL, _yAxisLabelsEnabled);//y轴是否显示数据
//    NSString *, _yAxisTitle);//y轴标题
//    NSNumber *, _yAxisGridLineWidth);//y轴网格线的宽度
//
//    NSArray <NSString *>*, _colorsTheme);//图表主题颜色数组
//    NSArray *, _series);
//    BOOL , _connectNulls);//设置折线是否断点重连(是否连接空值点)
//
//
//    BOOL, _legendEnabled);//是否显示图例
//    AAChartLegendLayoutType, _legendLayout);//图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
//    AAChartLegendAlignType, _legendAlign);//设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
//    AAChartLegendVerticalAlignType, _legendVerticalAlign);//设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
//
//    NSString *, _backgroundColor);//图表背景色
//    BOOL, _options3dEnable);//是否3D化图形(仅对条形图,柱状图有效)
//    NSNumber *, _options3dAlpha);
//    NSNumber *, _options3dBeta);
//    NSNumber *, _options3dDepth);//3D图形深度
//
//    NSNumber *, _borderRadius);//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
//    NSNumber *, _markerRadius);//折线连接点的半径长度
//
//    BOOL, _yAllowDecimals);//是否允许y轴显示小数
//    NSArray *, _yPlotLines);//y轴基线的配置
//    NSNumber *, _yMax);//y轴最大值
//    NSNumber *, _yMin);//y轴最小值（设置为0就不会有负数）
//    NSArray *, _yTickPositions);//自定义Y轴坐标（如：[@(0), _@(25), _@(50), _@(75) , _(100)]）
//}
//
//@end

AAChartType const AAChartTypeColumn          = @"column";
AAChartType const AAChartTypeBar             = @"bar";
AAChartType const AAChartTypeArea            = @"area";
AAChartType const AAChartTypeAreaspline      = @"areaspline";
AAChartType const AAChartTypeLine            = @"line";
AAChartType const AAChartTypeSpline          = @"spline";
AAChartType const AAChartTypeScatter         = @"scatter";
AAChartType const AAChartTypePie             = @"pie";
AAChartType const AAChartTypeBubble          = @"bubble";
AAChartType const AAChartTypePyramid         = @"pyramid";
AAChartType const AAChartTypeFunnel          = @"funnel";
AAChartType const AAChartTypeColumnrange     = @"columnrange";
AAChartType const AAChartTypeArearange       = @"arearange";
AAChartType const AAChartTypeAreasplinerange = @"areasplinerange";
AAChartType const AAChartTypeBoxplot         = @"boxplot";
AAChartType const AAChartTypeWaterfall       = @"waterfall";
AAChartType const AAChartTypePolygon         = @"polygon";

AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft   = @"left";
AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter = @"center";
AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight  = @"right";

AAChartZoomType const AAChartZoomTypeNone = @"none";
AAChartZoomType const AAChartZoomTypeX    = @"x";
AAChartZoomType const AAChartZoomTypeY    = @"y";
AAChartZoomType const AAChartZoomTypeXY   = @"xy";

AAChartStackingType const AAChartStackingTypeFalse   = @"";
AAChartStackingType const AAChartStackingTypeNormal  = @"normal";
AAChartStackingType const AAChartStackingTypePercent = @"percent";

AAChartSymbolType const AAChartSymbolTypeCircle        = @"circle";
AAChartSymbolType const AAChartSymbolTypeSquare        = @"square";
AAChartSymbolType const AAChartSymbolTypeDiamond       = @"diamond";
AAChartSymbolType const AAChartSymbolTypeTriangle      = @"triangle";
AAChartSymbolType const AAChartSymbolTypeTriangle_down = @"triangle-down";

AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault     = @"default";
AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank  = @"innerBlank";
AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank = @"borderBlank";

AAChartFontWeightType const AAChartFontWeightTypeThin     = @"thin";
AAChartFontWeightType const AAChartFontWeightTypeRegular  = @"regular";
AAChartFontWeightType const AAChartFontWeightTypeBold     = @"bold";

AALineDashSyleType const AALineDashSyleTypeSolid           = @"Solid";
AALineDashSyleType const AALineDashSyleTypeShortDash       = @"ShortDash";
AALineDashSyleType const AALineDashSyleTypeShortDot        = @"ShortDot";
AALineDashSyleType const AALineDashSyleTypeShortDashDot    = @"ShortDashDot";
AALineDashSyleType const AALineDashSyleTypeShortDashDotDot = @"ShortDashDotDot";
AALineDashSyleType const AALineDashSyleTypeDot             = @"Dot";
AALineDashSyleType const AALineDashSyleTypeDash            = @"Dash";
AALineDashSyleType const AALineDashSyleTypeLongDash        = @"LongDash";
AALineDashSyleType const AALineDashSyleTypeDashDot         = @"DashDot";
AALineDashSyleType const AALineDashSyleTypeLongDashDot     = @"LongDashDot";
AALineDashSyleType const AALineDashSyleTypeLongDashDotDot  = @"LongDashDotDot";

@implementation AAChartModel

-(instancetype)init {
    self = [super init];
    if (self) {
        _chartType = AAChartTypeColumn;
        _animationType = AAChartAnimationBounce;//默认使用jQuery easing的'swing'效果
        _animationDuration = @1200;//默认动画时长为500毫秒
        _subtitleAlign = AAChartSubtitleAlignTypeLeft;
        _pointHollow =NO;
        _inverted = NO;
        _stacking = AAChartStackingTypeFalse;
        _xAxisReversed = NO;
        _yAxisReversed = NO;
        _zoomType = AAChartZoomTypeX;
        _colorsTheme = @[@"#b5282a",@"#e7a701",@"#50c18d",@"#fd4800",@"#f1c6c5"];
        _gradientColorEnabled = NO;
        _polar = NO;
        _options3dEnable = NO;
        _crosshairs = YES;
        _xAxisLabelsEnabled = YES;
        _xAxisGridLineWidth = @0;
        _yAxisLabelsEnabled = YES;
        _yAxisGridLineWidth = @1;
        _legendEnabled = YES;
//        _legendLayout = AAChartLegendLayoutTypeHorizontal;
//        _legendAlign = AAChartLegendAlignTypeCenter;
//        _legendVerticalAlign = AAChartLegendVerticalAlignTypeBottom;
        
        _borderRadius = @0;//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        _markerRadius = @6;//折线连接点的半径长度,如果值设置为0,这样就相当于不显示了
        _yAllowDecimals = YES; //默认y轴显示小数
     }
    return self;
}

AAPropSetFuncImplementation(AAChartModel, NSString *, title);//标题内容
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitle);//副标题内容
AAPropSetFuncImplementation(AAChartModel, NSString *, subtitleAlign);//图表副标题文本水平对齐方式。可选的值有 “left”，”center“和“right”。 默认是：center.
    
AAPropSetFuncImplementation(AAChartModel, AAChartType, chartType);//图表类型
AAPropSetFuncImplementation(AAChartModel, AAChartStackingType , stacking);//堆积类型
AAPropSetFuncImplementation(AAChartModel, AAChartSymbolType , symbol);//曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
AAPropSetFuncImplementation(AAChartModel, AAChartZoomType , zoomType);//缩放类型
AAPropSetFuncImplementation(AAChartModel, AAChartAnimation, animationType);//设置图表的渲染动画类型
AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration);//x轴网格线的宽度

AAPropSetFuncImplementation(AAChartModel, BOOL, pointHollow);//折线曲线的连接点是否为空心的
AAPropSetFuncImplementation(AAChartModel, BOOL , inverted);
AAPropSetFuncImplementation(AAChartModel, BOOL, xAxisReversed);
AAPropSetFuncImplementation(AAChartModel, BOOL, yAxisReversed);
AAPropSetFuncImplementation(AAChartModel, BOOL, crosshairs);
AAPropSetFuncImplementation(AAChartModel, BOOL, dataLabelEnabled);//是否显示数据
AAPropSetFuncImplementation(AAChartModel, BOOL, polar);
AAPropSetFuncImplementation(AAChartModel, BOOL, gradientColorEnabled);//是否要为渐变色
AAPropSetFuncImplementation(AAChartModel, BOOL, xAxisLabelsEnabled);//x轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSArray *, categories);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, xAxisGridLineWidth);//x轴网格线的宽度
AAPropSetFuncImplementation(AAChartModel, BOOL, yAxisLabelsEnabled);//y轴是否显示数据
AAPropSetFuncImplementation(AAChartModel, NSString *, yAxisTitle);//y轴标题
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yAxisGridLineWidth);//x轴网格线的宽度

AAPropSetFuncImplementation(AAChartModel, NSArray <NSString *>*, colorsTheme);
AAPropSetFuncImplementation(AAChartModel, NSArray *, series);
AAPropSetFuncImplementation(AAChartModel, BOOL , connectNulls);//设置折线是否断点重连(是否连接空值点)

AAPropSetFuncImplementation(AAChartModel, BOOL, legendEnabled);//是否显示图例
//AAPropSetFuncImplementation(AAChartModel, AAChartLegendLayoutType , legendLayout);
//AAPropSetFuncImplementation(AAChartModel, AAChartLegendAlignType , legendAlign);
//AAPropSetFuncImplementation(AAChartModel, AAChartLegendVerticalAlignType , legendVerticalAlign);

AAPropSetFuncImplementation(AAChartModel, NSString *, backgroundColor);
AAPropSetFuncImplementation(AAChartModel, BOOL,       options3dEnable);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dAlpha);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dBeta);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, options3dDepth);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AAChartModel, NSNumber *, markerRadius);//折线连接点的半径长度

AAPropSetFuncImplementation(AAChartModel, BOOL, yAllowDecimals);//是否允许y轴显示小数（默认显示）
AAPropSetFuncImplementation(AAChartModel, NSArray *, yPlotLines);//y轴基线的配置
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yMax);//y轴最大值
AAPropSetFuncImplementation(AAChartModel, NSNumber *, yMin);//y轴最小值（设置为0就不会有负数）
AAPropSetFuncImplementation(AAChartModel, NSArray *, yTickPositions);//自定义Y轴坐标（如：[@(0), @(25), @(50), @(75) , (100)]）

@end
