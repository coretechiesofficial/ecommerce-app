// For demo only
import 'package:shop/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final String price;
  final String? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image: productDemoImg1,
    title: "Mountain Warehouse for Women",
    brandName: "Lipsy london",
    price: "540",
    priceAfetDiscount: "420",
    dicountpercent: 20,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: "800",
  ),
  ProductModel(
    image: productDemoImg5,
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Lipsy london",
    price: "650.62",
    priceAfetDiscount: "390.36",
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: "1264",
    priceAfetDiscount: "1200.8",
    dicountpercent: 5,
  ),
  ProductModel(
    image: "https://i.imgur.com/tXyOMMG.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: "650.62",
    priceAfetDiscount: "390.36",
    dicountpercent: 40,
  ),
  ProductModel(
    image: "https://i.imgur.com/h2LqppX.png",
    title: "white satin corset top",
    brandName: "Lipsy london",
    price: "1264",
    priceAfetDiscount: "1200.8",
    dicountpercent: 5,
  ),
];
List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image:
        "https://image.similarpng.com/very-thumbnail/2021/12/Brown-teddy-bear-and-toys-on-transparent-background-PNG.png",
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Lipsy london",
    price: "650.62",
    priceAfetDiscount: "390.36",
    // dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://png.pngtree.com/png-vector/20201129/ourmid/pngtree-plush-toys-png-image_2435538.jpg",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: "1264",
    priceAfetDiscount: "1200.8",
    // dicountpercent: 5,
  ),
  ProductModel(
    image:
        "https://png.pngtree.com/element_our/png/20181130/isometric-kid-object-3d-rendering-png_256038.jpg",
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: "800",
    priceAfetDiscount: "680",
    // dicountpercent: 15,
  ),
];
List<ProductModel> demoBundlesProduct = [
  ProductModel(
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVy-gX5FviWD5auO13YbxxJtAhVB8b3-hbTQ&usqp=CAU",
    title: "FS - PJ Mask Transporter",
    brandName: "",
    price: "650.62",
    priceAfetDiscount: "390.36",
    // dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://e7.pngegg.com/pngimages/887/170/png-clipart-toy-block-educational-toys-montessori-education-kids-montessori-world-toy-game-child.png",
    title: "L.O.L Surprise Bundle",
    brandName: "",
    price: "1264",
    priceAfetDiscount: "1200.8",
    // dicountpercent: 5,
  ),
  ProductModel(
    image:
        "https://toppng.com/uploads/preview/toy-story-imagem-toy-story-11562893951xeyupdld1o.png",
    title: "Gift Bundle Ninja For Baby",
    brandName: "",
    price: "800",
    priceAfetDiscount: "680",
    // dicountpercent: 15,
  ),
  ProductModel(
    image:
        "https://image.similarpng.com/very-thumbnail/2021/12/Brown-teddy-bear-and-toys-on-transparent-background-PNG.png",
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Lipsy london",
    price: "650.62",
    priceAfetDiscount: "390.36",
    // dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://png.pngtree.com/png-vector/20201129/ourmid/pngtree-plush-toys-png-image_2435538.jpg",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: "1264",
    priceAfetDiscount: "1200.8",
    // dicountpercent: 5,
  ),
  ProductModel(
    image:
        "https://png.pngtree.com/element_our/png/20181130/isometric-kid-object-3d-rendering-png_256038.jpg",
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: "800",
    priceAfetDiscount: "680",
    // dicountpercent: 15,
  ),
  ProductModel(
    image:
        "https://banner2.cleanpng.com/20180613/vxz/kisspng-stock-photography-toy-royalty-free-child-baby-wood-toy-5b20b1414a6496.5218573815288691853047.jpg",
    title: "FS - PJ Mask Transporter",
    brandName: "",
    price: "650.62",
    priceAfetDiscount: "390.36",
    // dicountpercent: 40,
  ),
  ProductModel(
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy1ks4Ap0CCpcdqMJxzyM3fhoy3DBHWIk-yQ&usqp=CAU",
    title: "L.O.L Surprise Bundle",
    brandName: "",
    price: "1264",
    priceAfetDiscount: "1200.8",
    // dicountpercent: 5,
  ),
  ProductModel(
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC2UDaJiSHsZuZgmg78p1WuYwrCXOEHt65_ZyriDlJnlhDWYY5-ExKI-VEK3k-ni4Nx_Y&usqp=CAU",
    title: "Gift Bundle Ninja For Baby",
    brandName: "",
    price: "800",
    priceAfetDiscount: "680",
    // dicountpercent: 15,
  ),
  ProductModel(
    image:
        "https://png.pngtree.com/element_our/png/20181113/isometric-kid-toy-png_236063.jpg",
    title: "Gift Teddy Bear To Surprise Baby",
    brandName: "",
    price: "800",
    priceAfetDiscount: "680",
    // dicountpercent: 15,
  ),
];
List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image: "https://i.imgur.com/tXyOMMG.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: "650.62",
    priceAfetDiscount: "390.36",
    dicountpercent: 40,
  ),
  ProductModel(
    image: "https://i.imgur.com/h2LqppX.png",
    title: "white satin corset top",
    brandName: "Lipsy london",
    price: "1264",
    priceAfetDiscount: "1200.8",
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: "800",
    priceAfetDiscount: "680",
    dicountpercent: 15,
  ),
];
List<ProductModel> kidsProducts = [
  /* ProductModel(
    image: "https://i.imgur.com/dbbT6PA.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: "650.62",
    priceAfetDiscount: "590.36",
    dicountpercent: 24,
  ),
  ProductModel(
    image: "https://i.imgur.com/7fSxC7k.png",
    title: "Printed Sleeveless Tiered Swing Dress",
    brandName: "Lipsy london",
    price: "650.62",
  ),
  ProductModel(
    image: "https://i.imgur.com/pXnYE9Q.png",
    title: "Ruffle-Sleeve Ponte-Knit Sheath ",
    brandName: "Lipsy london",
    price: "400",
  ),
  ProductModel(
    image: "https://i.imgur.com/V1MXgfa.png",
    title: "Green Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: "400",
    priceAfetDiscount: "360",
    dicountpercent: 20,
  ),
  ProductModel(
    image: "https://i.imgur.com/8gvE5Ss.png",
    title: "Printed Sleeveless Tiered Swing Dress",
    brandName: "Lipsy london",
    price: "654",
  ),
  ProductModel(
    image: "https://i.imgur.com/cBvB5YB.png",
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: "250",
  ),
];*/
];
