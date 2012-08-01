//
//  ColorView.m
//  cocoaColorPicker
//
// Copyright (c) 2012, Ricky Nelson
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of the Ricky Nelson nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
