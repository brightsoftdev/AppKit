//
//  Controller.m
//  iOSKit
//
//  Created by Hiroshi Horie on 11/01/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestController1.h"


@implementation TestController1

- (void)buttonAction:(id)sender {
	UIViewController *controller = [[[[self class] alloc] init] autorelease];
	[self.navigationController pushViewController:controller animated:YES];
}

- (void)objectAction:(XTableTextObject *)tableObject {
	//tableObject.text = @"-";
	//tableObject.enabled = NO;
	//[tableObject update];
	[UIAlertView showAlertWithMessage:tableObject.text];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nil bundle:nil]) {
		self.title = @"XController";
		self.style = UITableViewStyleGrouped;
        
		_dataSource = [[AKTableViewGenericDataSource alloc] init];
		_delegate = [[AKTableViewDelegate alloc] init];
		
		UITextField *textField = [[[UITextField alloc] init] autorelease];
		textField.returnKeyType = UIReturnKeyDone;
		textField.delegate = self;
        
		_dataSource.sectionTitles = [NSArray arrayWithObjects:
									 @"Sigma",
									 @"Omega",
									 nil];
		_dataSource.sectionFooters = [NSArray arrayWithObjects:
									  @"",
									  @"This is some fuckin string.This is some fuckin string.This is some fuckin string.",
									  nil];
		
		XTableTextObject *_textObject = [XTableTextObject itemWithText:@"Second item"];
		_textObject.delegate = self;
		_textObject.selector = @selector(objectAction:);
		//_textObject.enabled = NO;
        
        XTableImageObject *_imageObject = [XTableImageObject itemWithText:@"Sigma is cool"];
        _imageObject.imageURL = @"http://www.google.co.jp/images/srpr/nav_logo27.png";
        
		_dataSource.items = [NSArray arrayWithObjects:
							 _imageObject,
							 _textObject,
							 [NSArray arrayWithObjects:
                              [XTableTextObject itemWithText:@"Item aa"],
                              [XTableTextObject itemWithText:@"Item aa"],
                              [XTableTextObject itemWithText:@"Item aa"],
                              nil],
							 [XTableTextObject itemWithText:@"Sigma is cool"],
							 nil];
    }
    return self;
}

- (id)init {
	if (self = [super init]) {

	}
	return self;
}

- (void)dealloc {
	RELEASE(_dataSource);
	RELEASE(_delegate);
	[super dealloc];
}

- (void)loadView {
	[super loadView];
	
	self.tableView.dataSource = _dataSource;
	self.tableView.delegate = _delegate;
/*
    XURLRequest *request = [XURLRequest requestWithURL:@"http://pds.exblog.jp/pds/1/200811/16/37/f0007637_204202.jpg" delegate:nil];
    [request start];
*/
/*
    XImageView *imageView = [[[XImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)] autorelease];
    imageView.defaultImage = [UIImage imageNamed:@"test"];
    imageView.imageURL = @"http://www.google.co.jp/images/srpr/nav_logo27.png";
    self.tableView.tableHeaderView = imageView;
    //[self.tableView addSubview:imageView];
*/

	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Next"
																			   style:UIBarButtonItemStylePlain 
																			  target:self
																			  action:@selector(buttonAction:)] autorelease];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	//
	NSLog(@"tf : %@", textField.superview.superview);
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

	if (!self.tableView.decelerating) {
		NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)textField.superview.superview];
		[self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
	}
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

/*
- (void)loadView {
	[super loadView];

	UILabel *l = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 0, 0)] autorelease];
	l.text = @"Hi, This is a Label.";
	
	[l sizeToFit];
	[self.view addSubview:l];
	
	//NSLog(@"self.view : %@", self.view);
	
	
}
*/

@end
