import Foundation

class StarListViewSpy: StarListView {
    var viewData = StarListViewData.empty
    var delegate: StarListViewDelegate?
}

extension StarListViewSpy {

    func selectAnyRow() {
        select(row: 0)
    }

    func select(row: NSNumber?) {
        guard let row = row?.intValue else { return }
        select(row: row)
    }

    private func select(row: Int) {
        guard (0..<viewData.entries.count).contains(row) else { return }
        let star = viewData.entries[row]
        delegate?.didSelectStar(withID: star.id)
    }
}
