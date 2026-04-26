
import UIKit

final class CounterViewController: UIViewController {

    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var clearHistoryButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var counterLabel: UILabel!
    private var count: Int = 0
    private func formatingDate(_ date: Date, format: String = "dd.MM.yy HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter.string (from:date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func Adding(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
        historyTextView.text.append ("\n\(formatingDate(Date())): значение изменено на +1")
        
    }
    
    @IBAction private func Subtracting(_ sender: Any) {
        if count > 0 && count != 0 {
            count -= 1
            counterLabel.text = "Значение счетчика: \(count)"
            historyTextView.text.append ("\n\(formatingDate(Date())): значение изменено на -1")
        } else {
            historyTextView.text.append ("\n\(formatingDate(Date())): попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func ClearHistory(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счетчика: \(count)"
        historyTextView.text.append ("\n\(formatingDate(Date())): значение сброшено")
    }
}

