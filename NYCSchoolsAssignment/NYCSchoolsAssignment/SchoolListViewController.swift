//
//  ViewController.swift
//  NYCSchoolsAssignment
//
//  Created by Kevin Verghese on 9/6/23.
//

import UIKit

class SchoolListViewController: UIViewController {
    
    @IBOutlet weak var schoolListTableView: UITableView!
    private var schoolTableModel: SchoolViewModel?
    private let tableCellId = "schoolCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupListView()
        self.setupTableView()
    }

    private func setupListView() {
        self.schoolTableModel = SchoolViewModel(services: NetworkManager())
        self.schoolTableModel?.loadSchoolList()
        self.schoolTableModel?.loadSchoolInfoList()
        self.schoolTableModel?.updateViews = {
            DispatchQueue.main.async {
                self.schoolListTableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        self.schoolListTableView.delegate = self
        self.schoolListTableView.dataSource = self
        self.schoolListTableView.register(UITableViewCell.self, forCellReuseIdentifier: tableCellId)
    }
}

extension SchoolListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let schoolCount = self.schoolTableModel?.schoolsList.count else { return 1 }
        return schoolCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = schoolListTableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath)
        let title = schoolTableModel?.schoolsList[indexPath.row].schoolName

        tableCell.textLabel?.text = title
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Need better navigation towards TestScoreViewController
        let infoVC = (storyboard?.instantiateViewController(identifier: "testScoreViewController"))! as TestScoreViewController
        if let schoolInfoList = self.schoolTableModel?.schoolInfoList {
            for schoolInfo in schoolInfoList {
                //For the time being, edge cases are not handled e.g if there is schoolInfo corresponding to the school Name then the test score view controller shows hardcode default values
                if schoolInfo.dbn == schoolTableModel?.schoolsList[indexPath.row].dbn {
                    infoVC.testInfo = (schoolInfo.schoolName ,schoolInfo.mathScore, schoolInfo.readingScore, schoolInfo.writingScore)
                }
            }
        }
        present(infoVC, animated: true)
    }
}

