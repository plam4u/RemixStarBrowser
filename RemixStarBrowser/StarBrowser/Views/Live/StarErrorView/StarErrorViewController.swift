import Layout

class StarErrorViewController: UIViewController, LayoutLoading, StarErrorView {

    init() {
        super.init(nibName: nil, bundle: nil)
        loadLayout(named: "StarErrorView.xml")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
