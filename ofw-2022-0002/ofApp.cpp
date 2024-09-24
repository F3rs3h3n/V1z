#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetBackgroundAuto(false);
    ofEnableAlphaBlending();
    sound.load("ofw-2022-0002.aif");
    sound.play();
    sound.setLoop(true);
    ofSetFrameRate(60);
    ofSetLineWidth(1);
    
    
    
    fft_a = new float[512];
    for (int i = 0; i < 512; i++) {
        fft_a[i] = 0;
    }

    bands = 512;
    nextEventSeconds = 0;
    ofst = 0;
    cnt = 1;
    kei = 10000;
    kei2 = 10000;
    i = 0;
}

//--------------------------------------------------------------
void ofApp::update(){
    ofSoundUpdate();
    
    soundSpectrum = ofSoundGetSpectrum(bands);
    for (int i = 0; i < bands; i++) {
        fft_a[i] *= 0.8;
      if (fft_a[i] < soundSpectrum[i]) {
          fft_a[i] = soundSpectrum[i];
      }
    }
    
    ofst += 3;
    if (ofst > 1800) {
        ofst = 0;
        cnt += 1;
    }
    if (cnt > 5){
        kei += ofRandom(-1000, 1000);
        kei2 += ofRandom(-1000, 1000);
    }
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    //全画面を半透明の黒でフェード
    ofSetColor(0, 0, 0, fft_a[256]*100);
    ofDrawRectangle(0, 0, ofGetWidth(), ofGetHeight());
    ofSetColor(fft_a[256]*kei, fft_a[256]*16000, fft_a[256]*kei2, 192);
    // ofTranslate(10,10);
    ofTranslate( -500, 0, 500 - ofst);
    ofPolyline polyline;
    for (int j = 0; j < bands; j++) {
        float r = sin(i/2) * 1000;
        polyline.addVertex(ofVec3f((ofGetWidth()/2 + sin(i/2) * r) + (sin(i/2) * fft_a[j]), (ofGetHeight()/2 + cos(i/2) * r + ((i / 360 - 2) - fft_a[j] + cos(i/2))), j * (fft_a[j] * 10) ));
        i+=0.005*HALF_PI*0.5;
        if (i > 720) {
            i = 0;
        }
    }
    polyline.draw();
}


//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){

}

