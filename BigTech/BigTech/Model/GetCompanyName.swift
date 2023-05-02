//
//  ApiManager.swift
//  BigTech
//
//  Created by SERGEI on 30.03.2023.
//

import Foundation
import Combine

class GetCompanyName : ObservableObject{
    
    private let urlString = "https://run.mocky.io/v3/df80c311-970b-425a-9a46-4d8ba2c19911"
    private let emptyURL = "Empty"
    private var cancellable: AnyCancellable?
    
    @Published var currentCompany: Company?
    
    func getCompanyName(){
        cancellable = URLSession
            .shared
            .dataTaskPublisher(for: URL(string: urlString) ?? URL(string: emptyURL)!)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { (data: Data, response: URLResponse) in
                if let dataCompany = try? JSONDecoder().decode(CompanyInfo.self, from: data){
                    self.currentCompany = dataCompany.company
                }
            }
    }
    
    init(){
        self.getCompanyName()
    }
    
}
