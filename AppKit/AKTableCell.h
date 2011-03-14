//
//  XTableViewCell.h
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AKTableObject;
@interface AKTableCell : UITableViewCell {
    AKTableObject *_object;
    BOOL _enabled;
    
    NSUInteger _ignoreCounter;
    UILongPressGestureRecognizer *_gestureRecognizer;
}

@property (nonatomic, retain) AKTableObject *object;
@property (nonatomic, assign) BOOL enabled;

@end
