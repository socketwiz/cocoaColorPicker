//
//  ColorView.m
//  cocoaColorPicker
//
//  Created by Ricky Nelson on 8/1/10.
//  Copyright 2010 Lark Software, LLC. All rights reserved.
//

#import "ColorView.h"


@implementation ColorView
@dynamic red;
@dynamic green;
@dynamic blue;
@dynamic white;
@dynamic alpha;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	dirtyRect = [self bounds];
	
	NSColor *newColor;
	
	if (white > 0) {
		newColor = [NSColor colorWithCalibratedWhite:white alpha:alpha];
	}
	else {
		newColor = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
	}

	[newColor set];
	[NSBezierPath fillRect: dirtyRect];	
}

- (void)setRed:(CGFloat)aColor
{
	red = aColor;
	[self setNeedsDisplay:YES];
}
- (void)setGreen:(CGFloat)aColor
{
	green = aColor;
	[self setNeedsDisplay:YES];
}
- (void)setBlue:(CGFloat)aColor
{
	blue = aColor;
	[self setNeedsDisplay:YES];
}
- (void)setWhite:(CGFloat)aColor
{
	white = aColor;
	[self setNeedsDisplay:YES];
}
- (void)setAlpha:(CGFloat)aColor
{
	alpha = aColor;
	[self setNeedsDisplay:YES];
}

@end
