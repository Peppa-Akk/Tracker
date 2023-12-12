import UIKit

final class TrackersViewController: UIViewController {
    //MARK: - UI Components
    private var zeroTrackerLabel = UILabel()
    private var zeroTrackerImageView = UIImageView()
    
    private var searchController = UISearchController(searchResultsController: nil)
    private var datePicker = UIDatePicker()
    private var addTrackerButton = UIButton()
    
    //MARK: - Variables
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activateUI()
    }
}

// MARK: - Add UI-Elements on View
extension TrackersViewController {
    func activateUI() {
        view.backgroundColor = .hdBackground
        addDatePicker()
        addImageViewOnView()
        addLabelOnView()
        addAddTrackerButton()
        addTitleLabel()
        setupSearchController()
    }
    
    func addImageViewOnView() {
        zeroTrackerImageView.image = UIImage(named: "ZeroTracker")
        zeroTrackerImageView.clipsToBounds = true
        zeroTrackerImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zeroTrackerImageView)
        
        NSLayoutConstraint.activate([
            zeroTrackerImageView.widthAnchor.constraint(equalToConstant: 80),
            zeroTrackerImageView.heightAnchor.constraint(equalToConstant: 80),
            zeroTrackerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zeroTrackerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func addLabelOnView() {
        zeroTrackerLabel.text = "Что будем отслеживать?"
        zeroTrackerLabel.numberOfLines = 0
        zeroTrackerLabel.font = .systemFont(ofSize: 12)
        zeroTrackerLabel.textColor = .hdBlack
        zeroTrackerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zeroTrackerLabel)
        
        NSLayoutConstraint.activate([
            zeroTrackerLabel.centerXAnchor.constraint(equalTo: zeroTrackerImageView.centerXAnchor),
            zeroTrackerLabel.topAnchor.constraint(equalTo: zeroTrackerImageView.bottomAnchor, constant: 8)
        ])
    }
    
    func addTitleLabel() {
        navigationItem.title = "Трекеры"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func addDatePicker() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.date = Date()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: datePicker)
    }
    
    func addAddTrackerButton() {        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

//MARK: - Search Controller Funtions
extension TrackersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO: maybe later
    }
}
