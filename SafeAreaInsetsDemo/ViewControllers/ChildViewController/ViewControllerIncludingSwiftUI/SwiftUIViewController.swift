//
//  FooViewController.swift
//  SafeAreaInsetsDemo
//

import SwiftUI
import UIKit

final class SwiftUIViewController: UIViewController {

    private let viewControllerType: ViewControllerType
    private weak var parentNavigationController: UINavigationController?

    @IBOutlet private weak var container: UIView!

    init?(
        coder: NSCoder,
        parentNavigationController: UINavigationController?,
        viewControllerType: ViewControllerType
    ) {
        self.parentNavigationController = parentNavigationController
        self.viewControllerType = viewControllerType
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
        let hostingController: UIHostingController<SwiftUIView>
        switch viewControllerType {
        case .ignoreSafeAreaTrue:
            hostingController = UIHostingController(
                rootView: SwiftUIView(),
                ignoreSafeArea: true
            )
        case .ignoreSafeAreaFalse:
            hostingController = UIHostingController(
                rootView: SwiftUIView(),
                ignoreSafeArea: false
            )
        case .useSafeAreaRegion:
            hostingController = UIHostingController(rootView: SwiftUIView())
            if #available(iOS 16.4.0, *) {
                hostingController.safeAreaRegions.remove(.all)
            } else {
                let alertController = UIAlertController(
                    title: nil,
                    message: "iOS 16.4 以上でしか動作しません",
                    preferredStyle: .alert
                )
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                present(alertController, animated: true)
            }
        }
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
