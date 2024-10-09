import UIKit
private let stars: UIImageView = {
    let image = UIImageView()
    image.image = .stars
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
}()

private let titleImage: UIImageView = {
    let image = UIImageView()
    image.image = .title
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
}()
class StartVC: UIViewController {
    
    private lazy var portalButton: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(portalButtonTapped), for: .touchUpInside)
        button.setImage(.portal, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bg
        setSubviews()
        makeConstraints()
    }
    
    private func setSubviews() {
        view.addSubview(stars)
        view.addSubview(titleImage)
        view.addSubview(portalButton)
    }
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            stars.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 98),
            stars.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stars.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            stars.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 64)
        ])
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 174),
            titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            titleImage.heightAnchor.constraint(equalTo: titleImage.widthAnchor, multiplier: 40/140)
        ])
        NSLayoutConstraint.activate([
            portalButton.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 36),
            portalButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 118),
            portalButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -118),
            portalButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -344)
        ])
    }
    @objc private func portalButtonTapped() {
        let charactersVC = CharactersVC()
        let navController = UINavigationController(rootViewController: charactersVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
}
