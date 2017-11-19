@objc(WhenThereIsANetworkErrorLoadingTheStar)
class WhenThereIsANetworkErrorLoadingTheStar: NSObject {

    @objc var theVisibleScreenIs: String?

    override init() {

        let wireframe = NavigationWireframeFake()
        let listView = StarListViewSpy()
        let errorView = StarErrorViewSpy()
        let viewFactory = StarBrowserViewDoubleFactory(listView: listView, errorView: errorView)
        let gateway = StarGatewayStub()

        let deps = StarBrowserFlow.Dependencies(navigationWireframe: wireframe,
                                                starBrowserViewFactory: viewFactory,
                                                starGateway: gateway)
        let flow = StarBrowserFlow(deps: deps)

        gateway.behaviour = .success(stubbedStars)
        flow.start()

        gateway.behaviour = .error
        listView.selectAnyRow()

        theVisibleScreenIs = wireframe.topScreenName
    }
}
