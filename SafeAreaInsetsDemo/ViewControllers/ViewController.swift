//
//  ViewController.swift
//  SafeAreaInsetsDemo
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var stackView: UIStackView!

    private let swiftUIViewController: SwiftUIViewController
    private let hogeViewControllerOrange: HogeViewController
    private let hogeViewControllerRed: HogeViewController
    private let hogeViewControllerGreen: HogeViewController
    private let viewControllerType: ViewControllerType

    init?(
        coder: NSCoder,
        navigationController: UINavigationController?,
        viewControllerType: ViewControllerType
    ) {
        self.viewControllerType = viewControllerType
        self.swiftUIViewController = UIStoryboard(name: "SwiftUIViewController", bundle: .main)
            .instantiateInitialViewController { coder in
                SwiftUIViewController(
                    coder: coder,
                    parentNavigationController: navigationController,
                    viewControllerType: viewControllerType
                )
            }!
        self.hogeViewControllerOrange = UIStoryboard(name: "HogeViewController", bundle: .main)
            .instantiateInitialViewController { coder in
                HogeViewController(coder: coder, parentNavigationController: navigationController)
            }!
        self.hogeViewControllerRed = UIStoryboard(name: "HogeViewController", bundle: .main)
            .instantiateInitialViewController { coder in
                HogeViewController(coder: coder, parentNavigationController: navigationController)
            }!
        self.hogeViewControllerGreen = UIStoryboard(name: "HogeViewController", bundle: .main)
            .instantiateInitialViewController { coder in
               HogeViewController(coder: coder, parentNavigationController: navigationController)
           }!
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewControllerType.title

        addChild(swiftUIViewController)
        stackView.addArrangedSubview(swiftUIViewController.view)
        swiftUIViewController.didMove(toParent: self)

        addChild(hogeViewControllerOrange)
        stackView.addArrangedSubview(hogeViewControllerOrange.view)
        hogeViewControllerOrange.didMove(toParent: self)
        hogeViewControllerOrange.colorView.backgroundColor = .orange

        addChild(hogeViewControllerRed)
        stackView.addArrangedSubview(hogeViewControllerRed.view)
        hogeViewControllerRed.didMove(toParent: self)
        hogeViewControllerRed.colorView.backgroundColor = .red

        addChild(hogeViewControllerGreen)
        stackView.addArrangedSubview(hogeViewControllerGreen.view)
        hogeViewControllerGreen.didMove(toParent: self)
        hogeViewControllerGreen.colorView.backgroundColor = .green
    }
}
