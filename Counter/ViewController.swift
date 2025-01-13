//
//  ViewController.swift
//  Counter
//
//  Created by Никита Пономарев on 09.01.2025.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // Переменные counterLabel и buttonCounter связываются с объектами из интерфейса UILabel и UIButton соотвественно
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var incrementButtonCounter: UIImageView!
    @IBOutlet private weak var decrementButtonCounter: UIImageView!
    @IBOutlet private weak var renewButton: UIButton!               // кнопка "обновить счетчик" renewButton
    @IBOutlet private weak var historyValueText: UITextView!        // TextView (История значений счетчика)
    
    // Переменная для хранения значения счетчика
    private var counterValue: Int = 0
   
    // Создал функции для участков кода, которые часто повторялись.
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    // Функция обновления значения counterValue в Label
    private func updateCounterLabel() {
        counterLabel.text = String("Значение счетчика: \(counterValue)")
    }
    // Функция вывода логов в TextView и консоль
    private func logHistoryValueText(_ message: String) {
        let formattedDate = dateFormatter.string(from: Date())
        let newEntry = "\(formattedDate): \(message)\n"
        historyValueText.text += newEntry
        print("Значение счетчика (логи): \(counterValue), Дата: \(formattedDate)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Устанавливаем и выводим начальное значение 0 для переменной counterValue; меняем цвет кнопки на серый, а цвет счетчки на красный
        counterValue = 0
        counterLabel.text = String("Значение счетчика: \(counterValue)")
        // buttonCounter.tintColor = .gray
        renewButton.tintColor = .gray
        counterLabel.textColor = .red
        // Увеличиваем кол-во строк с помощью свойства numberOfLines, устанавливаем 0, чтобы текст автоматически переходил на следующую строку при необходимости (ограничение в пределах доступного пространства для UILabel).
        counterLabel.numberOfLines = 0
        
        // Очистка текста в UITextView при запуске
        historyValueText.text = String("История изменений: \n")
        
        // Настраиваем жест для UIImageView incrementCounter
        let tapButtonIncrement = UITapGestureRecognizer(target: self, action: #selector(incrementCounter))
        incrementButtonCounter.isUserInteractionEnabled = true // Включаем взаимодействие с изображением
        incrementButtonCounter.addGestureRecognizer(tapButtonIncrement)
        
        let tapButtonDecrement = UITapGestureRecognizer(target: self, action: #selector(decrementCounter))
        decrementButtonCounter.isUserInteractionEnabled = true
        decrementButtonCounter.addGestureRecognizer(tapButtonDecrement)
    }
    
    @objc private func incrementCounter() {
        // Увеличиваем значение счётчика на 1
        counterValue += 1
        // Обновляем текст в UILabel
        updateCounterLabel()
        logHistoryValueText("значение изменено на +1\n")
    }
    
    @objc private func decrementCounter() {
        if counterValue > 0 {
            counterValue -= 1
            logHistoryValueText("значение изменено на -1\n")
        } else {
            logHistoryValueText("попытка уменьшить значение счётчика ниже 0\n")
        }
        updateCounterLabel()
    }
    
    @IBAction private func renewButton(_ sender: Any) {
        counterValue = 0
        updateCounterLabel()
        logHistoryValueText("значение сброшено\n")
    }
}
