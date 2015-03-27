#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
    // iPhone用初期設定
    ofRegisterTouchEvents(this);
    ofxAccelerometer.setup();
    ofxiPhoneAlerts.addListener(this);
    ofEnableSmoothing();
    ofSetCircleResolution(64);
    ofEnableAlphaBlending();
    
    //カメラ初期設定
    cameraPixels = NULL;
    camera = new ofxiOSImagePicker();
    camera->setMaxDimension(480);
    
    status = 0;
}

//--------------------------------------------------------------
void ofApp::update(){
    //実機使用の場合
    if(camera->getImageUpdated()){
        //カメラのメモリ領域を確保
        if (cameraPixels == NULL){
            cameraPixels = new unsigned char [camera->getWidth() * camera->getHeight()*4];
        }
        
        //カメラの画像のままだと上下反転してるので、イメージの上下を反転
        for (int i = 0; i < camera->getHeight(); i++){
            memcpy(cameraPixels+(camera->getHeight()-i-1)*camera->getWidth()*4, camera->getPixels()+i*camera->getWidth()*4, camera->getWidth()*4);
        }
        
        //カメラから取得したイメージを、処理用のofImage(photo)にコピーする
        photo.setFromPixels(cameraPixels, camera->getWidth(), camera->getHeight(), OF_IMAGE_COLOR_ALPHA);
//        camera->getImageUpdated() = false;
        status = 1;
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    if (status == 0) {
        //撮影を促す画面を表示
        ofSetColor(255, 255, 255);
        ofDrawBitmapString("Double tap on the screen!!", 40, ofGetHeight()/2-5);
    }
    
    if(status == 1){
        //撮影した画像を表示
        photo.draw(0, 0);
    }
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
    camera->openCamera();
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
