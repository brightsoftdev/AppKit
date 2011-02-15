//
//  TwitterController.h
//  AppKit
//
//  Created by Hiroshi Horie on 11/02/15.
//  Copyright 2011 netsystems. All rights reserved.
//

#include "PublicTimelineModel.h"

@interface TwitterController : AKTableViewController <AKModelProtocol> {
    PublicTimelineModel *_model;
}

@end
