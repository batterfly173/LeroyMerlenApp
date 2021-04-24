import UIKit
import TinyConstraints

class CellWithPrice: UICollectionViewCell
{
    static let reuseID = "CellWithPrice"
    var priceLabel = UILabel()
    var imageView = UIImageView()
    var descriptionLabel = UILabel()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.cornerRadius = 7
        
        self.addSubview(imageView)
        imageView.centerXToSuperview()
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(priceLabel)
        priceLabel.centerXToSuperview()
        priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        priceLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        priceLabel.textAlignment = .center
        
        self.addSubview(descriptionLabel)
        descriptionLabel.centerXToSuperview()
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 7).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        descriptionLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        descriptionLabel.numberOfLines = 3
        
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
