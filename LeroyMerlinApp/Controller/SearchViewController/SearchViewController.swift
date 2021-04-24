import UIKit

class SearchViewController: UIViewController
{
    var searchTextField = UITextField()
    var label = UILabel()
    var lineShapeLayer = CAShapeLayer()
    var buttonTextField = CustomView()
    var closeTableViewButton = CustomView()
    
    var delegate: ChangePositionProtocol!
    var searchBarIsShowFull = true
    
    var leadingSpace: NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.text = "Поиск товаров"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        view.addSubview(searchTextField)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchTextField.delegate = self
        searchTextField.tintColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
    
        
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: searchTextField.frame.height))
        searchTextField.leftViewMode = .always
        
        searchTextField.layer.cornerRadius = 5
        searchTextField.layer.borderWidth = 0
        searchTextField.placeholder = "Поиск"
        leadingSpace = searchTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)//.isActive = true
        leadingSpace.isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        searchTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.view.layer.addSublayer(lineShapeLayer)
        lineShapeLayer.frame = view.bounds
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 180))
        path.addLine(to: CGPoint(x: view.frame.width, y: 180))
        
        lineShapeLayer.path = path.cgPath
        
        lineShapeLayer.lineWidth = 3
        lineShapeLayer.lineCap = .round
        lineShapeLayer.fillColor = nil
        lineShapeLayer.strokeEnd = 1
        lineShapeLayer.strokeColor = UIColor.lightGray.cgColor
        lineShapeLayer.isHidden = true
        
        searchTextField.addSubview(buttonTextField)
        
        buttonTextField.translatesAutoresizingMaskIntoConstraints = false
        buttonTextField.imageView.image = UIImage(systemName: "magnifyingglass", withConfiguration: .none)
        buttonTextField.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        buttonTextField.layer.cornerRadius = 5
        buttonTextField.backgroundColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
        buttonTextField.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -5).isActive = true
        buttonTextField.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 5).isActive = true
        buttonTextField.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: -5).isActive = true
        buttonTextField.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(textFieldButtonTapped))
        buttonTextField.addGestureRecognizer(tap1)
        
        view.addSubview(closeTableViewButton)
        
        closeTableViewButton.translatesAutoresizingMaskIntoConstraints = false
        closeTableViewButton.imageView.image = UIImage(systemName: "chevron.left", withConfiguration: .none)
        closeTableViewButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       
        closeTableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        closeTableViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
        closeTableViewButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeTableViewButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(closeTextFieldButtonTapped))
        closeTableViewButton.addGestureRecognizer(tap2)

        closeTableViewButton.isHidden = true
    }
    
    @objc func closeTextFieldButtonTapped()
    {
        searchTextField.resignFirstResponder()
        delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.closeTableViewButtonTapped)
    }
    
    @objc func textFieldButtonTapped()
    {
        leadingSpace.constant = 55
        searchTextField.updateConstraints()
        
        delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.textFieldButtonTapped)
    }

}


extension SearchViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.textFieldButtonTapped)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
