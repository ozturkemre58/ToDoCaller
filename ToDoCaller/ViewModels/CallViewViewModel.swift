//
//  CallViewViewModel.swift
//  ToDoCaller
//
//  Created by Emre Öztürk on 25.02.2024.
//

import AVFoundation
import UIKit

class CallViewViewModel: ObservableObject {
    var player: AVAudioPlayer?
    
    func playRingtone() {
        guard let url = Bundle.main.url(forResource: "ringtone", withExtension: "mp3") else {
            print("Ses dosyası bulunamadı.")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            
            guard let player = player else { return }
            
            player.numberOfLoops = -1 // Müziği sonsuz tekrarla
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopRingtone() {
        player?.stop()
    }
}
