import UIKit

class CharactersCell: UICollectionViewCell {
    //image hero
    let imageHero: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    //name hero
    let nameHero: UILabel = {
        let label = UILabel()
        label.contentMode = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//MARK: - init cell
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
//MARK: - setSubviews and makeConstraints
    
    func setSubviews() {
        contentView.addSubview(imageHero)
        contentView.addSubview(nameHero)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageHero.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            imageHero.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            imageHero.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            imageHero.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -54)
        ])
        NSLayoutConstraint.activate([
            nameHero.topAnchor.constraint(equalTo: imageHero.bottomAnchor, constant: 10),
            nameHero.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameHero.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8),
            nameHero.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
//MARK: - API
    func configure(with character: Character) {
        nameHero.text = character.name
        
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
