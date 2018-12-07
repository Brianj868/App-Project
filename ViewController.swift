//
//  ViewController.swift
//  Fitness
//
//  Created by Brian Johnston on 4/24/18.
//  Copyright © 2018 Brian Johnston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetBtn.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var status: Bool = false
    
    @IBOutlet weak var timeDisplay: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBAction func startStop(_ sender: UIButton!) {
        // If button status is true use stop function, relabel button and enable reset button
        if (status) {
            stop()
            sender.setTitle("Start", for: .normal)
            resetBtn.isEnabled = true
            sender.setTitleColor(.green, for: .normal)
            // If button status is false use start function, relabel button and disable reset button
        } else {
            start()
            sender.setTitle("Stop", for: .normal)
            resetBtn.isEnabled = false
            sender.setTitleColor(.red, for: .normal)
        }
    }
    
    
    @IBAction func resetBtn(_ sender: Any) {
        // Invalidate timer
        timer?.invalidate()
        
        // Reset timer variables
        startTime = 0
        time = 0
        elapsed = 0
        status = false
        
        // Reset all three labels to 00
        let strReset = String("00:00:00")
        timeDisplay.text = strReset
    }
    
    func start() {
        
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        // Set Start/Stop button to true
        status = true
    }
    
    func stop() {
        
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
        
        // Set Start/Stop button to false
        status = false
        
    }
    
    @objc func updateCounter() {
        
        // Calculate total time since timer started in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        // Calculate minutes
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        // Calculate seconds
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        
        // Calculate milliseconds
        let milliseconds = UInt8(time * 100)
        
        // Format time vars with leading zero
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        // Add time vars to relevant labels
        timeDisplay.text = "\(strMinutes):\(strSeconds):\(strMilliseconds)"
        
    }
    
    var setInput = String()
    var repInput = String()
    var distanceInput = String()
    var repRestMinInput = String()
    var repRestSecInput = String()
    var setRestMinInput = String()
    var setRestSecInput = String()
    
    
    @IBOutlet weak var infoDisplay: UILabel!
    
    @IBAction func unwindFromWorkout(_ sender: UIStoryboardSegue) {
        let allInput = "You have \(setInput) set/sets of \(repInput) \(distanceInput)s with some mercy of \(repRestMinInput) min and \(repRestSecInput) sec between reps and \(setRestMinInput) min and \(setRestSecInput) sec between sets."
        infoDisplay.text = allInput
    }
    
    
    
}

