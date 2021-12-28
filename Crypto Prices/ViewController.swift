//
//  ViewController.swift
//  Crypto Prices
//
//  Created by tawanda chandiwana on 2021/12/23.
//

import UIKit

class ViewController: UIViewController, CoinDelegate {
   
    
    
    var coinManager = CoinManager()

    @IBOutlet weak var usdValue: UILabel!
    @IBOutlet weak var poundvalue: UILabel!
    @IBOutlet weak var chinesYuanValue: UILabel!
    @IBOutlet weak var saRandvalue: UILabel!
    
    override func viewDidLoad() {
       
        coinManager.delegate = self
        super.viewDidLoad()
        self.coinManager.getCoin(currency: "USD", coin: "BTC")
        // Do any additional setup after loading the view.
    }
   
    func didUpdateCoinvalues(_ coinDataModel: CoinDataModel) {
        DispatchQueue.main.async {
            
            self.usdValue.text =  coinDataModel.dollarString
            self.poundvalue.text = coinDataModel.poundValue
            self.chinesYuanValue.text = coinDataModel.yuanValue
            self.saRandvalue.text = coinDataModel.randValue
            
        }
    }
    func didFailWithError(error: Error) {
        
    }
    
    @IBAction func didChageCoin(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            coinManager.getCoin(currency: "USD", coin: "BTC")
            view.backgroundColor = .brown
        default:
            coinManager.getCoin(currency: "USD", coin: "ETH")
            view.backgroundColor = .magenta
            
        }
    }
    
}

