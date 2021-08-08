//
//  AVPViewController.swift
//  PIP
//
//  Created by Huy Nguyễn on 08/08/2021.
//

import UIKit
import AVFoundation
import AVKit

class AVPViewController: UIViewController {
    var playerController : AVPlayerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func play(_ sender: Any) {
        
        let url = NSURL(string: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4")

        let player = AVPlayer(url: url! as URL)
        
        playerController = AVPlayerViewController()
        
        playerController.player = player
        
        playerController.allowsPictureInPicturePlayback = true
      
        playerController.delegate = self
        
        playerController.player?.play()
        
        self.present(playerController, animated: true, completion : nil)
    }
}

extension AVPViewController: AVPlayerViewControllerDelegate {
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        let currentviewController = navigationController?.visibleViewController
        if currentviewController != playerViewController{
            currentviewController?.present(playerViewController, animated: true, completion: nil)
        }
    }
}
