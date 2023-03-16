//
//  HogeViewController.swift
//  SafeAreaInsetsDemo
//

import UIKit

final class HogeViewController: UIViewController {

    private weak var parentNavigationController: UINavigationController?

    @IBOutlet weak var colorView: UIView!

    init?(
        coder: NSCoder,
        parentNavigationController: UINavigationController?
    ) {
        self.parentNavigationController = parentNavigationController
        super.init(coder: coder)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func tapped(_ sender: UIButton) {
        let vc = UIStoryboard(
            name: "FooViewController",
            bundle: .main
        ).instantiateInitialViewController()!
        parentNavigationController?.pushViewController(vc, animated: true)
    }
}
