import  Foundation
import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == catalogCollectionView
        {
            return CatalogArray.itemsForCatalog.count + 2
        }
        else if collectionView == bestProductsCollectionView
        {
            return BestArray().items.count
        }
        
        return LimitedArray().items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == catalogCollectionView
        {
            return CGSize(width: 140, height: 140)
        }
        
        return CGSize(width: 130, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == catalogCollectionView
        {
            if indexPath.row == 0
            {
                return collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCell.reuseID, for: indexPath)
            }
            else if indexPath.row == CatalogArray.itemsForCatalog.count + 1
            {
                return collectionView.dequeueReusableCell(withReuseIdentifier: CellToAll.reuseID, for: indexPath)
            }
            else
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellWithGroup.reuseID, for: indexPath) as? CellWithGroup
                
                guard let collectionCell = cell else { return UICollectionViewCell()}
                
                collectionCell.label.text = CatalogArray.itemsForCatalog[indexPath.row - 1].name
                collectionCell.imageView.image = CatalogArray.itemsForCatalog[indexPath.row - 1].image
                
                return collectionCell
            }
        }
        else if collectionView == bestProductsCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellWithPrice.reuseID, for: indexPath) as? CellWithPrice
            
            guard let collectionCell = cell else { return UICollectionViewCell()}
            
            collectionCell.descriptionLabel.text = BestArray().items[indexPath.row].description
            
            let str = NSString(format:"%.1f", BestArray().items[indexPath.row].price!) as String
            collectionCell.priceLabel.text = str + " руб/ш"
            
            collectionCell.imageView.image = BestArray().items[indexPath.row].image
            
            return collectionCell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellWithPrice.reuseID, for: indexPath) as? CellWithPrice
            
            guard let collectionCell = cell else { return UICollectionViewCell()}
            
            collectionCell.descriptionLabel.text = LimitedArray().items[indexPath.row].description
            
            let str = NSString(format:"%.1f", LimitedArray().items[indexPath.row].price!) as String
            collectionCell.priceLabel.text = str + " руб/ш"
            
            collectionCell.imageView.image = LimitedArray().items[indexPath.row].image
            
            return collectionCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let det = DetailController()
        det.modalPresentationStyle = .fullScreen
        present(det, animated: true)
    }
}
