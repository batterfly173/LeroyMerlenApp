import Foundation
import UIKit

extension SearchViewController
{
    func configurateCloseTAbleViewButton()
    {
        view.addSubview(closeTableViewButton)
        
        closeTableViewButton.translatesAutoresizingMaskIntoConstraints = false
        closeTableViewButton.imageView.image = UIImage(systemName: "chevron.left", withConfiguration: .none)
        closeTableViewButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       
        closeTableViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        closeTableViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
        closeTableViewButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeTableViewButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeTextFieldButtonTapped))
        closeTableViewButton.addGestureRecognizer(tap)

        closeTableViewButton.isHidden = true
    }
    
    func configurateTextFieldButton()
    {
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(textFieldButtonTapped))
        buttonTextField.addGestureRecognizer(tap)
    }
    
    func configurateLine()
    {
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
    }
    
    func configurateSearchTextField()
    {
        view.addSubview(searchTextField)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchTextField.delegate = self
        searchTextField.tintColor = #colorLiteral(red: 0.3268811405, green: 0.7674738765, blue: 0.2489330173, alpha: 1)
    
        
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: searchTextField.frame.height))
        searchTextField.leftViewMode = .always
        
        searchTextField.layer.cornerRadius = 5
        searchTextField.layer.borderWidth = 0
        searchTextField.placeholder = "??????????"
        leadingSpace = searchTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        leadingSpace.isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        searchTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configurateLabel()
    {
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.text = "?????????? ??????????????"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
    }
}
