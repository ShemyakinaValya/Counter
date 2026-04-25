//
//  ViewController.swift
//  Counter
//
//  Created by Валя Шемякина on 25.04.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var clearHistoryButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    var count: Int = 0
    func formatingDate(_ date: Date, format: String = "dd.MM.yy HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter.string (from:date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func Adding(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
        historyTextView.text.append ("\n\(formatingDate(Date())): значение изменено на +1")
        
    }
    
    @IBAction func Subtracting(_ sender: Any) {
        if count > 0 && count != 0 {
            count -= 1
            counterLabel.text = "Значение счетчика: \(count)"
            historyTextView.text.append ("\n\(formatingDate(Date())): значение изменено на -1")
        } else {
            historyTextView.text.append ("\n\(formatingDate(Date())): попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func ClearHistory(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счетчика: \(count)"
        historyTextView.text.append ("\n\(formatingDate(Date())): значение сброшено")
    }
}

