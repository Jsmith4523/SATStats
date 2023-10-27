//
//  ViewController.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import UIKit

typealias TableViewDelegate = UITableViewDelegate & UITableViewDataSource

class SchoolsViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = SchoolViewModel()
    
    var school: School!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.getNewYorkSchools()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupView() {
        self.navigationItem.title = "NYC Schools"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.rowHeight = 75
        tableView.register(UINib(nibName: "SchoolTableViewCell", bundle: .main), forCellReuseIdentifier: SchoolTableViewCell.identifier)
    }
    
    private func getNewYorkSchools(_ action: UIAlertAction? = nil) {
        viewModel.fetchSchools { err in
            DispatchQueue.main.async { [weak self] in
                guard (err == nil) else {
                    presentErrorAlert()
                    return
                }
                self?.tableView.reloadData()
            }
        }
        
        func presentErrorAlert() {
            let ac = UIAlertController(title: "There was an error loading school", message: "Do you want to try again?", preferredStyle: .alert)
            
            let primaryAction = UIAlertAction(title: "Yes", style: .default, handler: getNewYorkSchools(_:))
            let secondaryAction = UIAlertAction(title: "No", style: .default)
            
            ac.addAction(primaryAction)
            ac.addAction(secondaryAction)
            
            show(ac, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! SchoolDetailViewController
        detailVC.viewModel = self.viewModel
        detailVC.school = self.school
    }
}

//MARK: - TableViewDelegate
extension SchoolsViewController: TableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolCellView = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.identifier) as! SchoolTableViewCell
        schoolCellView.school = viewModel.schools[indexPath.row]
        return schoolCellView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = viewModel.schools[indexPath.row]
        self.school = school
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "SchoolDetailView", sender: self)
    }
}


