//
//  TimelineDataSource.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicTimelineModel.h"

@interface TimelineDataSource : AKTableViewGenericDataSource <AKModelProtocol> {
	PublicTimelineModel *_publicTimelineModel;
}

@end
