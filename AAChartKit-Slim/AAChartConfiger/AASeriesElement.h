//
//  AASeriesElement.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import <Foundation/Foundation.h>
#import "AAGlobalMacro.h"

@class AAMarker,AADataLabels;

@interface AASeriesElement : NSObject

AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, type);
AAPropStatementAndFuncStatement(assign, AASeriesElement, BOOL      , allowPointSelect);//是否允许在点击数据点标记（markers）、柱子（柱形图）、扇区（饼图）时选中该点，选中的点可以通过 Chart.getSelectedPoints 来获取。 默认是：false.
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, name);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSArray  *, data);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, color);
//AAPropStatementAndFuncStatement(assign, AASeriesElement, BOOL      , colorByPoint);//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. 默认是：false.
AAPropStatementAndFuncStatement(strong, AASeriesElement, AAMarker *, marker);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, stacking);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, dashStyle);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, threshold);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, lineWidth);//折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, borderWidth)//柱形图、条形图、扇形图等图形的描边宽度
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, borderColor);//柱形图、条形图、扇形图顿号等图形的描边颜色
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, fillColor);//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, fillOpacity);//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, negativeColor); // The color for the parts of the graph or points that are below the threshold
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, innerSize);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, size);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSArray  *, keys);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, yAxis);
AAPropStatementAndFuncStatement(strong, AASeriesElement, AADataLabels*, dataLabels);
AAPropStatementAndFuncStatement(strong, AASeriesElement, id        , step);//是否转变为直方折线图
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSDictionary *, states);

@end

//#import "AAGlobalMacro.h"
@class AAStyle;
@interface AADataLabels : NSObject

//https://api.hcharts.cn/highcharts#plotOptions.area.dataLabels.align
//align: 水平对齐
//allowOverlap: 允许重叠
//backgroundColor: 背景颜色
//borderColor: 边框颜色
//borderRadius: 边框圆角
//borderWidth: 边框宽度
//className: 类名
//color: 颜色
//crop: 裁剪
//defer: 延迟显示
//enabled: 开关
//format: 格式化字符串
//formatter: 格式化函数
//inside: 显示在内部
//overflow: 溢出处理
//padding: 内边距
//rotation: 旋转角度
//shadow: 阴影
//shape: 箭头形状
//style: 样式
//useHTML: HTML 渲染
//verticalAlign: 竖直对齐方式
//x: 水平偏移
//y: 竖直偏移
//zIndex

//https://api.hcharts.cn/highcharts#plotOptions.pie.dataLabels.connectorPadding
//backgroundColor: undefined
//borderColor: undefined
//borderRadius: 0
//borderWidth: 0
//className: undefined
//color: undefined
//connectorColor: "{point.color}"
//connectorPadding: 5
//connectorWidth: 1
//crop: true
//defer: true
//distance: 30
//enabled: true
//format: "{y}"
//formatter: undefined
//inside: undefined
//overflow: "justify"
//padding: 5
//rotation: 0
//shadow: false
//shape: "square"
//softConnector: true
//style: {"color": "contrast", "fontSize": "11px", "fontWeight": "bold", "textOutline": "1px 1px contrast" }
//useHTML: false
//verticalAlign: undefined
//x: 0
//y: -6
//zIndex

AAPropStatementAndFuncStatement(assign, AADataLabels, BOOL      , enabled);
AAPropStatementAndFuncStatement(strong, AADataLabels, AAStyle  *, style);
AAPropStatementAndFuncStatement(copy,   AADataLabels, NSString *, format);
AAPropStatementAndFuncStatement(copy,   AADataLabels, NSNumber *, rotation);
AAPropStatementAndFuncStatement(assign, AADataLabels, BOOL      , allowOverlap);
AAPropStatementAndFuncStatement(assign, AADataLabels, BOOL      , useHTML);
AAPropStatementAndFuncStatement(strong, AADataLabels, NSNumber*, distance);

@end

@interface AAStyle : NSObject

AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, color);
AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, fontSize);
AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, fontWeight);
AAPropStatementAndFuncStatement(copy, AAStyle, NSString *, textOutline);

@end


