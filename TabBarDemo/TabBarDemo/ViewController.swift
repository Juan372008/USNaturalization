//
//  ViewController.swift
//  TabBarDemo
//
//  Created by Juan Gallo on 8/5/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
 {
    
    var alabama:Dictionary<String,Any>?

    
    @IBOutlet weak var picker: UIPickerView!
    
    let states = ["Alabama", "Alaska"]
    
    let model = EnglishModel().getPlist(withName: "English")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }

    @IBAction func acceptButton(_ sender: Any) {
        
        let selectedRow = picker.selectedRow(inComponent: 0)
        
        guard states.indices.contains(selectedRow) else {
            print("selectedRow is invalid")
            return
        }
        
        var selectedData = states[selectedRow]
        
        switch selectedData {
            
        case "Alabama":
            self.alabama = model!["Alabama"] as? [String:Any]
            print(alabama)
            
            performSegue(withIdentifier: "Languages", sender: self)
          default:
            print("Error choosing state")
        }
    }
    
    
//    MARK: Picker view methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
}

