//
//  StrapiCore.swift
//  HelloStrapi
//
//  Created by Cyril Garcia on 5/23/21.
//

import Foundation
import Combine

class StrapiCore<T: Model>: ObservableObject {
    
    @Published var data: [T] = []
    
    var supportedLocalization: [String] = []
    var url: String
    
    private let base: String = "http://localhost:1337"
    private let session: URLSession
    private var task: Cancellable?
    
    init(_ session: URLSession = URLSession(configuration: .default)) {
        self.url = base
        self.session = session
        self.fetchSupportedLocalization()
    }
    
    func fetchSupportedLocalization() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        session.dataTask(with: URL(string: base + "/Localizations")!) { [weak self] data, response, error in
            if let data = data {
                do {
                    self?.supportedLocalization = try decoder.decode([Localization].self, from: data).map { $0.locale }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func fetch() {
                
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        task = session.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [T].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    self.url = self.base
                }
            }, receiveValue: { data in
                self.data = data
            })
    }
    
}
