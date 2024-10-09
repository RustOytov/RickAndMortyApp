import UIKit

class InfoVC: UIViewController {
    var selectedCharacter: Character?
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bg
        

        let layout = createLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        collectionView.register(HeadCell.self, forCellWithReuseIdentifier: "HeadCell")
        collectionView.register(InfoCell.self, forCellWithReuseIdentifier: "InfoCell")
        collectionView.register(OriginCell.self, forCellWithReuseIdentifier: "OriginCell")
        collectionView.register(EpisodesCell.self, forCellWithReuseIdentifier: "EpisodesCell")

        collectionView.dataSource = self
    }

    // MARK: - Layout
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return self.createImageSectionLayout()
            case 1:
                return self.createInfoSectionLayout()
            case 2:
                return self.createOriginSectionLayout()
            case 3:
                return self.createEpisodesSectionLayout()
            default:
                return nil
            }
        }
    }

    // image section layout
    func createImageSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 150, trailing: 20)
        return section
    }

    // info section layout
    func createInfoSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 60, trailing: 20)
        return section
    }

    // origin section layout
    func createOriginSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 20)
        return section
    }

    // episodes section layout
    func createEpisodesSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 35, leading: 20, bottom: 30, trailing: 20)
        return section
    }

    // MARK: - DataSource
}

extension InfoVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return selectedCharacter?.episode.count ?? 0
        default:
            print("Unexpected section")
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadCell", for: indexPath) as! HeadCell
            if let characterApi = selectedCharacter {
                cell.configure(with: characterApi)
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCell
            if let characterApi = selectedCharacter {
                cell.configure(with: characterApi)
            }
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OriginCell", for: indexPath) as! OriginCell
            if let characterApi = selectedCharacter {
                cell.configure(with: characterApi)
            }
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EpisodesCell", for: indexPath) as! EpisodesCell
            
            let episodeUrl = selectedCharacter!.episode[indexPath.row]
            
            let api = CharactersAPI()
            api.loadEpisodeName(from: episodeUrl) { episodeName in
                DispatchQueue.main.async {
                    cell.nameEpisodes.text = episodeName
                }
            }
            
            api.loadEpisodeSeason(from: episodeUrl) { episodeSeason in
                DispatchQueue.main.async {
                    cell.numberSeason.text = api.formatedEpisodeSeason(str: episodeSeason)
                }
            }
            api.loadEpisodeDate(from: episodeUrl) { episodeDate in
                DispatchQueue.main.async {
                    cell.dateEpisodes.text = episodeDate
                }
            }
            
            return cell
        default:
            fatalError("Unexpected section index: \(indexPath.section)")
        }
    }
}
