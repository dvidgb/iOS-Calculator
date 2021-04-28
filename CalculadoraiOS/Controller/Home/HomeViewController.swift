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
    private let kMaxValue: Double = 999999999
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
        
        
    }

    //Mark: - Button Actions
    
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        sender.shine()
    }
    

    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    @IBAction func operatorDivisonAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
    
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }
    
    
    
    
}
