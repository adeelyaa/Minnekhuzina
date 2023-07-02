
import UIKit

struct ListTableViewData {
    let title: String
}

final class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setUp(_ data: ListTableViewData) {
        titleLabel.text = data.title
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
}
