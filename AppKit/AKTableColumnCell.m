//
//  AKTableColumnCell.m
//  AppKit
//
//  Created by Hiroshi Horie on 11/03/06.
//  Copyright 2011 AppAge Limited. All rights reserved.
//

#import "AKTableColumnCell.h"
#import "Global.h"

@implementation AKTableColumnCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        _cell1 = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"Cell1"];
        //_cell1.backgroundColor = [UIColor redColor];
        //_cell1.highlighted = YES;
        _cell1.selectionStyle = UITableViewCellSelectionStyleBlue;
        [self.contentView addSubview:_cell1];

        _cell2 = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"Cell2"];
        _cell2.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_cell2];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _cell1.frame = CGRectMake(0, 0, 100, self.contentView.frame.size.height);
    _cell2.frame = CGRectMake(100, 0, 100, self.contentView.frame.size.height);
}

- (void)dealloc {
    RELEASE(_cell1)
    RELEASE(_cell2)
    
    [super dealloc];
}

@end
