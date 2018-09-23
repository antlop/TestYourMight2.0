//
//  ViewController.swift
//  TestYourMight
//
//  Created by This Mac on 9/21/18.
//  Copyright © 2018 This Mac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let AAssist = ArrayAssistant()
    @IBOutlet var serverInputField : UITextField!
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        picker.delegate = self
        picker.dataSource = self
        
        serverInputField.inputView = picker
        
        
        let customView = UIView(frame:CGRect(x:0,y:0,width:10,height:44))
        customView.backgroundColor = UIColor.red
        
        serverInputField.inputAccessoryView = customView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AAssist.serversArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AAssist.getServerAt(index: row )
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if serverInputField != nil {
            serverInputField.text = AAssist.getServerAt(index:row)
        }
        self.view.endEditing(false)
    }
}

