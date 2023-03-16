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
    private let ignoreSafeArea: Bool

    init?(
        coder: NSCoder,
        navigationController: UINavigationController?,
        ignoreSafeArea: Bool
    ) {
        self.ignoreSafeArea = ignoreSafeArea
        self.swiftUIViewController = UIStoryboard(name: "SwiftUIViewController", bundle: .main)
            .instantiateInitialViewController { coder in
                SwiftUIViewController(
                    coder: coder,
                    parentNavigationController: navigationController,
                    ignoreSafeArea: ignoreSafeArea
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
        title = ignoreSafeArea ? "Safe Area Insets 無効" : "Safe Area Insets 有効"

        stackView.addArrangedSubview(swiftUIViewController.view)
        if !children.contains(swiftUIViewController) {
            addChild(swiftUIViewController)
        }
        swiftUIViewController.didMove(toParent: self)

        stackView.addArrangedSubview(hogeViewControllerOrange.view)
        if !children.contains(hogeViewControllerOrange) {
            addChild(hogeViewControllerOrange)
        }
        hogeViewControllerOrange.didMove(toParent: self)
        hogeViewControllerOrange.colorView.backgroundColor = .orange

        stackView.addArrangedSubview(hogeViewControllerRed.view)
        if !children.contains(hogeViewControllerRed) {
            addChild(hogeViewControllerRed)
        }
        hogeViewControllerRed.didMove(toParent: self)
        hogeViewControllerRed.colorView.backgroundColor = .red

        stackView.addArrangedSubview(hogeViewControllerGreen.view)
        if !children.contains(hogeViewControllerGreen) {
            addChild(hogeViewControllerGreen)
        }
        hogeViewControllerGreen.didMove(toParent: self)
        hogeViewControllerGreen.colorView.backgroundColor = .green
    }
}
