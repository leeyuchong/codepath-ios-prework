//
//  ViewController.swift
//  Prework
//
//  Created by Yuchong Lee on 9/2/21.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    let locale  = Locale.current
    let numberFormatter = NumberFormatter()
    var currencySymbol = ""
    let tintColors: [UIColor] = [.systemBlue, .systemRed, .systemOrange, .systemYellow, .systemGreen, .systemIndigo, .systemPurple]
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipDollarLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var dollarSign: UILabel!
    @IBOutlet weak var roundedRect: UIView!
    @IBOutlet weak var tipHeaderLabel: UILabel!
    @IBOutlet weak var totalHeaderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tip Calculator"
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        let billAmountText = defaults.float(forKey: "savedBillAmt") == 0.0 ? "" : String(format: "%.2f", defaults.float(forKey: "savedBillAmt"))
        billAmountTextField.text = billAmountText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currencySymbol = locale.currencySymbol!
        defaults.synchronize()
            updateLabelColors(with: tintColors[defaults.integer(forKey: "tintNumber") ])
        tipSlider.value = defaults.float(forKey: "defaultTip") == 0.0 ? 10 : defaults.float(forKey: "defaultTip")
        // currencySymbol = defaults.string(forKey: "currencySymbol") ?? "$"
        updateTip()
        dollarSign.text = currencySymbol
        navigationController!.overrideUserInterfaceStyle = defaults.bool(forKey: "darkMode") ? .dark : .light
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.keyboardType = .decimalPad
        billAmountTextField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func calculateTip(_ sender: Any) {
        updateTip()
    }
    
    func updateTip() {
        let bill = Float(billAmountTextField.text!) ?? 0
        defaults.setValue(bill, forKey: "savedBillAmt")
        defaults.setValue(NSDate.now, forKey: "savedBillTime")
        defaults.synchronize()
        let tipPercentage = Int(tipSlider.value)
        // Get total tip by multiplying tip * tipPercentage
        let tip = bill * Float(tipPercentage)/100
        let total = bill + tip
        // Update Tip Amount Label
        tipPercentLabel.text = "\(tipPercentage)%"
        tipDollarLabel.text = numberFormatter.string(from: NSNumber(value: tip))
        // Update Total Amount
        totalLabel.text = numberFormatter.string(from: NSNumber(value: total))
    }
    
    func updateLabelColors(with color: UIColor) {
        billAmountTextField.textColor = color
        totalLabel.textColor = color
        tipDollarLabel.textColor = color
        tipPercentLabel.textColor = color
        dollarSign.textColor = color
        roundedRect.backgroundColor = UIColor(cgColor: (color.cgColor)).withAlphaComponent(0.15)
        tipHeaderLabel.textColor = color
        totalHeaderLabel.textColor = color
    }
    
    @IBAction func touchOutsideRecognizer(_ sender: Any) {
        billAmountTextField.resignFirstResponder()
    }
}

