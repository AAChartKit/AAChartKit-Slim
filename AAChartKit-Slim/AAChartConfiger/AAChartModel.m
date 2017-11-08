
//
//  AAChartModel.m
//  AAChartKit
//
//  Created by An An on 17/1/20.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import "AAChartModel.h"

@implementation AAChartModel
-(instancetype)init {
    self = [super init];
    if (self) {
        self.chartType = AAChartTypeColumn;
        self.animationType = AAChartAnimationTypeSwing;//默认使用jQuery easing的'swing'效果
        self.animationDuration = @500;//默认动画时长为500毫秒
        self.subtitleAlign = AAChartSubtitleAlignTypeLeft;
        self.pointHollow =NO;
        self.inverted = NO;
        self.stacking = AAChartStackingTypeFalse;
        self.xAxisReversed = NO;
        self.yAxisReversed = NO;
        self.zoomType = AAChartZoomTypeX;
        self.colorsTheme = @[@"#b5282a",@"#e7a701",@"#50c18d",@"#fd4800",@"#f1c6c5"];
        self.gradientColorEnable = NO;
        self.polar = NO;
        self.options3dEnable = NO;
        self.crosshairs = YES;
        self.xAxisLabelsEnabled = YES;
        self.xAxisGridLineWidth = @0;
        self.yAxisLabelsEnabled = YES;
        self.yAxisGridLineWidth = @1;
        self.legendEnabled = YES;
        self.legendLayout = AAChartLegendLayoutTypeHorizontal;
        self.legendAlign = AAChartLegendAlignTypeCenter;
        self.legendVerticalAlign = AAChartLegendVerticalAlignTypeBottom;
        
        self.borderRadius = @0;//柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效,设置为1000时,柱形图或者条形图头部为楔形)
        self.markerRadius = @6;//折线连接点的半径长度,如果值设置为0,这样就相当于不显示了
        self.yAllowDecimals = YES; //默认y轴显示小数
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
AAPropSetFuncImplementation(AAChartModel, AAChartAnimationType, animationType);//设置图表的渲染动画类型
AAPropSetFuncImplementation(AAChartModel, NSNumber *, animationDuration);//x轴网格线的宽度

AAPropSetFuncImplementation(AAChartModel, BOOL, pointHollow);//折线曲线的连接点是否为空心的
AAPropSetFuncImplementation(AAChartModel, BOOL , inverted);
AAPropSetFuncImplementation(AAChartModel, BOOL, xAxisReversed);
AAPropSetFuncImplementation(AAChartModel, BOOL, yAxisReversed);
AAPropSetFuncImplementation(AAChartModel, BOOL, crosshairs);
AAPropSetFuncImplementation(AAChartModel, BOOL, dataLabelEnabled);//是否显示数据
AAPropSetFuncImplementation(AAChartModel, BOOL, polar);
AAPropSetFuncImplementation(AAChartModel, BOOL, gradientColorEnable);//是否要为渐变色
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
AAPropSetFuncImplementation(AAChartModel, AAChartLegendLayoutType , legendLayout);
AAPropSetFuncImplementation(AAChartModel, AAChartLegendAlignType , legendAlign);
AAPropSetFuncImplementation(AAChartModel, AAChartLegendVerticalAlignType , legendVerticalAlign);

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
