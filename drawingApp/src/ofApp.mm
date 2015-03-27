#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
    //iPhone基本設定
    ofRegisterTouchEvents(this);
    ofxAccelerometer.setup();
    ofxiPhoneAlerts.addListener(this);
    
    //横位置で起動
//    iPhoneSetOrientation(OFXIOS_ORIENTATION_LANDSCAPE_RIGHT);
    
    //画面の基本設定
    ofBackground(255, 255, 255);
    ofSetBackgroundAuto(false); //this seems to redraw the background at every frame if set to true, meaning that even if you drew black circles, they would go away at every frame. Only when you set to false, the drawing effect works. 
    ofEnableSmoothing();
    drawing = false;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    //もし現在ドロー中だったら
    if (drawing) {
        ofSetColor(0, 0, 0);
        ofCircle(touchLoc.x, touchLoc.y, 10);
    }
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    //ドロー中に
    drawing = true;
    //タッチしている場所を記録
    touchLoc.x = touch.x;
    touchLoc.y = touch.y;
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
//    drawing = true;
    
    //ひとつ前の座標を記録
    touchLoc.x = touch.x;
    touchLoc.y = touch.y;
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    //ドローを終了
    drawing = false;
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    ofSetColor(255, 255, 255);
    ofRect(0, 0, ofGetWidth(), ofGetHeight());
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

}
