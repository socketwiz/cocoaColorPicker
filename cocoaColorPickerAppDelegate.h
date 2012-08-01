//
//  cocoaColorPickerAppDelegate.h
//  cocoaColorPicker
//
//  Created by Ricky Nelson on 8/1/10.
//  Copyright 2010 Lark Software, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ColorView.h"

@interface cocoaColorPickerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	
	IBOutlet NSSlider *red;
	IBOutlet NSSlider *green;
	IBOutlet NSSlider *blue;
	IBOutlet NSSlider *white;
	IBOutlet NSSlider *alpha;

	IBOutlet ColorView *colorView;
	IBOutlet NSTextField *colorCode;
	IBOutlet NSTextField *grayscaleCode;
}

@property (assign) IBOutlet NSWindow *window;
@property (readwrite) CGFloat redStepSize;
@property (readwrite) CGFloat greenStepSize;
@property (readwrite) CGFloat blueStepSize;
@property (readwrite) CGFloat whiteStepSize;
@property (readwrite) CGFloat alphaStepSize;

- (void)sliderChanged:(id)sender;

@end
