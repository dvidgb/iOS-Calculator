//
//  HomeViewController.swift
//  CalculadoraiOS
//
//  Created by David Bueno on 27/4/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // Mark: - Outlets
    
    
    //Resultado
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //Numbers
    

    @IBOutlet weak var number0: UIButton!
    
    
    @IBOutlet weak var number1: UIButton!
    
    
    @IBOutlet weak var number2: UIButton!
    
    @IBOutlet weak var number3: UIButton!
    
    
    @IBOutlet weak var number4: UIButton!
    
    @IBOutlet weak var number5: UIButton!
    
    
    @IBOutlet weak var number6: UIButton!
    
    
    @IBOutlet weak var number7: UIButton!
    
    
    @IBOutlet weak var number8: UIButton!
    
    
    @IBOutlet weak var number9: UIButton!
    
    
    @IBOutlet weak var numberDecimal: UIButton!
    
    //Operators
    
    @IBOutlet weak var operatorAC: UIButton!
    
    @IBOutlet weak var operatorPlusMinus: UIButton!
    
    @IBOutlet weak var operatorPercent: UIButton!
    
    
    @IBOutlet weak var operatorResult: UIButton!
    
    
    @IBOutlet weak var operatorAddition: UIButton!
    
    @IBOutlet weak var operatorSubstraction: UIButton!
    
    
    @IBOutlet weak var operatorMultiplication: UIButton!
    
    @IBOutlet weak var operatorDivison: UIButton!
    
    
    //Variables
    
    private var total: Double = 0 //Total
    private var temp: Double = 0 //Valor temporal mostrado por la label
    private var operating  = false //Indica si se ha seleccionado un operador
    private var decimal = false //Indica si el valor es decimal
    private var operation: OperationType = .none //Operación actual
    
    
    //Constantes
    private let kdecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLenght = 9
    private let kMaxValue: Double = 9999999999
    private let kMinValue: Double = 0.00000001
    
    //Constantes
    private enum OperationType{
        case none,addition,substraction,multiplication, division, percent
    }
    
    //Formateo de valores auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    //Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        
        return formatter
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        //UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        numberDecimal.round()
        
        operatorAC.round()
        operatorResult.round()
        operatorPercent.round()
        operatorDivison.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorPlusMinus.round()
    
        
        numberDecimal.setTitle(kdecimalSeparator, for: .normal)
        
        result() //se llama a la función resultado
        
        
    }

    //Mark: - Button Actions
    
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        
        
        sender.shine()
    }
    
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    

    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        
        result()
        
        
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        
        result()
        operating = true
        operation = .addition
        
        
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        
        result()
        operating = true
        operation = .substraction
        
        sender.shine()
    }
    
    
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        
        result()
        operating = true
        operation = .multiplication
        
        
        sender.shine()
    }
    
    
    @IBAction func operatorDivisonAction(_ sender: UIButton) {
        
        result()
        operating = true
        operation = .division
        
        sender.shine()
    }
    
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        
        resultLabel.text = resultLabel.text! + kdecimalSeparator
        
        decimal = true
        
        sender.shine()
    }
    
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        
        
        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        
        //Hemos seleccinado una operación
        if operating {
            total = total == 0 ? temp : total
            
            resultLabel.text  = ""
            
            currentTemp = ""
            
            operating = false
            
        }
        
        //Hemos selecccionado decimales
        if decimal {
            currentTemp = "\(currentTemp)\(kdecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        
        temp = Double(currentTemp + String(number))!
        
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
        print(sender.tag)
    }
    
    
    // Limpia los valores
    
    private func clear(){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp  != 0 {
            temp = 0
            resultLabel.text = "0"
        }else{
            total = 0
            result()
        }
    }
    
    //Obtine el resultado final
    
    private func result(){
        
        switch operation {
            
        case .none:
            //No hacemos nada
            break
        case .addition:
            total = total + temp
            break
        case .substraction:
            total =  total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        //Formateo por pantalla
        
        if total <= kMaxValue || total >= kMinValue{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        print("Total: \(total)")
    }
    
    
}
