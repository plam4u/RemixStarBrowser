import Layout

class StarDetailViewController: LayoutViewController, StarDetailView {

    var viewData = StarDetailViewData.empty {
        didSet {
            updateState()
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        loadLayout(named: "StarDetailView.xml", state: viewData)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutDidLoad() {
        updateState()
    }

    private func updateState() {
        layoutNode?.setState(viewData, animated: true)
    }
}