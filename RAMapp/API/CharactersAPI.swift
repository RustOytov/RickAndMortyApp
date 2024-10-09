import UIKit
import Foundation

struct Location: Decodable {
    let name: String
}

// Структура для данных о персонаже
struct Character: Decodable {
    let image: String
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let episode: [String]
}

// Структура для данных об эпизоде
struct Episode: Decodable {
    let name: String
    let episode: String
    let air_date: String
}

struct CharacterResponse: Decodable {
    let results: [Character]
}

class CharactersAPI {
    
    var characters: [Character] = []
    
    func fetchCharacters(completion: @escaping () -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else {
            print("url error")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("error data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
                self.characters = characterResponse.results
                for i in self.characters {
                    print(i.episode)
                }
                completion()
            } catch {
                print("error parsing")
            }
        }
        task.resume()
    }
    
    func loadEpisodeName(from url: String, completion: @escaping (String) -> Void) {
        guard let episodeUrl = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: episodeUrl) { data, response, error in
            if let error = error {
                print("Failed to load episode: \(error)")
                return
            }
            guard let data = data else {
                print("No data found")
                return
            }
            
            do {
                let episode = try JSONDecoder().decode(Episode.self, from: data)
                completion(episode.name)
            } catch {
                print("Failed to decode episode: \(error)")
            }
        }
        task.resume()
    }
    func loadEpisodeSeason(from url: String, completion: @escaping (String) -> Void) {
        guard let episodeUrl = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: episodeUrl) { data, response, error in
            if let error = error {
                print("Failed to load episode: \(error)")
                return
            }
            guard let data = data else {
                print("No data found")
                return
            }

            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received episode JSON: \(jsonString)")
            }
            
            do {
                let episode = try JSONDecoder().decode(Episode.self, from: data)
                completion(episode.episode)
            } catch {
                print("Failed to decode episode: \(error)")
            }
        }
        task.resume()
    }
    func formatedEpisodeSeason(str: String) -> String{
        
        let components = str.filter { $0 != "S" && $0 != "E" }.map { String($0) }

        let season = String(Int(components.prefix(2).joined()) ?? 0)
        let series = String(Int(components.suffix(2).joined()) ?? 0)

        return("Season \(season) Series \(series)")

    }
    //date
    func loadEpisodeDate(from url: String, completion: @escaping (String) -> Void) {
        guard let episodeUrl = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: episodeUrl) { data, response, error in
            if let error = error {
                print("Failed to load episode: \(error)")
                return
            }
            guard let data = data else {
                print("No data found")
                return
            }

            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received episode JSON: \(jsonString)")
            }
            
            do {
                let episode = try JSONDecoder().decode(Episode.self, from: data)
                completion(episode.air_date)
            } catch {
                print("Failed to decode episode: \(error)")
            }
        }
        task.resume()
    }
}
