//
//  AKWebAppControllerMethods.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/03/17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AKWebAppControllerMethods.h"
#import "AKNavigationController.h"
#import "Additions.h"

@implementation AKWebAppController (Runtime)

// --------------------------------------------------

#pragma -
#pragma for UIAlertView

- (void)showAlertWithMessage:(NSString *)message {
    [UIAlertView showAlertWithMessage:message];
}

// --------------------------------------------------

#pragma -
#pragma for UIActionSheet

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //NSString *script = (NSString *)actionSheet.tag;
    NSLog(@"clickedButtonAtIndex : %d", buttonIndex);
    /*
     NSString *script = [NSString stringWithFormat:@"actionSheet_clickedButtonAtIndex(%d);", buttonIndex];
     [_webView stringByEvaluatingJavaScriptFromString:script]; 
     */
    NSString *evaluate = (NSString *)actionSheet.tag;
    if (evaluate && [evaluate isKindOfClass:[NSString class]]) {
        NSLog(@"evaluate : %@", evaluate);
 
    }

}

// --------------------------------------------------

- (void)showActionSheet:(NSString *)title
      cancelButtonTitle:(NSString *)cancelButtonTitle
 destructiveButtonTitle:(NSString *)destructiveButtonTitle
  withOtherButtonTitles:(NSArray *)otherButtonTitles
               evaluate:(NSString *)evaluate {
    
    NSLog(@"title : %@, otherButtonTitles : %@", title, NSStringFromClass([otherButtonTitles class]));
    
    UIActionSheet *actionSheet = [[[UIActionSheet alloc] init] autorelease];
    actionSheet.delegate = self;

    //NSString *someString = @"This is some string";

    if ([evaluate isKindOfClass:[NSString class]]) actionSheet.tag = (NSUInteger)[evaluate retain];
    //NSLog(@"some string : %@", (NSString *)actionSheet.tag);
    
    /*
     [actionSheet setValue:@"SomeValue" forUndefinedKey:@"SomeKey"];
     
     NSLog(@"actionSheet : %@", [actionSheet valueForUndefinedKey:@"SomeKey"]);
     */
    
    if ([title isKindOfClass:[NSString class]]) actionSheet.title = title;
    
    for (NSString *otherButtonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:otherButtonTitle];
    }
    
    if (destructiveButtonTitle) {
        [actionSheet addButtonWithTitle:destructiveButtonTitle];
        [actionSheet setDestructiveButtonIndex:[actionSheet numberOfButtons] - 1];
    }
    
    if (cancelButtonTitle) {
        [actionSheet addButtonWithTitle:cancelButtonTitle];
        [actionSheet setCancelButtonIndex:[actionSheet numberOfButtons] - 1];
    }
    
    [actionSheet showInView:[AKNavigationController shared].window];
}

// --------------------------------------------------

- (void)toolbarAction:(UIBarButtonItem *)sender {
    NSString *evaluate = (NSString *)sender.tag;
    if (evaluate && [evaluate isKindOfClass:[NSString class]]) {
        //NSLog(@"evaluate : %@", evaluate);
        [_webView stringByEvaluatingJavaScriptFromString:evaluate];
    }
}

- (UIBarButtonItemStyle)barButtonItemStyleWithString:(NSString *)string {
    if ([string isKindOfClass:[NSString class]]) {
        if ([string isEqualToString:@"UIBarButtonItemStylePlain"]) return UIBarButtonItemStylePlain;
        if ([string isEqualToString:@"UIBarButtonItemStyleDone"]) return UIBarButtonItemStyleDone;
    }
    return UIBarButtonItemStyleBordered;
}

