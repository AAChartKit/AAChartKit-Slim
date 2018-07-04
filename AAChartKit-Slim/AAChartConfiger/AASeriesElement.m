//
//  AASeriesElement.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright © 2017年 An An. xAll rights reserved.
//

#import "AASeriesElement.h"

@implementation AASeriesElement

AAPropSetFuncImplementation(AASeriesElement, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AASeriesElement, NSString *, type);
AAPropSetFuncImplementation(AASeriesElement, NSString *, name);
AAPropSetFuncImplementation(AASeriesElement, NSArray  *, data);
AAPropSetFuncImplementation(AASeriesElement, NSString *, color);
AAPropSetFuncImplementation(AASeriesElement, NSString *, innerSize);
AAPropSetFuncImplementation(AASeriesElement, AAMarker *, marker);
AAPropSetFuncImplementation(AASeriesElement, NSString *, stacking);
AAPropSetFuncImplementation(AASeriesElement, id        , step);//是否转变为直方折线图


@end
