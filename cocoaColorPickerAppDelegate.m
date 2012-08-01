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
@synthesize rStepSize;
@synthesize gStepSize;
@synthesize bStepSize;
@synthesize wStepSize;
@synthesize aStepSize;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	self.aStepSize = 1.0;
	colorView.alpha = self.aStepSize;
}

- (void)sliderChanged:(id)sender
{
	// RGB and WHITE are handled seperatly so if one is 
	// set, reset the other. RGB is color, WHITE is grayscale
	if (r == sender) {
		//NSLog(@"slider r changed to %f", rStepSize);
		self.wStepSize = 0.0;
		colorView.white   = self.wStepSize;
		[grayscaleCode setEnabled:NO];

		[colorCode setEnabled:YES];
		colorView.red = rStepSize;
	}
	if (g == sender) {
		//NSLog(@"slider g changed to %f", gStepSize);
		self.wStepSize = 0.0;
		colorView.white   = self.wStepSize;
		[colorCode setEnabled:YES];
		[grayscaleCode setEnabled:NO];
		
		[colorCode setEnabled:YES];
		colorView.green = gStepSize;
	}
	if (b == sender) {
		//NSLog(@"slider b changed to %f", bStepSize);
		self.wStepSize = 0.0;
		colorView.white   = self.wStepSize;
		[grayscaleCode setEnabled:NO];
		
		[colorCode setEnabled:YES];
		colorView.blue = bStepSize;
	}
	if (w == sender) {
		//NSLog(@"slider w changed to %f", wStepSize);
		self.rStepSize = 0.0;
		self.gStepSize = 0.0;
		self.bStepSize = 0.0;
		
		colorView.red   = self.rStepSize;
		colorView.green = self.gStepSize;
		colorView.blue  = self.bStepSize;
		[colorCode setEnabled:NO];
		
		[grayscaleCode setEnabled:YES];
		colorView.white = wStepSize;
	}
	if (a == sender) {
		//NSLog(@"slider a changed to %f", aStepSize);
		colorView.alpha = aStepSize;
	}
	
	if ([colorCode isEnabled]) {
		[grayscaleCode setStringValue:@""];
		[colorCode setStringValue:[NSString stringWithFormat:@"[NSColor colorWithCalibratedRed:%.2f green:%.2f blue:%.2f alpha:%.2f]", 
								   self.rStepSize,
								   self.gStepSize,
								   self.bStepSize,
								   self.aStepSize]];
	}

	if ([grayscaleCode isEnabled]) {
		[colorCode setStringValue:@""];
		[grayscaleCode setStringValue:[NSString stringWithFormat:@"[NSColor colorWithCalibratedWhite:%.2f alpha:%.2f]", 
									   self.wStepSize,
									   self.aStepSize]];
	}
}

@end
