//
//  ViewController.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/25/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    private var schoolListViewModel = SchoolListViewModel()
    private var schoolDetailsViewModel  = SchoolDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Bind the view to get updates when schoolsTableViewCellViewModel value changes
        schoolListViewModel.schoolsTableViewCellViewModel.bind {[weak self] schoolTableViewCellModels in
            if let cellModel = schoolTableViewCellModels, cellModel.count > 0 {
                self?.schoolDetailsViewModel.fetchSATScores()
            }
            else{
                // display an error the when schools view model data is empty.
                self?.showAlert(title:AppConstants.errorTitle , message: AppConstants.schoolListErrorMsg)
            }
        }
        
        //Bind the view to get updates when schoolDetailsViewModel value changes
        self.schoolDetailsViewModel.schoolDetails.bind {[weak self] _ in
            self?.reloadTableData()
        }
        
        //Fetch schools list to display
        schoolListViewModel.fetchSchools()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == AppConstants.schoolDetailsSegueIdentifier,
            let destination = segue.destination as? SchoolDetailsViewConroller,
            let selectedIndexRow = tableView.indexPathForSelectedRow?.row
        {
           let schoolTableViewCellModel =  schoolListViewModel.schoolsTableViewCellViewModel.value?[selectedIndexRow]
            
           // Get the school details array index by checking if the school dbn exists in SAT results array
           if let index = schoolDetailsViewModel.schoolDetails.value?.firstIndex(where: { $0.dbn == schoolTableViewCellModel?.dbn}) {
                destination.schoolViewModel = schoolDetailsViewModel.schoolDetails.value?[index]
           }else{
               self.showAlert(title:AppConstants.errorTitle , message: AppConstants.schoolDetailsErrorMsg)
               destination.schoolViewModel = SchoolViewModel(dbn: "1", schoolName:"N/A", numOfSatTestTakers: "N/A", satCriticalReadingAvgScore:"N/A", satMathAvgScore:"N/A", satWritingAvgScore:"N/A")
           }
        }
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolListViewModel.schoolsTableViewCellViewModel.value?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolCell = tableView.dequeueReusableCell(withIdentifier: AppConstants.schoolCellIdentifier, for: indexPath)
        schoolCell.textLabel?.text = schoolListViewModel.schoolsTableViewCellViewModel.value?[indexPath.row].schoolName
        return schoolCell
    }
    
}

extension ViewController {
    
    /// Show Alert with title and message
    /// - Parameters:
    ///   - title: The title show on Alert dialog
    ///   - message: The message show on the alert dialog
    func showAlert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    /// Refresh the table when received data from server
    func reloadTableData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


