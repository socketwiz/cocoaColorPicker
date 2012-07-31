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
	
	IBOutlet NSSlider *r;
	IBOutlet NSSlider *g;
	IBOutlet NSSlider *b;
	IBOutlet NSSlider *w;
	IBOutlet NSSlider *a;

	IBOutlet ColorView *colorView;
	IBOutlet NSTextField *colorCode;
	IBOutlet NSTextField *grayscaleCode;

	CGFloat rStepSize;
	CGFloat gStepSize;
	CGFloat bStepSize;
	CGFloat wStepSize;
	CGFloat aStepSize;
}

@property (assign) IBOutlet NSWindow *window;
@property (readwrite) CGFloat rStepSize;
@property (readwrite) CGFloat gStepSize;
@property (readwrite) CGFloat bStepSize;
@property (readwrite) CGFloat wStepSize;
@property (readwrite) CGFloat aStepSize;

- (void)sliderChanged:(id)sender;

@end
