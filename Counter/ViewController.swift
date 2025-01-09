//
//  ViewController.swift
//  Counter
//
//  Created by Никита Пономарев on 09.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // Переменные counterLabel и buttonCounter связываются с объектами из интерфейса UILabel и UIButton соотвественно
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var buttonCounter: UIButton!
    // Переменная для хранения значения счетчика
    private var counterValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Устанавливаем и выводим начальное значение 0 для переменной counterValue; меняем цвет кнопки на серый, а цвет счетчки на красный
        counterValue = 0
        counterLabel.text = String("Значение счетчика: \(counterValue)")
        buttonCounter.tintColor = .gray
        counterLabel.textColor = .red
    }
    
    // Связываем кнопку с действием
    @IBAction func incrementButton(_ sender: Any) {
        
        // При нажатии на кнопку, переменная counterValue увеличивается на 1
        counterValue += 1
        counterLabel.text = String("Значение счетчика: \(counterValue)")
        
        // Выводим логи в консоль (для самопроверки)
        print("Значение счетчика (логи): \(counterValue)")
        
    }
}
