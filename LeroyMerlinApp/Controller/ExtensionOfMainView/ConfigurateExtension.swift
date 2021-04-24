import Foundation
import UIKit

extension MainViewController
{
    func configurateScrollView()
    {
        view.addSubview(mainScrollView)
        mainScrollView.delegate = self
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: 1100)
    }
    
    func configurateLabels()
    {
        mainScrollView.addSubview(bestProductsTitle)
        bestProductsTitle.text = "Предложение ограничено"
        bestProductsTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        bestProductsTitle.frame = CGRect(x: 10, y: 200, width: 400, height: 40)
        
        mainScrollView.addSubview(limitedProductsProduct)
        limitedProductsProduct.text = "Лучшая цена"
        limitedProductsProduct.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        limitedProductsProduct.frame = CGRect(x: 10, y: 500, width: 400, height: 40)
    }
    
    func configurateTableView()
    {
        view.addSubview(searchTableView)
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.separatorStyle = .none
        searchTableView.showsVerticalScrollIndicator = false
        
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        searchTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280).isActive = true
        
        searchTableView.isHidden = true
    }
    func configurateFirstCollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        catalogCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        mainScrollView.addSubview(catalogCollectionView)
        catalogCollectionView.delegate = self
        catalogCollectionView.dataSource = self
        
        catalogCollectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        catalogCollectionView.showsHorizontalScrollIndicator = false
        
        catalogCollectionView.register(CellWithGroup.self, forCellWithReuseIdentifier: CellWithGroup.reuseID)
        
        catalogCollectionView.register(CatalogCell.self, forCellWithReuseIdentifier: CatalogCell.reuseID)
        catalogCollectionView.register(CellToAll.self, forCellWithReuseIdentifier: CellToAll.reuseID)
        catalogCollectionView.frame = CGRect(x: 10, y: 10, width: 395, height: 150)
    }
    
    func configurateSecondCollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        bestProductsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        mainScrollView.addSubview(bestProductsCollectionView)
        
        bestProductsCollectionView.delegate = self
        bestProductsCollectionView.dataSource = self
        
        bestProductsCollectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bestProductsCollectionView.showsHorizontalScrollIndicator = false
        
        bestProductsCollectionView.register(CellWithPrice.self, forCellWithReuseIdentifier: CellWithPrice.reuseID)

        bestProductsCollectionView.frame = CGRect(x: 10, y: 250, width: 395, height: 190)
    }
    
    func configurateThirdCollectionView()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        limitedProductsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        mainScrollView.addSubview(limitedProductsCollectionView)
        
        limitedProductsCollectionView.delegate = self
        limitedProductsCollectionView.dataSource = self
        
        limitedProductsCollectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        limitedProductsCollectionView.showsHorizontalScrollIndicator = false
        
        limitedProductsCollectionView.register(CellWithPrice.self, forCellWithReuseIdentifier: CellWithPrice.reuseID)

        limitedProductsCollectionView.frame = CGRect(x: 10, y: 550, width: 395, height: 190)
    }
}




