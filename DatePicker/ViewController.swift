//
//  ViewController.swift
//  DatePicker
//
//  Created by Noah Schairer on 5/24/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var today = Date()
    var todayStamp: Double!
    var todayNumber: Int!
    let calendar = Calendar.current
    var month: String!
    var year: String!
    var numberOfDays: Range<Int>!
    var allowedDays: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        setUpPickerView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    func setUpPickerView() {
        let NSToday = today as NSDate
        todayStamp = NSToday.timeIntervalSince1970
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        month = dateFormatter.string(from: today)
        todayNumber = calendar.component(.day, from: today)
        numberOfDays = calendar.range(of: .day, in: .month, for: today)
        let array = Array(0...numberOfDays.count)
        //let excludingAbove = array.drop { $0 > todayNumber }
        let excludingAbove = array[(todayNumber - 7)...todayNumber]
        //let excludingBelow = excludingAbove.drop { $0 < (todayNumber - 7)}
        allowedDays = excludingAbove.map { String(describing: $0) }
        year = "\(calendar.component(.year, from: today))"
        pickerView.reloadAllComponents()
        pickerView.selectRow(todayNumber, inComponent: 1, animated: true)
        print("\(today) \(todayStamp!)")
    }


}

