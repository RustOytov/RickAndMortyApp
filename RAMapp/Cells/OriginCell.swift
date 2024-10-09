import UIKit

class OriginCell: UICollectionViewCell {
    
    let labelOrigin: UILabel = {
        let label = UILabel()
        label.text = "Origin"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let containerOrigin: UIView = {
        let container = UIView()
        container.backgroundColor = .bgCell
        container.layer.cornerRadius = 16
        container.clipsToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        container.contentMode = .scaleAspectFill
        return container
    }()
    
    let containerPlanet: UIView = {
        let container = UIView()
        container.backgroundColor = .bgOrigin
        container.layer.cornerRadius = 16
        container.clipsToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        container.contentMode = .scaleAspectFill
        return container
    }()
    
    let imagePlanet: UIImageView = {
        let image = UIImageView()
        image.image = .planet
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let namePlanet: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textPlanet: UILabel = {
        let label = UILabel()
        label.text = "Planet"
        label.textColor = .greenText
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelEpisodes: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
    }
    func setSubviews() {
        let objects = [labelOrigin,containerOrigin,containerPlanet,imagePlanet,namePlanet,textPlanet,labelEpisodes]
        for i in objects {
            contentView.addSubview(i)
        }
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            labelOrigin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            containerOrigin.topAnchor.constraint(equalTo: labelOrigin.bottomAnchor, constant: 8),
            containerOrigin.leadingAnchor.constraint(equalTo: labelOrigin.leadingAnchor),
            containerOrigin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerOrigin.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            containerPlanet.topAnchor.constraint(equalTo: containerOrigin.topAnchor,constant: 8),
            containerPlanet.leadingAnchor.constraint(equalTo: containerOrigin.leadingAnchor, constant: 8),
            containerPlanet.bottomAnchor.constraint(equalTo: containerOrigin.bottomAnchor, constant: -8),
            containerPlanet.widthAnchor.constraint(equalToConstant: 64)
        ])
        NSLayoutConstraint.activate([
            imagePlanet.topAnchor.constraint(equalTo: containerPlanet.topAnchor, constant: 16),
            imagePlanet.leadingAnchor.constraint(equalTo: containerPlanet.leadingAnchor, constant: 16),
            imagePlanet.heightAnchor.constraint(equalToConstant: 30),
            imagePlanet.widthAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            namePlanet.topAnchor.constraint(equalTo: containerOrigin.topAnchor, constant: 16),
            namePlanet.leadingAnchor.constraint(equalTo: containerPlanet.trailingAnchor, constant: 16),
            namePlanet.trailingAnchor.constraint(equalTo: containerOrigin.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            textPlanet.topAnchor.constraint(equalTo: namePlanet.bottomAnchor, constant: 8),
            textPlanet.leadingAnchor.constraint(equalTo: namePlanet.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            labelEpisodes.topAnchor.constraint(equalTo: containerOrigin.bottomAnchor, constant: 24),
            labelEpisodes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    func configure(with character: Character) {
        namePlanet.text = character.origin.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
