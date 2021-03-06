import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootFlow: StarBrowserFlow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let navigator = UIKitNavigator()
        rootFlow = makeStarBrowserFlow(navigator: navigator)
        configureWindow(rootViewController: navigator)
        rootFlow?.start()

        return true
    }

    private func makeStarBrowserFlow(navigator: Navigator) -> StarBrowserFlow {

        let deps = StarBrowserFlow.Dependencies(navigator: navigator,
                                                starBrowserViewFactory: StarBrowserViewControllerFactory(),
                                                starGateway: makeGateway())
        return StarBrowserFlow(deps: deps)
    }

    private func makeGateway() -> StarGateway {
        let gateway = StarGatewayStub()  // Use NASAStarGateway in real app.
        gateway.behaviour = .success(makeStars())
        return gateway
    }

    private func makeStars() -> [Star] {
        return [
            Star(id: Star.ID.make(), name: "Sirius", summary: "Sirius is a star system and the brightest star in the Earth's night sky."),
            Star(id: Star.ID.make(), name: "Canopus", summary: "Canopus is the brightest star in the southern constellation of Carina."),
            Star(id: Star.ID.make(), name: "Arcturus", summary: "Together with Spica and Denebola, Arcturus is part of the Spring Triangle asterism.")
        ]
    }

    private func configureWindow(rootViewController: UIViewController) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}
