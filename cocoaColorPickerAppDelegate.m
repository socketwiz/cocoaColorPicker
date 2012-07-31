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
