//
//  workoutViewController.swift
//  Fitness
//
//  Created by Brian Johnston on 5/1/18.
//  Copyright © 2018 Brian Johnston. All rights reserved.
//

import UIKit

class workoutViewController: UIViewController {
    
    
    @IBOutlet weak var setTextField: UITextField!
    @IBOutlet weak var repTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var repRestMin: UITextField!
    @IBOutlet weak var repRestSec: UITextField!
    @IBOutlet weak var setRestMin: UITextField!
    @IBOutlet weak var setRestSec: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        if setTextField.text != "" && repTextField.text != "" && distanceTextField.text != "" && repRestMin.text != "" && repRestSec.text != "" && setRestMin.text != "" && setRestSec.text != "" {
            performSegue(withIdentifier: "saveSegue", sender: (Any).self)
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let set = segue.destination as! ViewController
        set.setInput = setTextField.text!
        let rep = segue.destination as! ViewController
        rep.repInput = repTextField.text!
        let distance = segue.destination as! ViewController
        distance.distanceInput = distanceTextField.text!
        let repRestMinute = segue.destination as! ViewController
        repRestMinute.repRestMinInput = repRestMin.text!
        let repRestSecond = segue.destination as! ViewController
        repRestSecond.repRestSecInput = repRestSec.text!
        let setRestMinute = segue.destination as! ViewController
        setRestMinute.setRestMinInput = setRestMin.text!
        let setRestSecond = segue.destination as! ViewController
        setRestSecond.setRestSecInput = setRestSec.text!
    }
}
