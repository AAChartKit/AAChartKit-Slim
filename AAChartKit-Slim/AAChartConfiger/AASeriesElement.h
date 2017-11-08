//
//  AASeriesElement.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright © 2017年 An An. All rights reserved.
//  source code ----*** https://github.com/AAChartModel/AAChartKit ***--- source code
//

#import <Foundation/Foundation.h>
#import "AAGlobalMacro.h"
@class AAMarker;

@interface AASeriesElement : NSObject

AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, type);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, name);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSArray  *, data);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, innerSize);
AAPropStatementAndFuncStatement(strong, AASeriesElement, AAMarker *, marker);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, stacking);

@end
