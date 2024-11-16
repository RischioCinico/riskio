/*   vim:set foldenable foldmethod=marker:
 *
 *   Copyright (C) 2018 Paul Stockwell
 * 
 *   Credit to Ivan Cukic <ivan.cukic(at)kde.org> Copyright (C) 2011 for the original 
 *   Hand_Scan_Splash that inspired this version
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
import QtQuick 2.5
import QtQuick.Window 2.2


Rectangle {
    id: background  /*This rectangle makes sure the background is black
                      at both sides when this splash is used on 16:9 
                      monitors. By drawing a black rectangle the size of 
                      the screen*/
    width: Screen.width
    height: Screen.height
    color: "black"
    x: 0
    y: 0
    scale: 1
    visible: true
    
      property var scalefactor : .8 /* can be used to scale the splash
                                       within the canvas rectangle (see
                                       object canvas below) */
      property int stage : 0        /* stage is changed by the plasma login */
 
      onStageChanged: {
        if (stage == 1) {
            anim0.currentFrame = 15 //set current frame to a visible one
            anim0.running = false   //stop animation
            kded.visible = true
            anim1.running = true
         }else if (stage == 2) {
            anim1.currentFrame = 15
            anim1.running = false
            confupdate.visible = true
            anim2.running = true
        }else if (stage == 3) {
            anim2.currentFrame = 15
            anim2.running = false
            kcminit.visible = true
            anim3.running = true
        }else if (stage == 4) {
            anim3.currentFrame = 15
            anim3.running = false
            ksmserver.visible = true
            anim4.running = true
        }else if (stage == 5) {
            anim4.currentFrame = 15
            anim4.running = false
            wm.visible = true
            anim5.running = true
            anim6.running = true
            anim7.currentFrame = 1
            anim7.running = false
            fncrcl.visible = true
            fncrcl.state = "rotated"
        }else if (stage == 6) {
            anim5.currentFrame = 15
            anim5.running = false
            anim6.currentFrame = 15
            anim6.running = false
            desktop.visible = true
        }
    }
    
   
Item {
    id: canvas /*Canvas is an item type object the same size as the main graphic and
                 provides a parent object who's properties will control all the 
                 child objects. This means all scaling and positions are correctly 
                 maintained regardless of screen size and user scalefactor */
    width: 1280
    height: 1024 
    clip: true
    //color: "black"
    x: (Screen.width-1280)/2  // position rectangle in the centre of the screen
    y: (Screen.height-1024)/2 // position rectangle in the centre of the screen
    scale:(Screen.height/1024)*scalefactor /* Size the splash screen to fit the 
                                              available height of the screen. 
                                              Note scalefactor can be used to 
                                              increase or decrease the displayed
                                              size of the splash screen */
    visible: true

/* The rectangle object mouse contains a MouseArea used to create the stage event
   for testing. Use the terminal command "qml Splash.qml" to run the graphic from Term 
Rectangle {
    id: mouse
    width: 290; height: 20
    color: "darkgreen"
    x: 267
    y: 625
    radius: 3
    opacity: .5
    
    Text {
          text: "Click here for next stage"
          font.pointSize: 10
          color: "white"
          x: 75
          y: 4
         }
    MouseArea {
        anchors.fill: parent
        onClicked: { 
                    stage ++
                    console.log("clicked "+stage)
                   }
              }
        }
     */   
        

       Image {
        id: bg
        sourceSize.width: 1280
        sourceSize.height: 1024
        source: "1280x1024/background.png"
    }
    

    AnimatedSprite {
        id: anim0
        width: 123
        height: 148
        frameWidth: 123
        frameHeight: 148
        x: 650
        y: 231
        frameDuration: 30
        source: "1280x1024/anim0.png"
        frameCount: 30
        running: true
    }
    
        AnimatedSprite {
        id: anim1
        width: 123
        height: 148
        x: 650
        y: 164
        frameDuration: 30
        source: "1280x1024/anim1.png"
        frameCount: 30
        frameWidth: 123
        frameHeight: 148
        running: false
    }

        AnimatedSprite {
        id: anim2
        width: 123
        height: 147
        x: 774
        y: 198
        frameDuration: 30
        source: "1280x1024/anim2.png"
        frameCount: 30
        frameWidth: 123
        frameHeight: 147
        running: false
    }

        AnimatedSprite {
        id: anim3
        width: 123
        height: 146
        x: 764
        y: 117
        frameDuration: 30
        source: "1280x1024/anim3.png"
        frameCount: 30
        frameWidth: 123
        frameHeight: 146
        running: false
    }

        AnimatedSprite {
        id: anim4
        width: 123
        height: 140
        x: 906
        y: 294
        frameDuration: 30
        source: "1280x1024/anim4.png"
        frameCount: 30
        frameWidth: 123
        frameHeight: 140
        running:false
    }

        AnimatedSprite {
        id: anim5
        width: 123
        height: 148
        x: 904
        y: 156
        frameDuration: 30
        source: "1280x1024/anim5.png"
        frameCount: 30
        frameWidth: 123
        frameHeight: 148
        running: false
    }

        AnimatedSprite {
        id: anim6
        width: 122
        height: 148
        x: 1039
        y: 480
        frameDuration: 30
        source: "1280x1024/anim6.png"
        frameCount: 30
        frameWidth: 122
        frameHeight: 148
        running: false
    }

        AnimatedSprite {
        id: anim7
        width: 123
        height: 148
        x: 934
        y: 156
        frameDuration: 70
        source: "1280x1024/anim7.png"
        frameCount: 30
        frameWidth: 123
        frameHeight: 148
        running: true
    }
        AnimatedImage {
        id: future
        source: "1280x1024/future1.gif"
        x: 256
        y: 403
        opacity: 1
        visible: true
    }   

    Image {
        id: initial
        source: "1280x1024/initial.png"
        x: 256
        y: 675
    }

    Image {
        id: kded
        source: "1280x1024/kded.png"
        x: 256
        y: 231
        visible: false
    }
    Image {
        id: confupdate
        source: "1280x1024/confupdate.png"
        x: 256
        y: 164
        visible: false
    }
    Image {
        id: kcminit
        source: "1280x1024/kcminit.png"
        x: 256
        y: 198
        visible: false
    }
    Image {
        id: ksmserver
        source: "1280x1024/ksmserver.png"
        x: 256
        y: 118
        visible: false
    }
    Image {
        id: wm
        source: "1280x1024/wm.png"
        x: 256
        y: 294
        visible: false
    }
    Image {
        id: desktop
        source: "1280x1024/desktop.png"
        x: 256
        y: 156
        visible: false
    }
    Image {
        id: fncrcl
        source: "1280x1024/fncrcl.png"
        x: 934
        y: 156
        opacity: .8
        visible: false
         
        states: State {
                    name: "rotated"
                    PropertyChanges { target: fncrcl; rotation: 630 }
                    }
                transitions: Transition 
                {
                  RotationAnimation 
                    { 
                     duration: 3000; 
                     direction: RotationAnimation.clockwise 
                    }
                }        
        
    }
}
}
