//
//  VideoPlayerHelper.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation
import AVKit

enum VideoPlayerHelper {
    static func playVideo(id: String) -> AVPlayer? {
        guard let url = Bundle.main.url(forResource: id, withExtension: "mp4") else {
            print("Video file not found")
            return nil
        }
        let player = AVPlayer(url: url)
        player.play()
        return player
    }
}
