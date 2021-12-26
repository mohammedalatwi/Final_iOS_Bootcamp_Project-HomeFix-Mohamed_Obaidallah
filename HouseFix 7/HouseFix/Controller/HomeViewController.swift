//
//  ViewController.swift
//  HouseFix
//
//  Created by محمد العطوي on 08/05/1443 AH.
//

import UIKit

class HomeViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout{
  
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var arrProductImge = [UIImage(named: "H2")!,
                        UIImage(named: "H11")!,
                        UIImage(named: "H13")!,
                        UIImage(named: "H3")!,
                        UIImage(named: "H12")!,
                        UIImage(named: "H10")!]
  
  var timer : Timer?
  var currnetCellIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    startTimer()
    
  }
  // MARK: Move Images
  
  func startTimer()  {
    timer = Timer.scheduledTimer(timeInterval: 2.5,
                                 target: self,
                                 selector: #selector(nextImage),
                                 userInfo: nil,
                                 repeats: true)
  }
  
  
  @objc func nextImage(){
    
    if currnetCellIndex < arrProductImge.count - 1 {
      currnetCellIndex += 1
    }else{
      currnetCellIndex = 0
    }
    
    collectionView.scrollToItem(at: IndexPath(item: currnetCellIndex, section: 0), at: .centeredHorizontally, animated: true)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return arrProductImge.count
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell =
      collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCellCollection
    
    cell.imgCollection.image = arrProductImge[indexPath.row]
    
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width,
                  height: collectionView.frame.height)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "shopElectrical":
      if let vc = segue.destination as? SectionsControl {
        var arrayNew:[Shops] = [Shops]()
        array.forEach { Shops in
          if Shops.type == .Electrical {
          arrayNew.append(Shops)
          }
        }
        vc.arrayShop = arrayNew
      }
    case "shopPlumber":
      if let vc = segue.destination as? SectionsControl {
        var arrayNew:[Shops] = [Shops]()
        array.forEach { Shops in
          if Shops.type == .Plumber {
          arrayNew.append(Shops)
          }
        }
        vc.arrayShop = arrayNew
      }
    case "shopDyeing":
      if let vc = segue.destination as? SectionsControl {
        var arrayNew:[Shops] = [Shops]()
        array.forEach { Shops in
          if Shops.type == .Dyeing {
          arrayNew.append(Shops)
          }
        }
        vc.arrayShop = arrayNew
      }
    case "shopBuilding":
      if let vc = segue.destination as? SectionsControl {
        var arrayNew:[Shops] = [Shops]()
        array.forEach { Shops in
          if Shops.type == .Building {
          arrayNew.append(Shops)
          }
        }
        vc.arrayShop = arrayNew
      }
    default:
      print("ss")
    }
  }
  
}
