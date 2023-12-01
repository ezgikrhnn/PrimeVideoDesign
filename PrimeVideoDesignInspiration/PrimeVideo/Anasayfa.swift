//
//  ViewController.swift
//  PrimeVideo
//
//  Created by Ezgi Karahan on 10.11.2023.
//

import UIKit

class Anasayfa: UIViewController {

    //MARK: CollectionView
    @IBOutlet weak var anaSliderCollectionView: UICollectionView!
    
    @IBOutlet weak var altyazililarCollectionView: UICollectionView!
    
    @IBOutlet weak var AmazonOrijinalCollectionView: AmazonOrijinallerHucre!
    @IBOutlet weak var OnerilenDiziCollectionView: UICollectionView!
    @IBOutlet weak var TurkiyeIlk10CollectionView: UICollectionView!
    
    
    var filmDiziListesi = [FilmlerveDiziler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //anacollectionView bağlama
        anaSliderCollectionView.delegate = self
        anaSliderCollectionView.dataSource = self
        
      
        
        let df1 = FilmlerveDiziler(id: 1, resimAd: "imageAmericanDad")
        let df2 = FilmlerveDiziler(id: 2, resimAd: "imageAvengers")
        let df3 = FilmlerveDiziler(id: 3, resimAd: "imageB99")
        let df4 = FilmlerveDiziler(id: 4, resimAd: "imageBobsBurger")
        let df5 = FilmlerveDiziler(id: 5, resimAd: "imageCarnivalRow")
        let df6 = FilmlerveDiziler(id: 6, resimAd: "imageDay")
        let df7 = FilmlerveDiziler(id: 7, resimAd: "imageFamilyGuy")
        let df8 = FilmlerveDiziler(id: 8, resimAd: "imageFatherStu")
        let df9 = FilmlerveDiziler(id: 9, resimAd: "imageFightClub")
        let df10 = FilmlerveDiziler(id: 10, resimAd: "imageFriends")
        let df11 = FilmlerveDiziler(id: 11, resimAd: "imageGameOfThrones")
        let df12 = FilmlerveDiziler(id: 12, resimAd: "imageGoodOmens2")
        let df13 = FilmlerveDiziler(id: 13, resimAd: "imageHimym")
        let df14 = FilmlerveDiziler(id: 14, resimAd: "imageHoneyMoon")
        let df15 = FilmlerveDiziler(id: 15, resimAd: "imageIronMan")
        let df16 = FilmlerveDiziler(id: 16, resimAd: "imageJackRyan")
        let df17 = FilmlerveDiziler(id: 17, resimAd: "imagePerfectAddiction")
        let df18 = FilmlerveDiziler(id: 18, resimAd: "imagePsycho")
        let df19 = FilmlerveDiziler(id: 19, resimAd: "imageSuperNatural")
        let df20 = FilmlerveDiziler(id: 20, resimAd: "imageTed")
        let df21 = FilmlerveDiziler(id: 21, resimAd: "imageTheHouse")
        let df22 = FilmlerveDiziler(id: 22, resimAd: "imageTheOffice")
        let df23 = FilmlerveDiziler(id: 23, resimAd: "imageTheSimpsons")
        let df24 = FilmlerveDiziler(id: 24, resimAd: "imageTheTest")
        let df25 = FilmlerveDiziler(id: 25, resimAd: "imageTheWheelOfTime")
        let df26 = FilmlerveDiziler(id: 26, resimAd: "imageTheWolfOfWallStreet")
        let df27 = FilmlerveDiziler(id: 27, resimAd: "imageTheWildCat")
        filmDiziListesi.append(df1)
        filmDiziListesi.append(df2)
        filmDiziListesi.append(df3)
        filmDiziListesi.append(df4)
        filmDiziListesi.append(df5)
        filmDiziListesi.append(df6)
        filmDiziListesi.append(df7)
        filmDiziListesi.append(df8)
        filmDiziListesi.append(df9)
        filmDiziListesi.append(df10)
        filmDiziListesi.append(df11)
        filmDiziListesi.append(df12)
        filmDiziListesi.append(df13)
        filmDiziListesi.append(df14)
        filmDiziListesi.append(df15)
        filmDiziListesi.append(df16)
        filmDiziListesi.append(df17)
        filmDiziListesi.append(df18)
        filmDiziListesi.append(df19)
        filmDiziListesi.append(df20)
        filmDiziListesi.append(df21)
        filmDiziListesi.append(df22)
        filmDiziListesi.append(df23)
        filmDiziListesi.append(df24)
        filmDiziListesi.append(df25)
        filmDiziListesi.append(df26)
        filmDiziListesi.append(df27)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tasarim.minimumInteritemSpacing = 5 ///öğeler arasındaki en küçük yatay boşluğu belirler.
        tasarim.minimumLineSpacing = 5 ///hücreler arasındaki en küçük dikey boşluğu belirler
        
        tasarim.scrollDirection = .horizontal

        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = ekranGenislik - 10
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*0.7)
        anaSliderCollectionView.collectionViewLayout = tasarim
        
    }
}

extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource {
    
    //GEREKLİ OLAN 2 FONKSİYONU ALIYORUM.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmDiziListesi.count ///listemin boyutu kadar eleman göstersin
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let diziFilm = filmDiziListesi[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "imageSliderHucre", for: indexPath) as! GenelResimlerHucre
        
        hucre.imageViewGenelResimler.image = UIImage(named: diziFilm.resimAd!) ///bu adımı yapmazsam resimleri gözlemleyemem.
        
        ///resimlerin etrafına border koymak istiyorum.
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 3.0
        return hucre
    }
    }


