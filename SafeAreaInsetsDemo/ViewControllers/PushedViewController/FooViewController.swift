//
//  FooViewController.swift
//  SafeAreaInsetsDemo
//

import UIKit

final class FooViewController: UIViewController {

    @IBAction func tapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
