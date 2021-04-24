import UIKit
import Foundation

extension SearchViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        leadingSpace.constant = 55
        searchTextField.updateConstraints()
        
        delegate.changeStateOfSearchBar(gesture: GestureForChangeStateOfSearchBar.textFieldButtonTapped)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField.text != ""
        {
            let det = DetailController()
            
            det.modalPresentationStyle = .fullScreen
            present(det, animated: false)
            
            textField.resignFirstResponder()
            return true
        }
        
        textField.resignFirstResponder()
        return true
    }
}

