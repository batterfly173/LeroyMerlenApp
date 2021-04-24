import UIKit

enum GestureForChangeStateOfSearchBar
{
    case swipeUp
    case swipeDown
    case textFieldButtonTapped
    case closeTableViewButtonTapped
}

class ContainerViewController: UIViewController, ChangePositionProtocol
{
    func changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar)
    {
        if gesture == .textFieldButtonTapped
        {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:         .curveEaseOut, animations:
            {
                self.mainViewController.searchTableView.isHidden = false
                self.mainViewController.mainScrollView.isHidden = true
            }, completion: nil)
        }
        
        if gesture == .textFieldButtonTapped
        {
            self.searchViewController.closeTableViewButton.isHidden = false
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:  .curveEaseOut, animations:
            {
                self.searchViewController.searchTextField.frame.origin.x = self.searchViewController.searchTextField.frame.origin.x + 35
            }, completion: nil)
        }
        else if gesture == .closeTableViewButtonTapped
        {
            self.searchViewController.closeTableViewButton.isHidden = true
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:  .curveEaseOut, animations:
            {
                self.searchViewController.searchTextField.frame.origin.x = self.searchViewController.searchTextField.frame.origin.x - 35
            }, completion: nil)
        }
        
        if gesture == .swipeUp || gesture == .closeTableViewButtonTapped
        {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options:         .curveEaseOut, animations:
            {
                self.mainViewController.view.frame.origin.y = 200
                
                self.searchViewController.view.backgroundColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
                self.searchViewController.buttonTextField.isHidden = false
                
                
                self.searchViewController.view.frame.origin.y = self.searchViewController.view.frame.origin.y + 80
                
                self.searchViewController.lineShapeLayer.isHidden = true
                
                self.mainViewController.searchTableView.isHidden = true
                self.mainViewController.mainScrollView.isHidden = false
                
            }, completion: {_ in self.mainViewController.previousSwipe = .down })
            
            self.searchViewController.searchBarIsShowFull = true
        }
        else if gesture == .swipeDown || gesture == .textFieldButtonTapped
        {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations:
            {
                self.mainViewController.view.frame.origin.y = 100
                self.searchViewController.buttonTextField.isHidden = true
                self.searchViewController.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
                self.searchViewController.lineShapeLayer.isHidden = false
                
                if self.searchViewController.searchBarIsShowFull
                {
                    self.searchViewController.view.frame.origin.y = self.searchViewController.view.frame.origin.y - 80
                }
                
            }, completion: {_ in self.mainViewController.previousSwipe = .up })
        }
        
        self.searchViewController.searchBarIsShowFull = false
    }
    
    private(set) var mainViewController: MainViewController!
    private(set) var searchViewController: SearchViewController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        configureMainViewController()
        configureSearchViewController()
        
        self.mainViewController.view.frame.origin.y = 200
        self.searchViewController.view.frame.origin.y = 0
        
        mainViewController.delegate = self
    }
    
    private func configureMainViewController()
    {
        
        if searchViewController == nil
        {
            mainViewController = MainViewController()
            
            view.insertSubview(mainViewController.view, at: 0)
            addChild(mainViewController)
        }
    }
    
    private func configureSearchViewController()
    {
        if searchViewController == nil
        {
            searchViewController = SearchViewController()
            searchViewController.delegate = self
            view.insertSubview(searchViewController.view, at: 0)
            addChild(searchViewController)
        }
    }
}
