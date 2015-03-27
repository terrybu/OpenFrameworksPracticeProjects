#include "ofApp.h"
#include "MyGuiView.h"

MyGuiView *gui;

//--------------------------------------------------------------
void ofApp::setup(){	
    ofBackground( ofColor::red );
    
    radius = 100;
    hasFill = true;
    
    gui = [[MyGuiView alloc] initWithNibName:@"MyGuiView" bundle:nil];
    [ofxiOSGetGLParentView() addSubview:gui.view];
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    if ( hasFill ) {
        ofFill();
    }
    else {
        ofNoFill();
    }
    ofSetColor( ofColor::white );
    ofCircle( ofGetWidth() / 2, ofGetHeight() / 2, radius );
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    // toggle gui view visibility
    gui.view.hidden = !gui.view.hidden;
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    ofSetOrientation((ofOrientation)newOrientation);
}
