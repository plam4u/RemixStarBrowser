@objc(WhenIStartTheStarBrowser)
class WhenIStartTheStarBrowser: NSObject {

    @objc var theVisibleScreenIs: String?

    override init() {
        let wireframe = NavigationWireframeFake()
        let listView = StarListViewSpy()
        let viewFactory = StarBrowserViewDoubleFactory(listView: listView)
        let gateway = StarGatewayStub(.loading)

        let deps = StarBrowserFlow.Dependencies(navigationWireframe: wireframe,
                                                starBrowserViewFactory: viewFactory,
                                                starGateway: gateway)
        let flow = StarBrowserFlow(deps: deps)

        flow.start()

        theVisibleScreenIs = wireframe.topScreenName
    }

    open func test() {
    }
}
