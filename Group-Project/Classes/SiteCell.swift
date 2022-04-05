//
//  SiteCell.swift
//  SwiftTsableVireActions2
//
//  Created by  on 2022-03-12.
//

import UIKit

class SiteCell: UITableViewCell {

    let primaryLable=UILabel()
    let secondaryLabel=UILabel()

let myImageView=UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        primaryLable.textAlignment = .left
        primaryLable.font = UIFont.boldSystemFont(ofSize: 30)
        primaryLable.backgroundColor = .clear
        primaryLable.textColor = .blue
        secondaryLabel.textAlignment = .left
        
        secondaryLabel.font = UIFont.boldSystemFont(ofSize: 12)
        secondaryLabel.backgroundColor = .clear
        secondaryLabel.textColor = .blue
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(primaryLable)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(myImageView)
        
        
    }
    
    override func layoutSubviews() {
        primaryLable.frame=CGRect(x:100,y:5,width:460,height:40)
        secondaryLabel.frame = CGRect(x:5,y:5,width: 45,height:45)
        myImageView.frame=CGRect(x:5,y:10,width: 45,height: 45)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
