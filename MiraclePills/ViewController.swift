//
//  ViewController.swift
//  MiraclePills
//
//  Created by Justin Ward on 23/2/17.
//  Copyright © 2017 Justin Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var postcodeField: UITextField!
    @IBOutlet weak var postcodeLabel: UILabel!
    
    let states = ["ACT","NSW","NT","QLD","SA","TAS","VIC","WA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryField.isHidden = true
        countryLabel.isHidden = true
        postcodeField.isHidden = true
        postcodeLabel.isHidden = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryField.isHidden = false
        countryLabel.isHidden = false
        postcodeField.isHidden = false
        postcodeLabel.isHidden = false
    }
    
    @IBAction func buyNowBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "success", sender: self)
    }
    
}

