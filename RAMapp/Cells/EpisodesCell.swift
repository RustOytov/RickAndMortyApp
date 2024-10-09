import UIKit

class EpisodesCell: UICollectionViewCell {
    let containerEpisodes: UIView = {
        let container = UIView()
        container.backgroundColor = .bgCell
        container.layer.cornerRadius = 16
        container.clipsToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        container.contentMode = .scaleAspectFill
        return container
    }()
    
    let nameEpisodes: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberSeason: UILabel = {
        let label = UILabel()
        label.textColor = .greenText
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateEpisodes: UILabel = {
        let label = UILabel()
        label.textColor = .grayText
        label.font = .systemFont(ofSize: 18)
        label.contentMode = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
    }
    func setSubviews() {
        contentView.addSubview(containerEpisodes)
        contentView.addSubview(nameEpisodes)
        contentView.addSubview(numberSeason)
        contentView.addSubview(dateEpisodes)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            containerEpisodes.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerEpisodes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerEpisodes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerEpisodes.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            nameEpisodes.topAnchor.constraint(equalTo: containerEpisodes.topAnchor, constant: 16),
            nameEpisodes.leadingAnchor.constraint(equalTo: containerEpisodes.leadingAnchor, constant: 16),
            nameEpisodes.trailingAnchor.constraint(equalTo: containerEpisodes.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            numberSeason.topAnchor.constraint(equalTo: nameEpisodes.bottomAnchor, constant: 10),
            numberSeason.leadingAnchor.constraint(equalTo: nameEpisodes.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            dateEpisodes.topAnchor.constraint(equalTo: numberSeason.topAnchor),
            dateEpisodes.trailingAnchor.constraint(equalTo: containerEpisodes.trailingAnchor, constant: -8),
            dateEpisodes.leadingAnchor.constraint(equalTo: numberSeason.trailingAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
