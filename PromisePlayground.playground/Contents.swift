import UIKit.UINavigationController
import ApplicationFramework
import PlaygroundSupport

let navigationController = UINavigationController(rootViewController: MenuViewController())
navigationController.view.backgroundColor = .white

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = navigationController
