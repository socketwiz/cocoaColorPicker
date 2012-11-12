//
//  cocoaColorPickerAppDelegate.m
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

#import "cocoaColorPickerAppDelegate.h"

@implementation cocoaColorPickerAppDelegate

@synthesize window;
@synthesize redStepSize = _redStepSize;
@synthesize greenStepSize;
@synthesize blueStepSize;
@synthesize whiteStepSize;
@synthesize alphaStepSize;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	self.alphaStepSize = 1.0;
	colorView.alpha = self.alphaStepSize;
}

- (void)sliderChanged:(id)sender
{
    // make this static so that if the alpha level is changed it knows
    // whether to modify color or grayscale settings
    static BOOL isColor = NO;

	// RGB and WHITE are handled seperatly so if one is 
	// set, reset the other. RGB is color, WHITE is grayscale
	if (red == sender) {
		//NSLog(@"slider r changed to %f", rStepSize);
		self.whiteStepSize = 0.0;
		colorView.white   = self.whiteStepSize;
		isColor = YES;
		colorView.red = self.redStepSize;
	}
	if (green == sender) {
		//NSLog(@"slider g changed to %f", gStepSize);
		self.whiteStepSize = 0.0;
		colorView.white   = self.whiteStepSize;
		isColor = YES;
		colorView.green = greenStepSize;
	}
	if (blue == sender) {
		//NSLog(@"slider b changed to %f", bStepSize);
		self.whiteStepSize = 0.0;
		colorView.white   = self.whiteStepSize;
		isColor = YES;
		colorView.blue = blueStepSize;
	}
	if (white == sender) {
		//NSLog(@"slider w changed to %f", wStepSize);
		self.redStepSize = 0.0;
		self.greenStepSize = 0.0;
		self.blueStepSize = 0.0;
		
		colorView.red   = self.redStepSize;
		colorView.green = self.greenStepSize;
		colorView.blue  = self.blueStepSize;
		isColor = NO;
		colorView.white = whiteStepSize;
	}
	if (alpha == sender) {
		//NSLog(@"slider a changed to %f", aStepSize);
		colorView.alpha = alphaStepSize;
	}
	
	if (isColor == YES) {
		[colorCode setStringValue:@""];
		[colorCode setStringValue:[NSString stringWithFormat:@"[NSColor colorWithCalibratedRed:%.2f green:%.2f blue:%.2f alpha:%.2f]", 
								   self.redStepSize,
								   self.greenStepSize,
								   self.blueStepSize,
								   self.alphaStepSize]];
	}

	if (isColor == NO) {
		[colorCode setStringValue:@""];
		[colorCode setStringValue:[NSString stringWithFormat:@"[NSColor colorWithCalibratedWhite:%.2f alpha:%.2f]", 
									   self.whiteStepSize,
									   self.alphaStepSize]];
	}
}

@end
