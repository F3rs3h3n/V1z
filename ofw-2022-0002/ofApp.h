#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void keyPressed(int key);
        void keyReleased(int key);
        void mouseMoved(int x, int y );
        void mouseDragged(int x, int y, int button);
        void mousePressed(int x, int y, int button);
        void mouseReleased(int x, int y, int button);
        void mouseEntered(int x, int y);
        void mouseExited(int x, int y);
        void windowResized(int w, int h);
        void dragEvent(ofDragInfo dragInfo);
        void gotMessage(ofMessage msg);
        
    ofSoundPlayer sound;
    
    float *fft_a;
    float *fft_b;
    float *fft_c;
    float *fft_d;
    float *fft_e;
    float *soundSpectrum;
    int bands;
    float nextEventSeconds;
    int ofst;
    int cnt;
    float kei;
    float kei2;
    float kei3;
    float i;
};

