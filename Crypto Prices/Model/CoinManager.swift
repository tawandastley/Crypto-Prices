//
//  CoinManager.swift
//  Crypto Prices
//
//  Created by tawanda chandiwana on 2021/12/24.
//

import Foundation
protocol CoinDelegate {
    func didUpdateCoinvalues(_ coinDataModel: CoinDataModel)
    func didFailWithError(error: Error)
}
struct CoinManager {
    
    var delegate: CoinDelegate?
    let baseURL =   "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "F6545279-505C-4B93-9946-5641B7A1B1F5"
 
    
    func getCoin (currency:String, coin: String) {
        let urlString = "\(baseURL)" +  "\(coin)" + "/" + "\(currency)" + "?apikey=" + "\(apiKey)"
        print(urlString)
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, url, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let coinPrice =  self.parseJson(safeData) {
                        self.delegate?.didUpdateCoinvalues(coinPrice)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson (_ coinData: Data) -> CoinDataModel? {
        let decoder = JSONDecoder()
        do {
        let parsedData =  try decoder.decode(CoinModel.self, from: coinData)
            let coinPrice = parsedData.rate
            let coinDataModel = CoinDataModel(dollarValue: coinPrice)
            return coinDataModel
        } catch {
            return nil
        }
    }
}
