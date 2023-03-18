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
        setupSwiftUIView()
    }

    @IBAction func tapped(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "FooViewController", bundle: .main).instantiateInitialViewController()
        parentNavigationController?.pushViewController(vc!, animated: true)
    }
}

private extension SwiftUIViewController {

    func setupSwiftUIView() {
        let hostingController = UIHostingController(
            rootView: SwiftUIView(),
            ignoreSafeArea: ignoreSafeArea
        )
        addChild(hostingController)
        hostingController.view.backgroundColor = .yellow
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(hostingController.view)
        NSLayoutConstraint.activate(
            [
                hostingController.view.topAnchor.constraint(equalTo: container.topAnchor),
                hostingController.view.leftAnchor.constraint(equalTo: container.leftAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                hostingController.view.rightAnchor.constraint(equalTo: container.rightAnchor)
            ]
        )
        hostingController.didMove(toParent: self)
    }
}
