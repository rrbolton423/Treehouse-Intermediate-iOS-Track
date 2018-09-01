import PlaygroundSupport
import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    
    var value: Double = 0.0 {
        willSet {
            print("Old value: \(value)")
        }
        
        didSet {
            view.alpha = CGFloat(value)
            print("New value: \(value)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 30/255.0, green: 36/255.0, blue: 40/255.0, alpha: 1.0)
        
        // Add target-action pattern for value changed event
        slider.addTarget(self, action: #selector(viewController.slide(sender:)), for: .valueChanged)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Programmatically add constraints to setup layout
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.heightAnchor.constraint(equalToConstant: 30),
            slider.widthAnchor.constraint(equalToConstant: 400)
            ])
        
    }
    
    // Method for target-action
    @objc func slide(sender: UISlider) {
        value = Double(sender.value)
    }
    
}


let viewController = ViewController()
PlaygroundPage.current.liveView = viewController.view









