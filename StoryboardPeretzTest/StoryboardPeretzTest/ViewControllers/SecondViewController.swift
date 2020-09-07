//
//  SecondViewController.swift
//  StoryboardPeretzTest
//
//  Created by Муслим Курбанов on 04.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstDescriptionLabel: UILabel!
    @IBOutlet weak var firstPriceLabel: UILabel!
    @IBOutlet weak var firstCountLabel: UILabel!
    @IBOutlet weak var firstMinusButtonOutlet: UIButton!
    
    //secondItems
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var secondDescriptionLabel: UILabel!
    @IBOutlet weak var secondPriceLabel: UILabel!
    @IBOutlet weak var secondCountLabel: UILabel!
    
    
    //MARK: Constants and variables
    let networkService = NetworkService()
    var searchResponce: [Model]? = nil
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Request
        let urlString = "https://peretz-group.ru/api/v2/products?category=93&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
        
        networkService.request(urlString: urlString) { (result) in
            switch result {
                
            case .success(let searchResponce):
//                searchResponce.map { (track) in
//                    print(track.description)
//                }
                self.searchResponce = searchResponce
            case .failure(let error):
                print(error)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        //firstDatasLoad
        let firstDatas = searchResponce?[1]
        self.firstNameLabel.text = firstDatas?.name
        self.firstDescriptionLabel.text = firstDatas?.description
        let newprice = firstDatas?.price
        self.firstPriceLabel.text = String(newprice!) + " ₽"
        
        guard let urlString = firstDatas?.image else { return }
        let url = URL(string: urlString)!
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            self.firstImageView.image = image
            self.firstImageView.contentMode = .scaleAspectFit
            
        }
        
        //secondDatasLoad
        
        let secondDatas = searchResponce?[3]
        self.secondNameLabel.text = secondDatas?.name
        self.secondDescriptionLabel.text = secondDatas?.description
        let secondnewprice = secondDatas?.price
        self.secondPriceLabel.text = String(secondnewprice!) + " ₽"
        
        guard let secondurlString = secondDatas?.image else { return }
        let secondurl = URL(string: secondurlString)!
        let seconddata = try? Data(contentsOf: secondurl)
        
        if let imageData = seconddata {
            let image = UIImage(data: imageData)
            self.secondImageView.image = image
            self.secondImageView.contentMode = .scaleAspectFit
            
        }
        
    }
    
    
    //MARK: IBActions
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func firstMinusButton(_ sender: Any) {
        if a > 0 {
            a-=1
            firstCountLabel.text = String(a)
            
        }
    }
    
    var a = 0
    
    @IBAction func firstPlusButton(_ sender: Any) {
        if a < 9 {
            a+=1
            firstCountLabel.text = String(a)
        } else {return}
    }
    
    var secondCountNumber = 0
    //second
    @IBAction func secondMinusButton(_ sender: Any) {
        if secondCountNumber > 0 {
            secondCountNumber-=1
            secondCountLabel.text = String(secondCountNumber)
            
        }
    }
    
    @IBAction func secondPlusButton(_ sender: Any) {
        if secondCountNumber < 9 {
            secondCountNumber+=1
            secondCountLabel.text = String(secondCountNumber)
        } else {return}
    }
    
    
    
}
