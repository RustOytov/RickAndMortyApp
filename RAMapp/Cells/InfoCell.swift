import UIKit

class InfoCell: UICollectionViewCell {
    
    let labelInfo: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerInfo: UIView = {
        let container = UIView()
        container.backgroundColor = .bgCell
        container.layer.cornerRadius = 16
        container.clipsToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        container.contentMode = .scaleAspectFill
        return container
    }()
    
    //in container
    let speciesHero: UILabel = {
        let label = UILabel()
        label.text = "Species:"
        label.textColor = .grayText
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeHero: UILabel = {
        let label = UILabel()
        label.text = "Type:"
        label.textColor = .grayText
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderHero: UILabel = {
        let label = UILabel()
        label.text = "Gender:"
        label.textColor = .grayText
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //results in container
    let speciesHeroResult: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeHeroResults: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let genderHeroResults: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: - init
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
    }
    //MARK: - setSubviews,makeConstraints
    func setSubviews() {
        let objescts = [labelInfo,containerInfo,speciesHero,typeHero,genderHero,speciesHeroResult,typeHeroResults, genderHeroResults]
        for i in objescts {
            contentView.addSubview(i)
        }
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            labelInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            containerInfo.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: 8),
            containerInfo.leadingAnchor.constraint(equalTo: labelInfo.leadingAnchor),
            containerInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerInfo.heightAnchor.constraint(equalToConstant: 124)
        ])
        NSLayoutConstraint.activate([
            speciesHero.topAnchor.constraint(equalTo: containerInfo.topAnchor, constant: 16),
            speciesHero.leadingAnchor.constraint(equalTo: containerInfo.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            typeHero.topAnchor.constraint(equalTo: speciesHero.bottomAnchor, constant: 16),
            typeHero.leadingAnchor.constraint(equalTo: containerInfo.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            genderHero.topAnchor.constraint(equalTo: typeHero.bottomAnchor, constant: 16),
            genderHero.leadingAnchor.constraint(equalTo: containerInfo.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            speciesHeroResult.topAnchor.constraint(equalTo: speciesHero.topAnchor),
            speciesHeroResult.leadingAnchor.constraint(equalTo: speciesHero.trailingAnchor, constant: 20),
            speciesHeroResult.trailingAnchor.constraint(equalTo: containerInfo.trailingAnchor,constant: -20)
        ])
        NSLayoutConstraint.activate([
            typeHeroResults.topAnchor.constraint(equalTo: typeHero.topAnchor),
            typeHeroResults.leadingAnchor.constraint(equalTo: speciesHeroResult.leadingAnchor),
            typeHeroResults.trailingAnchor.constraint(equalTo: containerInfo.trailingAnchor,constant: -20)
        ])
        NSLayoutConstraint.activate([
            genderHeroResults.topAnchor.constraint(equalTo: genderHero.topAnchor),
            genderHeroResults.leadingAnchor.constraint(equalTo: speciesHeroResult.leadingAnchor),
            genderHeroResults.trailingAnchor.constraint(equalTo: containerInfo.trailingAnchor,constant: -20)
        ])
    }
    //MARK: - API
    
    func configure(with character: Character) {
        speciesHeroResult.text = character.species
        genderHeroResults.text = character.gender

        if character.type == "" {
            typeHeroResults.text = "None"
        } else {
            typeHeroResults.text = character.type
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
