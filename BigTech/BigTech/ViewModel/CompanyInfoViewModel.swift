//
//  CompanyInfoViewModel.swift
//  BigTech
//
//  Created by SERGEI on 12.04.2023.
//

import Foundation
import Combine

class CompanyInfoViewModel : ObservableObject{
    
    private let urlString = URL(string: "https://run.mocky.io/v3/df80c311-970b-425a-9a46-4d8ba2c19911")
    
    @Published var companyInfo : CompanyInfo?

    var cancellable = Array<AnyCancellable>()
    
    init(){
        fetchCompanyInfo()
    }
    
    func fetchCompanyInfo(){
        guard let url = urlString else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, responce) -> Data in
                guard
                    let responce = responce as? HTTPURLResponse,
                    responce.statusCode >= 200 && responce.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: CompanyInfo.self, decoder: JSONDecoder())
            .sink { completion in
                print("COMPLETION: \(completion)")
            } receiveValue: { (cmpInf) in
                self.companyInfo = cmpInf
            }
            .store(in: &cancellable)
    }
}
