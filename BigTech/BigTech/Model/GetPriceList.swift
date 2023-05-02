//
//  GetPriceList.swift
//  BigTech
//
//  Created by SERGEI on 18.04.2023.
//

import Foundation
import Combine

class GetPriceList : ObservableObject{
    
//    private let urlString = "https://run.mocky.io/v3/df80c311-970b-425a-9a46-4d8ba2c19911"
//    private let emptyURL = "Empty"
//    private var cancellable: AnyCancellable?
//
//    @Published var priceList:[PriceList]
//
//    func getPriceList(){
//        cancellable = URLSession
//            .shared
//            .dataTaskPublisher(for: URL(string: urlString) ?? URL(string: emptyURL)!)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in } receiveValue: { (data: Data, response: URLResponse) in
//                if let dataPrice = try? JSONDecoder().decode(ServerInfo.self, from: data){
//                    self.priceList = dataPrice.company.priceList
//                }
//            }
//    }
//
//    init(){
////        DispatchQueue.main.async {
//        //self.getPriceList()
//
//        }
//
}
