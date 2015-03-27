//
//  MyGuiView.cpp
//  IntegrationUIKit_OF
//
//  Created by Terry Bu on 3/5/15.
//
//

#include "MyGuiView.h"
#include "ofxiPhoneExtras.h"
#include "ofApp.h"

@implementation MyGuiView

ofApp *myApp;

-(void)viewDidLoad {
    myApp = (ofApp*)ofGetAppPtr();
}

-(IBAction)radiusSliderHandler:(id)sender {
    UISlider *sliderObj = sender;
    myApp->radius = [sliderObj value];
}

-(IBAction)fillSwitchHandler:(id)sender {
    UISwitch *switchObj = sender;
    myApp->hasFill = [switchObj isOn];
}

@end