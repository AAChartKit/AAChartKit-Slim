//
//  AAJsonConverter.h
//  AAChartKit
//
//  Created by An An on 17/1/9.
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

@interface AAJsonConverter : NSObject

/**
 Get pure options string

 @param optionsObject Instance object of AAOptions
 @return Pure options string without "\r" && "\n"
 */
+ (NSString *)getPureOptionsString:(id)optionsObject;


/**
 Get pure series string

 @param series Series array of AAOptions
 @return Pure series string without "\r" && "\n"
 */
+ (NSString *)getPureSeriesString:(NSArray<NSDictionary*> *)series;

@end 
