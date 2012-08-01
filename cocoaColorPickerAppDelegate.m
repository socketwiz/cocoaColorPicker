//
//  cocoaColorPickerAppDelegate.m
//  cocoaColorPicker
//
//  Created by Ricky Nelson on 8/1/10.
//  Copyright 2010 Lark Software, LLC. All rights reserved.
//

#import "cocoaColorPickerAppDelegate.h"

@implementation cocoaColorPickerAppDelegate

@synthesize window;
@synthesize redStepSize;
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
	// RGB and WHITE are handled seperatly so if one is 
	// set, reset the other. RGB is color, WHITE is grayscale
	if (red == sender) {
		//NSLog(@"slider r changed to %f", rStepSize);
		self.whiteStepSize = 0.0;
		colorView.white   = self.whiteStepSize;
		[grayscaleCode setEnabled:NO];

		[colorCode setEnabled:YES];
		colorView.red = redStepSize;
	}
	if (green == sender) {
		//NSLog(@"slider g changed to %f", gStepSize);
		self.whiteStepSize = 0.0;
		colorView.white   = self.whiteStepSize;
		[colorCode setEnabled:YES];
		[grayscaleCode setEnabled:NO];
		
		[colorCode setEnabled:YES];
		colorView.green = greenStepSize;
	}
	if (blue == sender) {
		//NSLog(@"slider b changed to %f", bStepSize);
		self.whiteStepSize = 0.0;
		colorView.white   = self.whiteStepSize;
		[grayscaleCode setEnabled:NO];
		
		[colorCode setEnabled:YES];
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
		[colorCode setEnabled:NO];
		
		[grayscaleCode setEnabled:YES];
		colorView.white = whiteStepSize;
	}
	if (alpha == sender) {
		//NSLog(@"slider a changed to %f", aStepSize);
		colorView.alpha = alphaStepSize;
	}
	
	if ([colorCode isEnabled]) {
		[grayscaleCode setStringValue:@""];
		[colorCode setStringValue:[NSString stringWithFormat:@"[NSColor colorWithCalibratedRed:%.2f green:%.2f blue:%.2f alpha:%.2f]", 
								   self.redStepSize,
								   self.greenStepSize,
								   self.blueStepSize,
								   self.alphaStepSize]];
	}

	if ([grayscaleCode isEnabled]) {
		[colorCode setStringValue:@""];
		[grayscaleCode setStringValue:[NSString stringWithFormat:@"[NSColor colorWithCalibratedWhite:%.2f alpha:%.2f]", 
									   self.whiteStepSize,
									   self.alphaStepSize]];
	}
}

@end
