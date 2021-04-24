import UIKit
import Foundation

enum typeOfProductsInCollection
{
    case best
    case limited
}

class ProductCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private var arrayOfProducts = [extendedItem]()
    
    init(typeOfProduct: typeOfProductsInCollection)
    {
        if typeOfProduct == .best
        {
            arrayOfProducts = BestArray().items
        }
        else if typeOfProduct == .limited
        {
            arrayOfProducts = LimitedArray().items
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
     
        delegate = self
        dataSource = self
        
        register(CellWithPrice.self, forCellWithReuseIdentifier: CellWithPrice.reuseID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayOfProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = dequeueReusableCell(withReuseIdentifier: CellWithPrice.reuseID, for: indexPath) as? CellWithPrice
        
        guard let collectionCell = cell else { return UICollectionViewCell()}
        
        collectionCell.descriptionLabel.text = arrayOfProducts[indexPath.row].description
        
        let str = NSString(format:"%.1f", arrayOfProducts[indexPath.row].price!) as String
        collectionCell.priceLabel.text = str + " руб/ш"
        
        collectionCell.imageView.image = arrayOfProducts[indexPath.row].image
        
        return collectionCell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