- (UIBarButtonSystemItem)barButtonSystemItemWithString:(NSString *)string {
    if ([string isKindOfClass:[NSString class]]) {

        if ([string isEqualToString:@"UIBarButtonSystemItemDone"]) return UIBarButtonSystemItemDone;
        if ([string isEqualToString:@"UIBarButtonSystemItemCancel"]) return UIBarButtonSystemItemCancel;
        if ([string isEqualToString:@"UIBarButtonSystemItemEdit"]) return UIBarButtonSystemItemEdit;
        if ([string isEqualToString:@"UIBarButtonSystemItemSave"]) return UIBarButtonSystemItemSave;
        if ([string isEqualToString:@"UIBarButtonSystemItemAdd"]) return UIBarButtonSystemItemAdd;
        if ([string isEqualToString:@"UIBarButtonSystemItemFlexibleSpace"]) return UIBarButtonSystemItemFlexibleSpace;
        if ([string isEqualToString:@"UIBarButtonSystemItemFixedSpace"]) return UIBarButtonSystemItemFixedSpace;
        if ([string isEqualToString:@"UIBarButtonSystemItemCompose"]) return UIBarButtonSystemItemCompose;
        if ([string isEqualToString:@"UIBarButtonSystemItemReply"]) return UIBarButtonSystemItemReply;
        if ([string isEqualToString:@"UIBarButtonSystemItemAction"]) return UIBarButtonSystemItemAction;
        if ([string isEqualToString:@"UIBarButtonSystemItemOrganize"]) return UIBarButtonSystemItemOrganize;
        if ([string isEqualToString:@"UIBarButtonSystemItemBookmarks"]) return UIBarButtonSystemItemBookmarks;
        if ([string isEqualToString:@"UIBarButtonSystemItemSearch"]) return UIBarButtonSystemItemSearch;
        if ([string isEqualToString:@"UIBarButtonSystemItemRefresh"]) return UIBarButtonSystemItemRefresh;
        if ([string isEqualToString:@"UIBarButtonSystemItemStop"]) return UIBarButtonSystemItemStop;
        if ([string isEqualToString:@"UIBarButtonSystemItemCamera"]) return UIBarButtonSystemItemCamera;
        if ([string isEqualToString:@"UIBarButtonSystemItemTrash"]) return UIBarButtonSystemItemTrash;
        
        if ([string isEqualToString:@"UIBarButtonSystemItemPlay"]) return UIBarButtonSystemItemPlay;
        if ([string isEqualToString:@"UIBarButtonSystemItemPause"]) return UIBarButtonSystemItemPause;
        if ([string isEqualToString:@"UIBarButtonSystemItemRewind"]) return UIBarButtonSystemItemRewind;
        if ([string isEqualToString:@"UIBarButtonSystemItemFastForward"]) return UIBarButtonSystemItemFastForward;

        if ([string isEqualToString:@"UIBarButtonSystemItemUndo"]) return UIBarButtonSystemItemUndo;
        if ([string isEqualToString:@"UIBarButtonSystemItemRedo"]) return UIBarButtonSystemItemRedo;

        if ([string isEqualToString:@"UIBarButtonSystemItemPageCurl"]) return UIBarButtonSystemItemPageCurl;

    }
    return NSUIntegerMax;
}

- (NSArray *)toolbarItemsWithArray:(NSArray *)array {
    //
    NSMutableArray *result = [NSMutableArray array];
    
    //
    for (id object in array) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictionary = object;
            
            UIBarButtonItem *item = nil;
            
            id evaluate = [dictionary objectForKey:@"evaluate"];
            
            id title = [dictionary objectForKey:@"title"];
            if ([title isKindOfClass:[NSString class]]) {
                NSString *titleString = title;
                item = [[[UIBarButtonItem alloc] initWithTitle:titleString
                                                         style:[self barButtonItemStyleWithString:[dictionary objectForKey:@"barButtonItemStyle"]]
                                                        target:self
                                                        action:@selector(toolbarAction:)] autorelease];

            }

            if (!item) {
                UIBarButtonSystemItem barButtonSystemItem = [self barButtonSystemItemWithString:[dictionary objectForKey:@"barButtonSystemItem"]];
                if (barButtonSystemItem != NSUIntegerMax) {
                    
                    item = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:barButtonSystemItem target:self action:@selector(toolbarAction:)] autorelease];
                }
            }
            
            if (item) {
                if ([evaluate isKindOfClass:[NSString class]]) {
                    NSString *evaluateString = evaluate;
                    item.tag = (NSUInteger)[evaluateString retain];
                }
                
                [result addObject:item];
            }
            
        }
    }
    
    return result;
}

- (void)setToolbarItems:(NSArray *)toolbarItems {
    //
    [super setToolbarItems:[self toolbarItemsWithArray:toolbarItems] animated:YES];
}

@end
