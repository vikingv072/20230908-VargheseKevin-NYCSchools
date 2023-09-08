//
//  TestScoreViewController.swift
//  NYCSchoolsAssignment
//
//  Created by Kevin Verghese on 9/8/23.
//

import UIKit

//Designating a typealias for the display
typealias TestInfo = (schoolName: String, mathScore: String, readingScore: String, writingScore: String)

//Forcing the class to run on the main thread

@MainActor
class TestScoreViewController: UIViewController {

    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    
    var testInfo: TestInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDetails()
    }
    
    func setupDetails() {
        guard let receivedInfo = self.testInfo else { return }
        schoolNameLabel.text = receivedInfo.schoolName
        mathScoreLabel.text = receivedInfo.mathScore
        readingScoreLabel.text = receivedInfo.readingScore
        writingScoreLabel.text = receivedInfo.writingScore
    }
}

