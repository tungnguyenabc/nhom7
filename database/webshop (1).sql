-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 25, 2020 lúc 03:09 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Goo', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647),
(2, 'hieu', 'mod@gmail.com', '123', 1, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Sản phẩm', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2017-04-22 05:37:02'),
(7, 'Whey protein', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Sữa tăng cân', '', 1, 2, '2017-04-22 05:37:36'),
(9, 'Vitamin, khoáng', '', 1, 3, '2017-04-22 05:37:50'),
(10, 'Whey Protein Blend', '', 7, 1, '2017-04-22 09:08:19'),
(11, 'Whey Protein Isolate', '', 7, 2, '2017-04-22 09:08:36'),
(12, 'Whey Hydrolyzed', '', 7, 3, '2017-04-22 09:09:01'),
(13, 'Casein Protein', '', 7, 4, '2017-04-22 09:09:14'),
(14, 'Meal Replacement', '', 7, 5, '2017-04-22 09:09:31'),
(15, 'Tăng cân nhanh', '', 8, 1, '2017-04-22 09:09:46'),
(16, 'Tăng cân nạc ít mỡ', '', 8, 2, '2017-04-22 09:10:10'),
(19, 'Vitamin\r\n', '', 9, 1, '2017-04-22 09:25:55'),
(20, 'Tăng Testosterone', '', 9, 2, '2017-04-22 09:26:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(1, 3, 12, 1, '360000.00', 0),
(3, 4, 7, 1, '350000.00', 0),
(12, 9, 4, 1, '200000.00', 0),
(13, 10, 17, 1, '450000.00', 0),
(6, 5, 23, 1, '370000.00', 0),
(7, 6, 28, 1, '169000.00', 0),
(8, 6, 25, 1, '300000.00', 0),
(11, 8, 10, 1, '69000.00', 0),
(10, 7, 11, 1, '70000.00', 0),
(14, 11, 25, 1, '300000.00', 0),
(15, 12, 28, 1, '169000.00', 0),
(16, 13, 85, 1, '350000.00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(83, 19, 'Nutricost Astaxanthin 120 servings', '<p><em>Nutricost Astaxanthin l&agrave; một sự lựa chọn ho&agrave;n hảo d&agrave;nh cho những người bận rộn nhưng vẫn muốn tăng cường khả năng chống oxi h&oacute;a v&agrave; chăm s&oacute;c sức khỏe một c&aacute;ch to&agrave;n diện.</em></p>\r\n', '990000.00', 0, 'upl_nutricost_astaxanthin_-_120_servings_1602065295_image_1602065295.jpg', '[]', 1, 0, 4, 1, 1608190147),
(86, 19, 'Alive Men Energy 50 viên', '<p><em>Vitamin tổng hợp Alive Men&#39;s Energy bổ sung 20 loại vitamin v&agrave; kho&aacute;ng chất thiết yếu cho cơ thể, tăng cường năng lượng v&agrave; tăng khả năng hấp thu của cơ thể.</em></p>\r\n', '350000.00', 50000, '209_image_catalog_alive_men_s_energy_50_vien_image_catalog_1587722858.jpg', '[]', 3, 0, 4, 1, 1608192020),
(85, 19, 'Bronson Vitamin K2 và D3 120 viên', '<p><em>Sản phẩm bổ sung vitamin v&agrave; kho&aacute;ng chất với c&ocirc;ng dụng ch&iacute;nh l&agrave; hấp thụ canxi gi&uacute;p cho hệ xương khớp lu&ocirc;n chắc khỏe.</em></p>\r\n', '350000.00', 0, '279_image_catalog_bronson_vitamin_k2___d3__120_vien__image_catalog_1587722937.jpg', '[]', 3, 0, 4, 1, 1608190246),
(73, 19, 'Mass Effect 13lbs 5.9kg dt', '<p><em>Mass Effect Revolution 13 lbs gi&uacute;p l&agrave;m post workout phục hồi cơ bắp v&agrave; thể lực ngay sau buổi tập hiệu quả, sửa chữa những tế b&agrave;o bị hư hại đ&acirc;y l&agrave; đồng h&oacute;a qua đ&oacute; gi&uacute;p cơ bắp chống lại dị h&oacute;a.</em></p>\r\n', '1590000.00', 0, 'upl_mass_effect_13lbs_5_9kg_1601450749_image_1601450749.jpg', '[]', 1, 0, 4, 1, 1608187492),
(74, 16, 'Mass Fusion 12lbs 5.4kg', '<p><em>Mass Fusion xứng đ&aacute;ng l&agrave; d&ograve;ng Mass CHẤT nhất thị trường hiện nay, ph&ugrave; hợp với người gầy muốn tăng c&acirc;n với nguồn năng lượng sạch để duy tr&igrave; c&acirc;n nặng v&agrave; hỗ trợ tăng cơ rất tốt.</em></p>\r\n', '1590000.00', 0, '85_image_catalog_mass_fusion_12lbs_5_4kg__phien_ban_moi__image_catalog_1587722738.jpg', '[]', 0, 0, 4, 1, 1608187578),
(75, 16, 'EliteLab Mass Muscle Gainer 10lbs', '<p><em>EliteLab Mass Muscle Gainer 10lbs l&agrave; sự lựa chọn tuyệt vời v&igrave; n&oacute; chứa tới hơn 20 loại th&agrave;nh phần khủng b&ecirc;n trong, trở th&agrave;nh loại sữa tăng c&acirc;n hiệu quả&nbsp;- chất lượng v&agrave; gi&aacute; trị nhất tr&ecirc;n thị trường.</em></p>\r\n', '2000000.00', 100000, '94_image_catalog_elitelab_mass_muscle_gainer_10lbs_image_catalog_1587722748.jpg', '[]', 0, 0, 4, 1, 1608187614),
(78, 20, 'AGGRO 168 viên', '<p><em>Aggro l&agrave; 1 sản phẩm c&oacute; chứa kẽm v&agrave; magie tăng h&oacute;c m&ocirc;n nam giới v&agrave; tăng sinh l&yacute; nam giới tuyệt vời nhất từ trước tới. Sản phẩm ch&iacute;nh h&atilde;ng n&agrave;y được WheyStore ph&acirc;n phối tr&ecirc;n to&agrave;n quốc.</em></p>\r\n', '890000.00', 0, '128_image_catalog_aggro_168_vien_image_catalog_1587722783.jpg', '[]', 0, 0, 4, 1, 1608189910),
(77, 16, 'Optimum Pro Gainer 5lbs', '<p><em>Optimum Pro Gainer bao gồm những Protein c&oacute; gi&aacute; trị sinh học cao, điều đ&oacute; c&oacute; nghĩa ch&uacute;ng dễ d&agrave;ng ti&ecirc;u h&oacute;a v&agrave; hấp thụ để x&acirc;y dựng cơ bắp v&agrave; tăng lượng cơ nạc nhanh ch&oacute;ng.</em></p>\r\n', '1250000.00', 0, '89_image_catalog_optimum_pro_gainer_5_08_lbs__2_31kg__image_catalog_15877227431.jpg', '[]', 0, 0, 4, 1, 1608187694),
(79, 20, 'Test HD 90 Viên', '<p><em>TEST HD&trade; được đặc chế với th&agrave;nh phần boron được chứng minh gi&uacute;p tăng test nhanh ch&oacute;ng trong v&ograve;ng 7 ng&agrave;y. H&oacute;c m&ocirc;n nam tự do l&agrave; th&agrave;nh phần hoạt t&iacute;nh cao nhất của Test, n&oacute; gi&uacute;p tăng tốc sự ph&aacute;t triển cơ bắp l&ecirc;n tối đa.</em></p>\r\n', '590000.00', 40000, '131_image_catalog_test_hd_90_vien_image_catalog_1587722787.jpg', '[]', 0, 0, 4, 1, 1608189940),
(80, 20, 'Men Performance Multi 50 viên', '<p><em>Men&#39;s Performance Multi tăng cường sức mạnh sinh l&yacute;, gi&uacute;p ph&aacute;i mạnh lu&ocirc;n giữ vững được phong độ đỉnh cao cả về thể chất lẫn tinh thần.</em></p>\r\n', '570000.00', 0, 'upl_men_s_performance_multi_-_50_vien_1596858974_image_1596858974.jpg', '[]', 1, 0, 4, 1, 1608189962),
(81, 19, 'Vitabolic 196 viên', '<p><em>Vitabolic ch&iacute;nh h&atilde;ng Nutrabolics kh&ocirc;ng chỉ bổ sung vitamin, kho&aacute;ng chất m&agrave; c&ograve;n c&oacute; những chất tăng cường hệ miễn dịch, tăng trao đổi chất, tăng cường năng lượng tự nhi&ecirc;n của cơ thể.</em></p>\r\n', '590000.00', 0, '127_image_catalog_vitabolic_196_vien_image_catalog_1587722782.jpg', '[]', 0, 0, 4, 1, 1608190091),
(82, 19, 'Platinum Multi Vitamin 90 viên', '<p><em>MuscleTech Platinum Multi vitamin chứa h&agrave;m lượng cao c&aacute;c loại Vitamin v&agrave; kho&aacute;ng chất chỉ trong mỗi 3 vi&ecirc;n chống Oxyho&aacute; cũng như hỗ trợ sức khoẻ tổng quan v&agrave; bạn sử dụng được đến 30 ng&agrave;y.</em></p>\r\n', '350000.00', 0, '173_image_catalog_muscletech_platinum_multi_vitamin_90_vien_image_catalog_1587722820.jpg', '[]', 1, 0, 4, 1, 1608190117),
(72, 15, 'Mutant Mass 15lbs 6.8kg', '<p><em>Mutant Mass 15lbs (6.8Kg)&nbsp;l&agrave; cuộc c&aacute;ch mạng về tăng cơ bắp v&agrave; c&acirc;n nặng. Cung cấp cho cơ thể bạn một loạt c&aacute;c chất dinh dưỡng, ph&ugrave; hợp cho những người muốn thay đổi c&acirc;n nặng.</em></p>\r\n', '1900000.00', 0, 'upl_mutant_mass_15lbs_6_8kg_1606535994_image_1606535994.jpg', '[]', 0, 0, 4, 1, 1608187464),
(61, 14, 'Lean Body MRP 80 gói', '<p><em>Lean Body MRP 80 g&oacute;i l&agrave; một bữa ăn th&ocirc;ng minh gi&uacute;p tăng cơ giảm mỡ cung cấp chất xơ c&ugrave;ng với nguồn protein dồi d&agrave;o cho người tập Gym H&agrave;ng. Tại WheyStore gi&aacute; tốt nhất - giao h&agrave;ng tận nh&agrave;.</em></p>\r\n', '4200000.00', 210000, 'upl_lean_body_mrp_80_goi_1600767546_image_1600767546.jpg', '[]', 1, 0, 4, 1, 1608186446),
(69, 15, 'Serious Mass 12lbs 5.44kg', '<p><em>Serious Mass l&agrave; sản phẩm hỗ trợ tăng c&acirc;n d&agrave;nh cho người gầy k&eacute;m ăn, vận động vi&ecirc;n, người chơi thể thao. Với vitamin v&agrave; kho&aacute;ng chất dễ d&agrave;ng hấp thụ sẽ gi&uacute;p cơ thể cải thiện c&acirc;n nặng.</em></p>\r\n', '1350000.00', 60000, 'upl_serious_mass_12lbs_5_44kg_1606899312_image_1606899312.jpg', '[]', 0, 0, 4, 1, 1608187270),
(67, 15, 'Labrada Muscle Mass 12lbs 5.4Kg', '<p><em>Muscle Mass Gainer 12Lbs l&agrave; d&ograve;ng sữa tăng c&acirc;n&nbsp;cho người gầy thiếu c&acirc;n, kh&oacute; hấp thụ, bởi chỉ với một lượng ph&ugrave; hợp được hấp thụ Mass Gainer l&agrave;m cơ thể dễ th&iacute;ch nghi, tăng c&acirc;n l&agrave;nh mạnh.</em></p>\r\n', '1550000.00', 0, '88_image_catalog_labrada_muscle_mass_12lbs_5_4kg_image_catalog_1587722741.jpg', '[]', 0, 0, 4, 1, 1608187148),
(68, 15, 'Dymatize Super Mass 5.4kg', '<p><em>Sữa tăng c&acirc;n Super Mass với th&agrave;nh phần nguy&ecirc;n liệu chất lượng cao v&agrave; nguồn dưỡng chất ti&ecirc;u chuẩn gi&uacute;p gia tăng tối đa sức mạnh v&agrave; k&iacute;ch thước cơ bắp - bảo vệ cơ bắp khỏi qu&aacute; tr&igrave;nh dị h&oacute;a.</em></p>\r\n', '1350000.00', 60000, 'upl_dymatize_super_mass_5_4kg_1606898880_image_1606898880.jpg', '[]', 0, 0, 4, 1, 1608187238),
(64, 14, 'Protein Brownie Bar  Vị Chocolate', '<p><em>Protein Brownie Bar với h&agrave;m lượng protein cực cao c&ugrave;ng m&ugrave;i vị chocolate thơm ngon l&agrave; bữa ăn phụ đạt chuẩn chất lượng trong thực đơn của c&aacute;c gymer.</em></p>\r\n', '60000.00', 0, 'upl_protein_brownie_bar_-_vi_chocolate_1600328700_image_1600328700.jpg', '[\"upl_protein_brownie_bar_-_vi_chocolate_1600328700_image_1600328701.jpg\"]', 1, 0, 4, 1, 1608186569),
(65, 14, 'One Bar Protein', '<p>Nhu cầu bổ sung protein của gymer ng&agrave;y c&agrave;ng mở rộng, đ&ograve;i hỏi thị trường phải li&ecirc;n tục đổi mới v&agrave; cải tiến để đ&aacute;p ứng nhu cầu sử dụng.&nbsp;<a href=\"https://www.wheystore.vn/c152/whey-protein-tang-co\">Whey Protein</a>&nbsp;tuy tiện dụng nhưng chưa phải l&agrave; loại tiện nhất đ&acirc;u bạn nh&eacute;! Wheystore muốn giới thiệu đến bạn ONE BARS - Thanh b&aacute;nh bổ sung protein thơm ngon, gi&agrave;u dưỡng chất nhất hiện nay.</p>\r\n', '750000.00', 0, 'upl_one_bar_protein_1607592711_image_16075927111.jpg', '[]', 1, 0, 4, 1, 1608186669),
(66, 14, 'Lean Body dạng gói 79g', '<p><em>Lean Body 2,78 OZ 79g l&agrave; một bữa ăn th&ocirc;ng minh hỗ trợ cho người tập thể h&igrave;nh - Gym tăng cơ, giảm mỡ với h&agrave;m lượng protein cao. Th&agrave;nh phần ch&iacute;nh, c&aacute;ch d&ugrave;ng Lean Body?</em></p>\r\n', '55000.00', 0, '61_image_catalog_lablara_lean_body_2_78_oz__79g__image_catalog_15877227141.jpg', '[]', 1, 0, 4, 1, 1608186718),
(70, 15, 'Mass Tech 2000 22lbs 10kg', '<p><em>Mass Tech Extreme 2000 loại 22lbs 10kg ho&agrave;n to&agrave;n c&oacute; thể được gọi l&agrave; sản phẩm cao cấp nhất, v&igrave; qu&aacute; đầy đủ dưỡng chất v&agrave; c&aacute;c đơn chất gi&uacute;p ph&aacute;t triển cơ bắp v&agrave; chống dị h&oacute;a cơ bắp.</em></p>\r\n', '2500000.00', 310000, '96_image_catalog_mass_tech_2000_loai_22lbs_10kg_image_catalog_1587722750.jpg', '[]', 0, 0, 4, 1, 1608187311),
(71, 15, 'Premium Mass Gainer 5,44kg', '<p><em>Muscletech Premium Mass Gainer cung cấp 1260 Calories, 53g Protein chất lượng cao v&agrave; rất nhiều vitamin &amp; kho&aacute;ng chất gi&uacute;p cơ thể bạn tăng c&acirc;n nhanh, x&acirc;y dựng sức mạnh v&agrave; cơ bắp.</em></p>\r\n', '1400000.00', 100000, '90_image_catalog_premium_mass_gainer_5_44kg_image_catalog_1587722744.jpg', '[]', 1, 0, 4, 1, 1608187351),
(50, 10, 'Whey Gold Standard 5lbs 2.27kg', '<p><em>Whey Gold Standard 5Lbs (2.27KG) l&agrave; sản phẩm sữa thể h&igrave;nh đem lại nguồn dinh dưỡng cao gi&uacute;p tăng cường cơ bắp cho người tập thể h&igrave;nh, vận động vi&ecirc;n v&agrave; người tập luyện thể thao.</em></p>\r\n', '1450000.00', 50000, 'upl_whey_gold_standard_5lbs_2_27kg_1601517258_image_1601517258.jpg', '[]', 0, 0, 4, 1, 1608185074),
(51, 10, 'Nitrotech 4lbs 1.8kg', '<p><em>Nitro-Tech&reg; cung cấp h&agrave;m lượng protein thiết yếu tinh chiết từ whey protein isolate kết hợp với th&agrave;nh phần creation chất lượng nhất nhằm đảm bảo sự ph&aacute;t triển tối ưu của c&aacute;c m&uacute;i cơ v&agrave; sức khỏe người sử dụng.</em></p>\r\n', '1290000.00', 90000, '55_image_catalog_muscletech_nitrotech_4_lbs__1_8kg__image_catalog_1587722706.jpg', '[]', 1, 0, 4, 1, 1608185133),
(52, 10, 'Whey Gold Standard 2lbs 900g', '<p><em>Whey Gold Standard 2Lbs (900G) đem lại cho bạn lượng Whey protein thuần t&uacute;y, kh&ocirc;ng pha trộn, đem đến cho bạn việc ph&aacute;t triển cơ bắp một c&aacute;ch hiệu quả nhất cho qu&aacute; tr&igrave;nh tập luyện!</em></p>\r\n', '800000.00', 10000, '56_image_catalog_whey_gold_standard_2lbs__900g__image_catalog_1587722708.jpg', '[]', 1, 0, 4, 1, 1608185208),
(53, 11, 'ISO HD 5lbs Isolate', '<p><em>ISO HD l&agrave; protein calo thấp, tinh khiết nhất cung cấp 25 gram Protein si&ecirc;u cao cấp 100% Whey Protein Isolate mỗi khẩu phần. Với c&ocirc;ng nghệ ti&ecirc;n tiến hương vị sữa của bạn đ&atilde; trở n&ecirc;n ngon hơn rất nhiều.</em></p>\r\n', '1250000.00', 100000, 'upl_iso_hd_5lbs_100__isolate_1607674037_image_1607674037.jpg', '[]', 0, 0, 4, 1, 1608185436),
(54, 11, 'On Isolate 5lbs 2.27kg', '<p><em>Nếu như Whey Protein đứng đầu về nguồn cung cấp protein th&igrave; Whey Protein Isolate l&agrave; số 1 trong c&aacute;c loại whey protein. On Isolate 5lbs l&agrave; sản phẩm tinh khiết hỗ trợ tăng cơ cho người tập Gym.</em></p>\r\n', '1750000.00', 100000, '184_image_catalog_on_isolate_5lbs_2_27kg_image_catalog_1587722831.jpg', '[]', 0, 0, 4, 1, 1608185485),
(55, 11, 'Xtend Pro Whey Isolate 5lbs', '<p><em>Xtend Pro Whey Isolate cung cấp nguồn Whey Protein chất lượng cao, si&ecirc;u tinh khiết, đồng thời tăng cường th&ecirc;m BCAA gi&uacute;p cơ bắp nạc ph&aacute;t triển, tăng trưởng vượt trội v&agrave; phục hồi nhanh, chống dị h&oacute;a cơ tối đa.</em></p>\r\n', '1500000.00', 50000, '356_image_catalog_xtend_pro_whey_isolate_5lbs_image_catalog_1587723017.jpg', '[]', 0, 0, 4, 1, 1608185540),
(56, 12, 'Rule1 Protein 5lbs', '<p><em>Rule 1 Protein kh&ocirc;ng c&oacute; chất b&eacute;o, tinh bột, hoặc cholesterol - v&agrave; kh&ocirc;ng bột kem th&ecirc;m hoặc gums được th&ecirc;m v&agrave;o giống c&aacute;c sản phẩm protein kh&aacute;c, duy tr&igrave; khối lượng tế b&agrave;o v&agrave; hỗ trợ phục hồi cơ.</em></p>\r\n', '1390000.00', 100000, 'upl_rule_1_protein_5lbs_1600942125_image_1600942125.jpg', '[]', 0, 0, 4, 1, 1608185622),
(57, 12, 'Mutant Iso Surge 5lbs 2.27kg', '<p><em>Mutant Iso Surge cung cấp th&agrave;nh phần whey gồm: protein isolate v&agrave; hydrolysate. Iso Surge &iacute;t chất b&eacute;o, kh&ocirc;ng pha trộn v&agrave; đem lại nguồn Protein dồi d&agrave;o với hương vị hấp dẫn, đơn giản.</em></p>\r\n', '1950000.00', 100000, 'upl_mutant_iso_surge_5lbs_2_27kg_1606899470_image_1606899470.jpg', '[]', 0, 0, 4, 1, 1608185658),
(58, 12, 'VP2 Whey Protein Isolate 2lbs 900g', '<p><em>Whey Protein Isolate VP2 2Lbs 900G VP2 th&uacute;c đẩy qu&aacute; tr&igrave;nh th&iacute;ch nghi với những b&agrave;i tập luyện nặng v&agrave; mạnh gi&aacute; tốt nhất d&agrave;nh cho người tập Gym. H&agrave;ng ch&iacute;nh h&atilde;ng tại WheyStore!</em></p>\r\n', '950000.00', 130000, 'upl_whey_protein_isolate_vp2_2lbs__900g__1589446566_image_1589446566.jpg', '[]', 0, 0, 4, 1, 1608185711),
(59, 12, 'Platinum HydroWhey 3.5lbs 1.59kg', '<p><em>Platinum Hydrowhey l&agrave; 1 sản phẩm tinh khiết nhất, dễ d&agrave;ng hấp thụ gi&uacute;p x&acirc;y dựng cơ bắp hiệu quả trong thời gian ngắn nhất. Hydrowwhey dễ tan, kh&ocirc;ng c&oacute; chất b&eacute;o, cholesterol.</em></p>\r\n', '1600000.00', 50000, '63_image_catalog_platinum_hydrowhey_3_5_lbs__1_59kg__image_catalog_1587722716.jpg', '[]', 0, 0, 4, 1, 1608185744),
(60, 12, 'ISO 100 5lbs 2.27kg', '<p><em>Sử dụng ISO 100 Isolate 100% 5 Lbs (2,27kg) trước mỗi buổi luyện tập, sau luyện tập hoặc bất k&igrave; khi n&agrave;o bạn cần nhằm bổ sung lượng protein chất lượng, hấp thụ nhanh cho cơ thể.</em></p>\r\n', '2150000.00', 250000, 'upl_iso_100_5lbs_2_27kg_1591409034_image_1591409034.jpg', '[]', 0, 0, 4, 1, 1608185779),
(49, 12, 'Nutrabolics HydroPure 4.5lbs', '<p><em>Nutrabolics HydroPure 4,5lbs 4,5lbs loại bỏ c&aacute;c chất b&eacute;o, lactose v&agrave; protein predigest để h&igrave;nh th&agrave;nh c&aacute;c chuỗi polypeptide nhỏ của axit amin hỗ trợ h&igrave;nh th&agrave;nh v&agrave; cải tạo cơ bắp!</em></p>\r\n', '1790000.00', 100000, '53_image_catalog_nutrabolics_hydropure_4_5lbs_image_catalog_1587722704.jpg', '[]', 0, 0, 4, 1, 1608184722);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(8, '3', '4.jpg', 'localhost://webshop/upload/4', 3, '2020-12-17 05:28:26'),
(7, '2', '3.jpg', 'localhost://webshop/upload/3', 2, '2020-12-17 05:28:10'),
(6, '1', '2.png', 'localhost://webshop/upload/2', 1, '2020-12-17 05:26:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(4, 1, 0, 'An Nhiên', 'annhien@gmail.com', '0166666666', 'Hoàng Mai - Hà Nội', 'Vui lòng trao hàng đến địa chỉ trên...', '350000.00', '', 1493983674),
(13, 0, 0, 'ml', 'mod@gmail.com', '8989', 'dsf', 'jkjnn', '350000.00', '', 1608705416),
(5, 1, 0, 'Bình Nguyễn', 'binh@gmail.com', '0987654321', 'Hà Nội ', 'Gửi đến địa chỉ trên', '370000.00', '', 1494083674),
(6, 0, 0, 'Tô Nam', 'tonam@yahoo.com.vn', '098989876', 'Thủy Nguyên - Hải Phòng', 'Ship đến địa chỉ vào sáng ngày 23/5', '469000.00', '', 1494283674),
(7, 1, 5, 'GoO', 'GoO@gmail.com', '01215345336', 'Hải Phòng', 'Ship vào sáng mai.', '70000.00', '', 1494183674),
(8, 0, 0, 'Linh', 'ling@yahoo.com', '098798787', 'hai Phong', 'ship', '69000.00', '', 1494342674),
(9, 1, 0, 'Nhi', 'nhi@test.com', '0987654321', 'Long Biên - Hà Nội', 'Gửi hàng đến địa chỉ trên vào ngày mai', '200000.00', '', 1493983674),
(10, 0, 0, 'VIP User', 'test@gmail.com', '1234567890', 'Hải Phòng', 'Ship free', '450000.00', '', 1493983674),
(11, 0, 0, 'test', 'test@gmail.com', '1234567890', 'Hải Phòng', 'TESE', '300000.00', '', 1494383674),
(12, 0, 6, 'Nguyen An', 'khachhang1@gmail.com', '01201212222', 'Thủy Nguyên - Hải Phòng', 'SHIP TO', '169000.00', '', 1494407353);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(6, 'Nguyen An', 'khachhang1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01201212222', 'Thủy Nguyên - Hải Phòng', 2147483647),
(5, 'User', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2147483647),
(7, 'TEST@gmail.com', 'TEST@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2017);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
