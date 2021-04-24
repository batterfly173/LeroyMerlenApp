import Foundation
import UIKit


class CellWithGroup: UICollectionViewCell
{
    static let reuseID = "CellWithGroup"
    var label = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9715135854, green: 0.9715135854, blue: 0.9715135854, alpha: 1)
        
        layer.cornerRadius = 7
        
        self.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.addSubview(label)
        label.frame = CGRect(x: 10, y: 0, width: 120, height: 60)
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        label.numberOfLines = 2
        
        self.addSubview(imageView)
        imageView.frame = CGRect(x: 70, y: 70, width: 75, height: 75)
        imageView.contentMode = .scaleAspectFill
        
        self.layer.masksToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
