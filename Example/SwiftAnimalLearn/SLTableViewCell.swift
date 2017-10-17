//
//  SLTableViewCell.swift
//  FBSnapshotTestCase
//
//  Created by 山梨 on 2017/10/17.
//

import UIKit

class SLTableViewCell: UITableViewCell {

    var titleLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLab = UILabel(frame: CGRect(x: 20, y: 15, width:200, height:30))
        titleLab.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(titleLab)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
