//
//  pickerViewExtension.swift
//  DatePicker
//
//  Created by Noah Schairer on 5/24/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 1
        }
        if component == 1 {
            return allowedDays.count
        }
        if component == 2 {
            return 1
        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if component == 0 {
            return NSAttributedString(string: month, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2, green: 0.2705882353, blue: 0.3098039216, alpha: 1)])
        }
        if component == 1 {
            let str = allowedDays[row]
            return NSAttributedString(string: str, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2, green: 0.2705882353, blue: 0.3098039216, alpha: 1)])
        }
        if component == 2 {
            return NSAttributedString(string: year, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2, green: 0.2705882353, blue: 0.3098039216, alpha: 1)])
        }
        return nil
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return month
        }
        if component == 1 {
            return allowedDays[row]
        }
        if component == 2 {
            return year
        }
        return nil
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, dd yyyy"
        let dateString = month + ", " + allowedDays[row] + " " + year
        print(dateString)
        today = dateFormatter.date(from: dateString)!
        todayStamp = (today as NSDate).timeIntervalSince1970
        print("\(today) \(todayStamp!)")
        dateLabel.text = dateString
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel? = view as? UILabel
        if label == nil {
            label = UILabel()
            label?.font = UIFont(name: "Avenir Next", size: 18.0)
            label?.textAlignment = .center
            if component == 0 {
                label?.text = month
            }
            if component == 1 {
                label?.text = allowedDays[row]
            }
            if component == 2 {
                label?.text = year
            }
            return label!
        } else {
        label?.font = UIFont(name: "Avenir Next", size: 18.0)
        label?.textAlignment = .center
        if component == 0 {
            label?.text = month
        }
        if component == 1 {
            label?.text = allowedDays[row]
        }
        if component == 2 {
            label?.text = year
        }
        return label!
        }
    }
}
