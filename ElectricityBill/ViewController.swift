//
//  ViewController.swift
//  ElectricityBill
//
//  Created by Minh Toan on 15/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnCaculate: UIButton!
    @IBOutlet weak var tlResult: UILabel!
    @IBOutlet weak var tlLabelResult: UILabel!
    @IBOutlet weak var tfInputElectricNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTfInputElectricNum()
        setupTlLabelResult()
        setupTlResult(result: "")
        setupBtnCaculate()
    }
    func setupTfInputElectricNum(){
        tfInputElectricNum.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 60)
        tfInputElectricNum.placeholder = "Nhập số điện"
        tfInputElectricNum.borderStyle = .line
    }
    
    func setupTlLabelResult(){
        tlLabelResult.text = "Kết quả:"
        tlLabelResult.frame = CGRect(x: tfInputElectricNum.frame.origin.x, y: tfInputElectricNum.frame.origin.y + 50, width: tfInputElectricNum.bounds.width / 3, height: 60)
    }
    
    func setupTlResult(result: String){
        tlResult.text = result
        tlResult.frame = CGRect(x: tfInputElectricNum.frame.origin.x + tlLabelResult.bounds.width, y: tfInputElectricNum.frame.origin.y + 50, width: tfInputElectricNum.bounds.width * 2 / 3, height: 60)
    }
    
    func setupBtnCaculate(){
        btnCaculate.setTitle("Tính", for: .normal)
        btnCaculate.tintColor = .gray
        btnCaculate.center = view.center
    }
    
    @IBAction func showResult(_ sender: Any) {
        var textResult = ""
        var unitPrice: Float
        if let input = tfInputElectricNum.text, let electricityNumber = Float(input){
            switch electricityNumber {
            case 0...50:
                unitPrice = 1.678
            case 51...100:
                unitPrice = 1.734
            case 101...200:
                unitPrice = 2.014
            case 201...300:
                unitPrice = 2.536
            case 301...400:
                unitPrice = 2.834
            case 401...:
                unitPrice = 2.927
            default:
                unitPrice = 0
            }
            textResult = String(electricityNumber * unitPrice)
        }
        self.tlResult.text = textResult
    }
    
    
}

