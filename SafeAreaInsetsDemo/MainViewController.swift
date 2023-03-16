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
                    ignoreSafeArea: false
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
                    ignoreSafeArea: true
                )
            }!
        navigationController?.pushViewController(viewController, animated: true)
    }
}
