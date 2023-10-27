//
//  SchoolDetailViewController.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/27/23.
//

import UIKit

class SchoolDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var testTakersLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!
    
    var viewModel: SchoolViewModel!
    var school: School!
    
    private var score: Score!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchTestScores()
        self.setupViews()
    }
    
    private func setupViews() {
        nameLabel.text = school.name
    }
    
    private func configureScoreLabels() {
        self.testTakersLabel.text = score.numTestTakers
        self.readingLabel.text = score.satReadingScore
        self.writingLabel.text = score.satWritingScore
        self.mathLabel.text = score.satMathScore
    }
    
    private func fetchTestScores() {
        viewModel.fetchSchoolTestScores(for: school.dbn) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let scores):
                    guard let score = scores.first else {
                        self?.showScoreErrorAlert()
                        return
                    }
                    self?.score = score
                    self?.configureScoreLabels()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func showScoreErrorAlert() {
        let ac = UIAlertController(title: "Error", message: "We failed to retrieve SAT Scores for \(school.name). Try again?", preferredStyle: .alert)
        
        let primaryAction = UIAlertAction(title: "Yes", style: .default)
        let secondaryAction = UIAlertAction(title: "Cancel", style: .default)
        
        ac.addAction(primaryAction)
        ac.addAction(secondaryAction)
        
        show(ac, sender: nil)
    }
}
