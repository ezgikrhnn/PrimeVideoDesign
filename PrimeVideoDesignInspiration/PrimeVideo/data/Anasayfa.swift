//
//  Anasayfa.swift
//  PrimeVideo
//
//  Created by Ezgi Karahan on 24.11.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    //MARK: CollectionView
    
    @IBOutlet weak var pageDots: UIPageControl!
    
    @IBOutlet weak var eklentiView: UIView!
    
    @IBOutlet weak var anasayfaScrollView: UIScrollView!
    
    @IBOutlet weak var genelresimlerCollectionView: UICollectionView!
  
    @IBOutlet weak var altyazililarCollectionView: UICollectionView!
    @IBOutlet weak var onerilendiziCollectionView: UICollectionView!
   
    
    @IBOutlet weak var turkiyeIlk10CollectionView: UICollectionView!
    var genelresimlerListe = ["imageAvengers","imageB99","imageBobsBurger","imageDay","imageFamilyGuy", "imageFatherStu","imageFriends", "imageGameOfThrones","imageGoodOmens2", "imageHimym", "imageHoneyMoon","imageIronMan", "imageJackRyan","imagePerfectAddiction","imagePsycho", "imageSuperNatural","imageTed","imageTheHouse","imageTheHouse","imageTheOffice","imageTheSimpsons","imageTheTest","imageTheWheelOfTime"]
    
    var altyazililarListe = ["imageAmericanDad","imageAvengers","imageB99","imageBobsBurger","imageDay","imageFamilyGuy", "imageFatherStu","imageFriends", "imageGameOfThrones","imageGoodOmens2", "imageHimym", "imageHoneyMoon","imageIronMan", "imageJackRyan","imagePerfectAddiction","imagePsycho", "imageSuperNatural","imageTed","imageTheHouse","imageTheOffice","imageTheSimpsons","imageTheTest","imageTheWheelOfTime","imageTheWolfOfWallStreet","imageTheWildCat"]
    
    var onerilendizilerListe = ["imageB99","imageFriends", "imageGameOfThrones", "imageHimym","imageIronMan", "imageJackRyan", "imageSuperNatural","imageTheOffice","imageTheSimpsons","imageTheTest"]
    
    var turkiyeIlk10Liste = ["imageTheWheelOfTime","imageFriends","imageAvengers", "imageHimym","imageIronMan", "imageJackRyan", "imageSuperNatural","imageGameOfThrones","imageTheOffice","imageTheTest"]
    
   // var currentPage:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageDots.currentPage = 0
        pageDots.numberOfPages = genelresimlerListe.count
        
        altyazililarCollectionView.delegate = self
        altyazililarCollectionView.dataSource = self
        onerilendiziCollectionView.delegate = self
        onerilendiziCollectionView.dataSource = self
        genelresimlerCollectionView.delegate = self
        genelresimlerCollectionView.dataSource = self
        turkiyeIlk10CollectionView.delegate = self
        turkiyeIlk10CollectionView.dataSource = self

        
    //MARK: LİSTELER
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tasarim.minimumInteritemSpacing = 0 ///öğeler arasındaki en küçük yatay boşluğu belirler.
        tasarim.scrollDirection = .horizontal ///bu kod olmadan autolayout içinde kaydırma yapmıyor.
        

        
        // let ekranGenislik = UIScreen.main.bounds.width
        //let itemGenislik = (ekranGenislik - 50) / 4
        
        let ekranYukseklik = UIScreen.main.bounds.height
        let itemYukseklik = (ekranYukseklik) / 8
        
        tasarim.itemSize = CGSize(width: itemYukseklik*1.5, height: itemYukseklik)
        altyazililarCollectionView.collectionViewLayout = tasarim
        onerilendiziCollectionView.collectionViewLayout = tasarim
        turkiyeIlk10CollectionView.collectionViewLayout = tasarim
       
        /**let tasarimGenelResimler = UICollectionViewFlowLayout()
        tasarimGenelResimler.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tasarimGenelResimler.minimumInteritemSpacing = 0 ///öğeler arasındaki en küçük yatay boşluğu belirler.
        tasarimGenelResimler.scrollDirection = .horizontal ///bu kod olmadan autolayout içinde kaydırma yapmıyor.
        
        let ekranYukseklikGenel = UIScreen.main.bounds.height
        let itemYukseklikGenel = ekranYukseklikGenel
        tasarimGenelResimler.itemSize = CGSize(width: itemYukseklikGenel, height: itemYukseklikGenel*1.5)
        genelresimlerCollectionView.collectionViewLayout = tasarimGenelResimler**/
        let tasarimGenel = UICollectionViewFlowLayout()
        
        tasarimGenel.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        
        tasarimGenel.minimumLineSpacing = 0
        tasarimGenel.minimumInteritemSpacing = 0
        tasarimGenel.scrollDirection = .horizontal
        
        let itemYukseklikGenel = ekranYukseklik / 5
        
        tasarimGenel.itemSize = CGSize(width: 393, height: itemYukseklikGenel*1.3)
        genelresimlerCollectionView.collectionViewLayout = tasarimGenel
       
        
    }
    
    // This code for scroll view
    // Scroll view doesnt scroll without this code
    override func viewWillLayoutSubviews(){
    super.viewWillLayoutSubviews()
        let ekranYukseklik = UIScreen.main.bounds.height
    anasayfaScrollView.contentSize = CGSize(width: 393, height: ekranYukseklik)
   
    }
    
    //Pagedots geçişi için:
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageDots.currentPage = indexPath.row
    }
    
    
    
    
}
 
    
extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource {
    
    //GEREKLİ OLAN 2 FONKSİYONU ALIYORUM.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == altyazililarCollectionView {
            return altyazililarListe.count
        }else if collectionView == onerilendiziCollectionView {
            return onerilendizilerListe.count
        }else if collectionView == genelresimlerCollectionView {
            return genelresimlerListe.count
        }else if collectionView == turkiyeIlk10CollectionView{
            return turkiyeIlk10Liste.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == altyazililarCollectionView {
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "altyazililarHucre", for: indexPath) as! AltyazililarHucre
            
            hucre.imageViewAltyazililar.image = UIImage(named: altyazililarListe[indexPath.row]) ///bu adımı yapmazsam resimleri gözlemleyemem.
            
            ///resimlerin etrafına border koymak istiyorum.
            hucre.layer.borderColor = UIColor.lightGray.cgColor
            hucre.layer.borderWidth = 0.3
            hucre.layer.cornerRadius = 3.0
            return hucre
        }
        else if collectionView == onerilendiziCollectionView {
                let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "onerilendiziHucre", for: indexPath) as! OnerilenDiziHucre
                
                hucre.imageViewOnerilendiziler.image = UIImage(named: onerilendizilerListe[indexPath.row]) ///bu adımı yapmazsam resimleri gözlemleyemem.
                
                ///resimlerin etrafına border koymak istiyorum.
                hucre.layer.borderColor = UIColor.lightGray.cgColor
                hucre.layer.borderWidth = 0.3
                hucre.layer.cornerRadius = 3.0
                return hucre
        }
        else if collectionView == genelresimlerCollectionView{
                let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "genelresimlerHucre", for: indexPath) as! GenelResimlerHucre
                
                hucre.imageVievGenelresimler.image = UIImage(named: genelresimlerListe[indexPath.row]) ///bu adımı yapmazsam resimleri gözlemleyemem.
                
                ///resimlerin etrafına border koymak istiyorum.
                hucre.layer.borderColor = UIColor.lightGray.cgColor
                hucre.layer.borderWidth = 0.3
                hucre.layer.cornerRadius = 3.0
                return hucre
        }
        else if collectionView == turkiyeIlk10CollectionView{
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "turkiyeilk10Hucre", for: indexPath) as! TurkiyeIlk10Hucre
            
            hucre.imageViewTurkiyeIlk10.image = UIImage(named: turkiyeIlk10Liste[indexPath.row]) ///bu adımı yapmazsam resimleri gözlemleyemem.
            
            ///resimlerin etrafına border koymak istiyorum.
            hucre.layer.borderColor = UIColor.lightGray.cgColor
            hucre.layer.borderWidth = 0.3
            hucre.layer.cornerRadius = 3.0
            return hucre
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == genelresimlerCollectionView {
            return CGSize(width: 393, height: 300)
        } else if collectionView == altyazililarCollectionView {
            return CGSize(width: 393, height: 135)
        } else if collectionView == onerilendiziCollectionView {
            return CGSize(width: 393, height: 135)
        }else if collectionView == turkiyeIlk10CollectionView {
            return CGSize(width: 393, height: 135)
        }
        
        return CGSize.zero
    }
    
    
    
}


