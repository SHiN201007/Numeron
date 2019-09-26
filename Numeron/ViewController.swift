//
//  ViewController.swift
//  Numeron
//
//  Created by 松丸真 on 2019/08/11.
//  Copyright © 2019 松丸真. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var EatLabel: UILabel!
    @IBOutlet weak var BiteLabel: UILabel!
    @IBOutlet weak var ansAText: UITextField!
    @IBOutlet weak var ansBText: UITextField!
    @IBOutlet weak var ansCText: UITextField!
    
    var eat = 0
    var bite = 0
    //    botのカードの数値をランダムにきめる
    let numA = arc4random_uniform(10)
    let numB = arc4random_uniform(10)
    let numC = arc4random_uniform(10)
  
  override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      ansAText.delegate = self
      ansBText.delegate = self
      ansCText.delegate = self
  }
  
  
    // キーボードを閉じる
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    ansAText.resignFirstResponder()
    ansBText.resignFirstResponder()
    ansCText.resignFirstResponder()

    return true
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    ansAText.resignFirstResponder()
    ansBText.resignFirstResponder()
    ansCText.resignFirstResponder()
  }

  @IBAction func judgeButton(_ sender: Any) {
    print(numA)
    print(numB)
    print(numC)
    //    TextField の数字をInt型に変更
    let ansA = Int(ansAText.text!)!
    let ansB = Int(ansBText.text!)!
    let ansC = Int(ansCText.text!)!
    
    //Aがあっているとき
    if numA == ansA {
        eat += 1
        //Aがあってるとき
        //BがCにあって　かつ　CがBにあるか
        if numB == ansC{
            bite += 1
            if numC == ansB{
                bite += 1
            }
        }
//            CがBにあって　かつ　BがCにあるか
        else if numC == ansB{
            eat += 1
            bite += 1
            if numB == ansC{
                bite += 1
            }
        }
    }
    
//        Bがあっているとき
    if numB == ansB {
        eat += 1
//            Bがあってるとき
//            AがCにあって　かつ　CがAにあるか
        if numA == ansC{
            bite += 1
            if numC == ansA{
                bite += 1
            }
        }
//            CがAにあって　かつ　AがCにあるか
        else if numC == ansA{
            bite += 1
            if numA == ansC{
                bite += 1
            }
        }
    }
    
//        Cがあっているとき
    if numC == ansC {
        eat += 1
//            Cがあってるとき
//            AがBにあって　かつ　BがAにあるか
        if numA == ansB{
            bite += 1
            if numB == ansC{
                bite += 1
            }
        }
//            BがAにあって　かつ　AがBにあるか
        else if numB == ansA{
            bite += 1
            if numA == ansB{
                bite += 1
            }
        }
    }
    
//        0eatの時
    if numA != ansA && numB != ansB && numC != ansC {
//        A -> B -> C
        if numA == ansB{
            bite += 1
            if numA == ansC{
                bite += 1
            }
        }
//        A -> C -> B
        if numA == ansC{
            bite += 1
            if numA == ansB{
                bite += 1
            }
        }
//        B -> A -> C
        if numB == ansA{
            bite += 1
            if numB == ansC{
                bite += 1
            }
        }
//        B -> C -> A
        if numB == ansC {
            bite += 1
            if numB == ansA{
                bite += 1
            }
        }
//        C -> A -> B
        if numC == ansA{
            bite += 1
            if numC == ansB{
                bite += 1
            }
        }
//        C -> B -> A
        if numC == ansB{
            bite += 1
            if numC == ansA{
                bite += 1
            }
        }
    }
    
    
    
    EatLabel.text = "\(eat)EAT"
    BiteLabel.text = "\(bite)BITE"
    
    if eat == 3{
        BiteLabel.text = "正解です！"
    }
    ansAText.text = ""
    ansBText.text = ""
    ansCText.text = ""
    
    eat = 0
    bite = 0
  }
  
  func correctedA() {
    
  }
}

