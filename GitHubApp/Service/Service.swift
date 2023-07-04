import Foundation

struct Service {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }

    func fetchList(of user: String, completion: @escaping ([Repository]?) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(user)/repos")
        // TODO
        
        guard let url else { return }
        network.performGet(url: url) { dados in
            guard let dados else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodado = try? decoder.decode([Repository].self, from: dados)
            completion(decodado)
        }
        
    }
}
