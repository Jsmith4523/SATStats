//
//  ViewController.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import UIKit

typealias TableViewDelegate = UITableViewDelegate & UITableViewDataSource

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = SchoolViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.getNewYorkSchools()
    }
    
    private func setupView() {
        self.navigationItem.title = "NYC Schools"
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func getNewYorkSchools() {
        viewModel.fetchSchools { err in
            guard (err == nil) else {
                return
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

//MARK: TableViewDelegate
extension ViewController: TableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


