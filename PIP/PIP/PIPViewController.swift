//
//  PIPViewController.swift
//  PIP
//
//  Created by Huy Nguyễn on 08/08/2021.
//

import UIKit
import AVFoundation
import AVKit

class PIPViewController: UIViewController {
    var playerController: AVPictureInPictureController?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        beginPicutreInPictureMode()
    }
    
    func beginPicutreInPictureMode() {
        let url = NSURL(string: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4")

        let avPlayer = AVPlayer(url: url! as URL)
        let layer = AVPlayerLayer(player: avPlayer)
     
        layer.frame = UIScreen.main.bounds
        view.layer.addSublayer(layer)

        guard AVPictureInPictureController.isPictureInPictureSupported() else {
            print("Picture in Picture mode is not supported")
            return
        }
       
        if let pip = AVPictureInPictureController(playerLayer: layer) {
            pip.delegate = self
            playerController = pip
        }
    }
    
    @IBAction func actionPIPStart(_ sender: UIButton) {
        if playerController?.isPictureInPicturePossible == true {
            playerController?.playerLayer.player?.play()
            playerController?.startPictureInPicture()
        } else {
            //This property value is false if another app, like FaceTime, is presenting Picture in Picture content.
        }
    }
}

extension PIPViewController: AVPictureInPictureControllerDelegate {
    
    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        //Update video controls of main player to reflect the current state of the video playback.
        //You may want to update the video scrubber position.
    }
    
    func pictureInPictureControllerWillStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        //Handle PIP will start event
    }
    
    func pictureInPictureControllerDidStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        //Handle PIP did start event
    }
    
    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, failedToStartPictureInPictureWithError error: Error) {
        //Handle PIP failed to start event
    }
    
    func pictureInPictureControllerWillStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        //Handle PIP will stop event
    }
    
    func pictureInPictureControllerDidStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        //Handle PIP did start event
    }
}
