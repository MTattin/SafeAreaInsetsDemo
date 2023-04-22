//
//  MainViewController.swift
//  SafeAreaInsetsDemo
//

import UIKit

final class MainViewController: UIViewController {
    @IBAction func tapped有効(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "ViewController", bundle: .main)
            .instantiateInitialViewController() { coder in
                ViewController(
                    coder: coder,
                    navigationController: self.navigationController,
                    viewControllerType: .ignoreSafeAreaTrue
                )
            }!
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapped無効(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "ViewController", bundle: .main)
            .instantiateInitialViewController() { coder in
                ViewController(
                    coder: coder,
                    navigationController: self.navigationController,
                    viewControllerType: .ignoreSafeAreaFalse
                )
            }!
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tappedSafeAreaRegion(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "ViewController", bundle: .main)
            .instantiateInitialViewController() { coder in
                ViewController(
                    coder: coder,
                    navigationController: self.navigationController,
                    viewControllerType: .useSafeAreaRegion
                )
            }!
        navigationController?.pushViewController(viewController, animated: true)
    }

}
