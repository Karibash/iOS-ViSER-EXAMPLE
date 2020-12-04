//
//  ArticleTableViewCell.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/03.
//

import UIKit

@IBDesignable
final class ArticleTableViewCell: UITableViewCell {
    
    // MARK: - Private properties

    @IBOutlet private weak var emojiLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var elapsedTimeLabel: UILabel!
    @IBOutlet private weak var readTimeLabel: UILabel!

    // MARK: - Public methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ item: Article) {
        emojiLabel.text = String(item.emoji)
        titleLabel.text = item.title
        elapsedTimeLabel.text = Date().elapsed(from: item.publishedAt)
        readTimeLabel.text = "\(item.readingTimeMinutes) read time"
    }

}
