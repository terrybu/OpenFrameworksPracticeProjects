#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

//シミュレータを使用する際には、コメントアウトを外す
//#define _USE_SIMULATOR

class ofApp : public ofxiOSApp {
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
        //カメラの画像を一時的に格納する領域
        unsigned char * cameraPixels;
        //カメラを使用するためのアドオン
        ofxiOSImagePicker * camera;
        //撮影した画像データ
        ofImage   photo;
        //現在の状態を格納
        //0:撮影待ち, 1:画像処理, 2:処理終了(待機)
        int status;

};


