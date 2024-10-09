import UIKit

class CharactersVC: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var characters: [Character] = []
    
    //titlee characters
    let labelCharacters: UILabel = {
        let label = UILabel()
        label.text = "Characters"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 35)
        label.frame = CGRect(x: 32, y: 0, width: 200, height: 60)
        return label
    }()
    
//MARK: - DidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .bg
        //back-button
        let backbutton = UIBarButtonItem()
        backbutton.title = ""
        backbutton.tintColor = .white
        navigationItem.backBarButtonItem = backbutton
        
        //layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 60, left: 30, bottom: 30, right: 30)
        
        //collection
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CharactersCell.self, forCellWithReuseIdentifier: "CharactersCell")
        collectionView.backgroundColor = .clear
        collectionView.addSubview(labelCharacters)
        
        //api
        let api = CharactersAPI()
        api.fetchCharacters {
            DispatchQueue.main.async {
                self.characters = api.characters
                self.collectionView.reloadData()
            }
        }
        view.addSubview(collectionView)
    }
}
//MARK: - UICollectionViewDataSource
extension CharactersVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCell", for: indexPath) as! CharactersCell
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        
        cell.backgroundColor = .bgCell
        cell.layer.cornerRadius = 16
        cell.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 202)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infoVC = InfoVC()
        infoVC.selectedCharacter = characters[indexPath.row]
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
}
    
    

