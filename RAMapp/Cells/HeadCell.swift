import UIKit

class HeadCell: UICollectionViewCell {
    
    let imageHero: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameHero: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusHero: UILabel = {
        let label = UILabel()
        label.textColor = .greenText
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
        contentView.addSubview(imageHero)
        contentView.addSubview(nameHero)
        contentView.addSubview(statusHero)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageHero.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageHero.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageHero.widthAnchor.constraint(equalToConstant: 154),
            imageHero.heightAnchor.constraint(equalToConstant: 154)
        ])
        NSLayoutConstraint.activate([
            nameHero.topAnchor.constraint(equalTo: imageHero.bottomAnchor, constant: 16),
            nameHero.centerXAnchor.constraint(equalTo: imageHero.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            statusHero.topAnchor.constraint(equalTo: nameHero.bottomAnchor, constant: 8),
            statusHero.centerXAnchor.constraint(equalTo: nameHero.centerXAnchor)
        ])
    }
    //api
    func configure(with character: Character) {
        nameHero.text = character.name
        statusHero.text = character.status
        
        if let url = URL(string: character.image) {
            loadImage(from: url)
        }
    }
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("error load image")
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("error load data image")
                return
            }
            
            DispatchQueue.main.async {
                self.imageHero.image = image
            }
        }.resume()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
