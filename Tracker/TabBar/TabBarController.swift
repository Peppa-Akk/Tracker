import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hdBackground
                
        let trackersViewController = TrackersViewController()
        let statisticsViewController = StatisticsViewController()
        
        trackersViewController.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: UIImage(named: "TrackersIcon"),
            selectedImage: nil
        )
        statisticsViewController.tabBarItem = UITabBarItem(
            title: "Статистика",
            image: UIImage(named: "StatisticsIcon"),
            selectedImage: nil
        )
        
        let navigationControllerViewController = UINavigationController(rootViewController: trackersViewController)
        navigationControllerViewController.view.backgroundColor = .hdBackground
        navigationControllerViewController.navigationBar.isTranslucent = false
        
        self.viewControllers = [navigationControllerViewController, statisticsViewController]
    }
}
