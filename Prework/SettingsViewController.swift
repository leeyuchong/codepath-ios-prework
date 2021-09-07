//
//  SettingsViewController.swift
//  Prework
//
//  Created by Yuchong Lee on 9/4/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let tintColors: [UIColor] = [.systemBlue, .systemRed, .systemOrange, .systemYellow, .systemGreen, .systemIndigo, .systemPurple]
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    // MARK: - For Currency picker:
    // @IBOutlet weak var pickerView: UIPickerView!
    // let currencies = ["\u{24}", "\u{163}", "\u{a3}", "\u{20bd}", "\u{20b1}", "\u{a5}"]
    // func numberOfComponents(in pickerView: UIPickerView) -> Int {
    // return 1
    // }
    //
    // func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return currencies.count
    //    }
    //
    // func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return currencies[row]
    // }
    // func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        defaults.set(currencies[row], forKey: "currencySymbol")
    //        defaults.synchronize()
    // }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        tipSlider.value = defaults.float(forKey: "defaultTip") == 0.0 ? 10 : defaults.float(forKey: "defaultTip")
        updateTipPercentageLabel(with: Int(tipSlider.value))
        // pickerView.delegate = self
        // pickerView.dataSource = self
        // pickerView.selectRow(currencies.firstIndex(of: defaults.string(forKey: "currencySymbol") ?? currencies[0])!, inComponent: 0, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipPercentageLabel.textColor = navigationController?.view.tintColor
        darkModeSwitch.setOn(defaults.bool(forKey: "darkMode"), animated: false)
        updateDarkMode()
        changeColorHelper(to: tintColors[defaults.integer(forKey: "tintNumber")])
    }

    @IBAction func defaultTip(_ sender: Any) {
        let tipSliderValue = Int(tipSlider.value)
        updateTipPercentageLabel(with: tipSliderValue)
        defaults.set(tipSliderValue, forKey: "defaultTip")
    }
    
    func updateTipPercentageLabel(with value: Int) {
        tipPercentageLabel.text = "\(value)%"
    }
    
    @IBAction func changeColor(_ sender: Any) {
        let colorTag = (sender as AnyObject).tag
        defaults.set(colorTag, forKey: "tintNumber")
        changeColorHelper(to: tintColors[colorTag!])
        defaults.synchronize()
    }
    
    func changeColorHelper(to color: UIColor) {
        UIView.animate(withDuration: 0.3, animations: { [self]() -> Void in
            parent!.view.tintColor = color
            tipPercentageLabel.textColor = color
            darkModeSwitch.onTintColor = color
        })
    }

    @IBAction func toggleDarkMode(_ sender: Any) {
        defaults.set(darkModeSwitch.isOn, forKey: "darkMode")
        defaults.synchronize()
        updateDarkMode()
    }
    
    func updateDarkMode() {
        navigationController!.overrideUserInterfaceStyle = defaults.bool(forKey: "darkMode") ? .dark : .light
    }
}
