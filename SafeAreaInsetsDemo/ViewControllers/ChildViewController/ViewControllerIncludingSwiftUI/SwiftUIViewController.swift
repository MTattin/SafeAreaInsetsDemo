//
//  FooViewController.swift
//  SafeAreaInsetsDemo
//

import SwiftUI
import UIKit

final class SwiftUIViewController: UIViewController {

    private let ignoreSafeArea: Bool
    private weak var parentNavigationController: UINavigationController?

    @IBOutlet private weak var container: UIView!

    init?(
        coder: NSCoder,
        parentNavigationController: UINavigationController?,
        ignoreSafeArea: Bool
    ) {
        self.parentNavigationController = parentNavigationController
        self.ignoreSafeArea = ignoreSafeArea
        super.init(coder: coder)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftView: UIView = getSwiftUIView()
        swiftView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(swiftView)
        NSLayoutConstraint.activate([
            swiftView.topAnchor.constraint(equalTo: container.topAnchor),
            swiftView.leftAnchor.constraint(equalTo: container.leftAnchor),
            swiftView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            swiftView.rightAnchor.constraint(equalTo: container.rightAnchor)
        ])
    }

    @IBAction func tapped(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "FooViewController", bundle: .main).instantiateInitialViewController()
        parentNavigationController?.pushViewController(vc!, animated: true)
    }

    private func getSwiftUIView() -> UIView {
        let view: UIView = UIHostingController(
            rootView: SwiftUIView(),
            ignoreSafeArea: ignoreSafeArea
        ).view
        view.backgroundColor = .yellow
        return view
    }
}
