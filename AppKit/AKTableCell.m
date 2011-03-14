//
//  XTableViewCell.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKTableCell.h"
#import "AKTableObject.h"
#import "AKTableViewDataSource.h"

#import "Global.h"

@implementation AKTableCell

@synthesize object = _object;
@synthesize enabled = _enabled;

- (BOOL)canBecomeFirstResponder {
    return YES;
}

/*
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(omegaAction:)) {
        return YES;
    }
    return NO;
}

- (void)omegaAction:(id)sender {
    NSLog(@"omegaAction : %@", sender);
}
*/

- (void)longPressAction:(UILongPressGestureRecognizer *)sender {
    
    
    NSLog(@"longPressAction delegate ? : %@", _object.tableView.delegate);
    /*
    if ([_object.tableView.delegate respondsToSelector:@selector(tableView:didLongPressRowAtIndexPath:)]) {
        
        AKTableViewDataSource *dataSource = _object.tableView.dataSource;
        NSIndexPath *indexPath = [dataSource tableView:_object.tableView indexPathForObject:_object];
        //NSLog(@"indexPath : %@", indexPath);
        [_object.tableView.delegate tableView:_object.tableView didLongPressRowAtIndexPath:indexPath];
    }
    */
    
    /*
    //NSLog(@"longPressActionb : %d", sender.state);
    if (sender.state == UIGestureRecognizerStateBegan) {
        //CGPoint location = [sender locationInView:[sender view]];

        UIMenuController *menuController = [UIMenuController sharedMenuController];
        //UIMenuItem *menuItem = [];
        [menuController setMenuItems:[NSArray arrayWithObjects:
                                      [[[UIMenuItem alloc] initWithTitle:@"Omega" action:@selector(omegaAction:)] autorelease],
                                      [[[UIMenuItem alloc] initWithTitle:@"Omega" action:@selector(omegaAction:)] autorelease],
                                      [[[UIMenuItem alloc] initWithTitle:@"Omega" action:@selector(omegaAction:)] autorelease],
                                      
                                      nil]];

        [self becomeFirstResponder];
        //NSLog(@"self. %@", self.superview.superview);

        [menuController setTargetRect:self.bounds inView:self];
        [menuController setMenuVisible:YES animated:YES];

        
        _ignoreCounter++;
        //sender.cancelsTouchesInView = NO;
        //[self canBecomeFirstResponder];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        //[sender cancelsTouchesInView];
        //NSLog(@"cancels touches.");
        
        //sender.cancelsTouchesInView = YES;
        //[gestureRecognizer cancelsTouchesInView];
    }
    */
    //NSLog(@"state : %d", sender.state);
    
}
/*
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //NSLog(@"touches ended");
    //
    NSLog(@"_gestureRecognizer : %d", _gestureRecognizer.state);
    
    if (_ignoreCounter == 0) {
        [super touchesEnded:touches withEvent:event];
    } else {
        _ignoreCounter--;
    }

}
*/
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /*
        _enabled = YES;
        self.enabled = YES;
        */
        _ignoreCounter = 0;
        _gestureRecognizer = [[[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(longPressAction:)] autorelease];
        [self addGestureRecognizer:_gestureRecognizer];
        _gestureRecognizer.cancelsTouchesInView = NO;
        //gestureRecognizer.delaysTouchesEnded = YES;
    }
    return self;
}

- (void)dealloc {
    //RELEASE(_gestureRecognizer);
    RELEASE(_object);
    [super dealloc];
}

- (void)setObject:(id)object {
    RELEASE(_object);
    _object = [object retain];

    if ([object isKindOfClass:[AKTableObject class]]) {
        AKTableObject *tableObject = object;
        self.enabled = tableObject.enabled;
    }
    
//    self.textLabel.text = @"Omega";
}

- (void)setEnabled:(BOOL)value {
    //if (_enabled != value) {
        if (value) {
            self.selectionStyle = UITableViewCellSelectionStyleBlue;
            self.textLabel.textColor = [UIColor blackColor];
        } else {
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            self.textLabel.textColor = [UIColor grayColor];
        }
    //}
    _enabled = value;
}

@end
