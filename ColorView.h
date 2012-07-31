//
//  ColorView.h
//  cocoaColorPicker
//
//  Created by Ricky Nelson on 8/1/10.
//  Copyright 2010 Lark Software, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ColorView : NSView {
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	CGFloat white;
	CGFloat alpha;
}

@property (readwrite) CGFloat red;
@property (readwrite) CGFloat green;
@property (readwrite) CGFloat blue;
@property (readwrite) CGFloat white;
@property (readwrite) CGFloat alpha;

@end
