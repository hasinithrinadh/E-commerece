CREATE TABLE Category (
    Category_ID   INT PRIMARY KEY,
    Category_Name VARCHAR2(30) UNIQUE,
    Description   VARCHAR2(60)
);

CREATE TABLE Product (
    Product_ID   INT PRIMARY KEY,
    Product_Name VARCHAR2(50),
    Category_ID  INT REFERENCES Category(Category_ID),
    Supplier_ID  INT,
    Brand        VARCHAR2(30),
    Price        NUMBER(10,2) CHECK (Price > 0),
    Stock        INT CHECK (Stock >= 0),
    Expiry_Date  DATE
);

INSERT INTO Category VALUES (1, 'Jewelry', 'Handmade jewelry and accessories');
INSERT INTO Category VALUES (2, 'Home Decor', 'Handcrafted home decor items');
INSERT INTO Category VALUES (3, 'Clothing & Accessories', 'Handmade clothing and accessories');
INSERT INTO Category VALUES (4, 'Art & Collectibles', 'Original art and collectible pieces');
INSERT INTO Category VALUES (5, 'Bath & Beauty', 'Natural bath and beauty products');
INSERT INTO Category VALUES (6, 'Wedding & Party Supplies', 'Wedding and party decor supplies');
INSERT INTO Category VALUES (7, 'Toys & Games', 'Handmade toys and games');
INSERT INTO Category VALUES (8, 'Craft Supplies & Tools', 'Craft supplies and tools');
INSERT INTO Category VALUES (9, 'Vintage Finds', 'Vintage and antique items');
INSERT INTO Category VALUES (10, 'Paper & Party Goods', 'Paper goods and party printables');

COMMIT;

INSERT INTO Product VALUES (101, 'Beaded Necklace', 1, 1001, 'LunaCraftsCo', 850, 25, NULL);
INSERT INTO Product VALUES (102, 'Silver Hoop Earrings', 1, 1002, 'SilverMoonStudio', 650, 30, NULL);
INSERT INTO Product VALUES (103, 'Charm Bracelet', 1, 1003, 'WhimsyWorks', 720, 20, NULL);
INSERT INTO Product VALUES (104, 'Wire Wrapped Ring', 1, 1004, 'StoneAndWireCo', 480, 35, NULL);
INSERT INTO Product VALUES (105, 'Pearl Pendant', 1, 1005, 'OceanPearlCraft', 950, 15, NULL);
INSERT INTO Product VALUES (106, 'Beaded Anklet', 1, 1006, 'BohoBeadsShop', 380, 40, NULL);
INSERT INTO Product VALUES (107, 'Gemstone Choker', 1, 1007, 'CrystalCoveCraft', 1100, 12, NULL);
INSERT INTO Product VALUES (108, 'Layered Chain Necklace', 1, 1008, 'GoldenThreadJewels', 890, 18, NULL);
INSERT INTO Product VALUES (109, 'Macrame Bracelet', 1, 1009, 'KnotsAndBeads', 320, 45, NULL);
INSERT INTO Product VALUES (110, 'Statement Earrings', 1, 1010, 'VividVineDesigns', 560, 22, NULL);
INSERT INTO Product VALUES (111, 'Macrame Wall Hanging', 2, 1011, 'KnotsAndBeads', 1450, 12, NULL);
INSERT INTO Product VALUES (112, 'Ceramic Planter', 2, 1012, 'ClayAndPetalStudio', 780, 20, NULL);
INSERT INTO Product VALUES (113, 'Wooden Coaster Set', 2, 1013, 'WoodWhisperCraft', 550, 30, NULL);
INSERT INTO Product VALUES (114, 'Hand-painted Vase', 2, 1014, 'BrushAndClayArt', 1650, 8, NULL);
INSERT INTO Product VALUES (115, 'Woven Basket', 2, 1015, 'WillowWeaveCo', 920, 15, NULL);
INSERT INTO Product VALUES (116, 'Candle Holder', 2, 1016, 'FlameAndForm', 600, 25, NULL);
INSERT INTO Product VALUES (117, 'Dreamcatcher', 2, 1017, 'FeatherDreamsCraft', 480, 28, NULL);
INSERT INTO Product VALUES (118, 'Wall Tapestry', 2, 1018, 'TextileTalesShop', 1350, 10, NULL);
INSERT INTO Product VALUES (119, 'Wooden Wall Clock', 2, 1019, 'TimberTimeCraft', 2100, 6, NULL);
INSERT INTO Product VALUES (120, 'Rattan Mirror', 2, 1020, 'WovenReflections', 1800, 9, NULL);
INSERT INTO Product VALUES (121, 'Knitted Scarf', 3, 1021, 'CozyYarnCo', 650, 20, NULL);
INSERT INTO Product VALUES (122, 'Crochet Cardigan', 3, 1022, 'StitchAndSoulCraft', 1850, 10, NULL);
INSERT INTO Product VALUES (123, 'Hand-dyed Tote Bag', 3, 1023, 'IndigoDyeStudio', 720, 15, NULL);
INSERT INTO Product VALUES (124, 'Embroidered Tunic', 3, 1024, 'NeedleAndThreadCo', 1450, 8, NULL);
INSERT INTO Product VALUES (125, 'Leather Wallet', 3, 1025, 'HideAndStitch', 980, 18, NULL);
INSERT INTO Product VALUES (126, 'Wool Beanie', 3, 1026, 'WarmThreadsCraft', 420, 30, NULL);
INSERT INTO Product VALUES (127, 'Silk Scarf', 3, 1027, 'SilkRouteWeaves', 890, 14, NULL);
INSERT INTO Product VALUES (128, 'Handmade Sandals', 3, 1028, 'BareStepCraft', 1250, 12, NULL);
INSERT INTO Product VALUES (129, 'Denim Patch Jacket', 3, 1029, 'StitchRebelCo', 2400, 6, NULL);
INSERT INTO Product VALUES (130, 'Beaded Belt', 3, 1030, 'BohoBeltStudio', 560, 20, NULL);
INSERT INTO Product VALUES (131, 'Watercolor Painting', 4, 1031, 'BrushStrokeStudio', 2200, 8, NULL);
INSERT INTO Product VALUES (132, 'Digital Print', 4, 1032, 'PixelPetalArt', 450, 40, NULL);
INSERT INTO Product VALUES (133, 'Hand-carved Sculpture', 4, 1033, 'StoneCraftWorks', 3200, 5, NULL);
INSERT INTO Product VALUES (134, 'Line Art Portrait', 4, 1034, 'InkAndLineStudio', 950, 15, NULL);
INSERT INTO Product VALUES (135, 'Collage Art Piece', 4, 1035, 'MixedMediaCraft', 1650, 9, NULL);
INSERT INTO Product VALUES (136, 'Ceramic Figurine', 4, 1036, 'ClayTalesStudio', 780, 18, NULL);
INSERT INTO Product VALUES (137, 'Framed Photograph', 4, 1037, 'LensAndLightCo', 1100, 12, NULL);
INSERT INTO Product VALUES (138, 'Abstract Canvas Art', 4, 1038, 'ColorFieldStudio', 2600, 7, NULL);
INSERT INTO Product VALUES (139, 'Wooden Carving', 4, 1039, 'TimberTaleCraft', 1350, 10, NULL);
INSERT INTO Product VALUES (140, 'Vintage Postcard Set', 4, 1040, 'PaperTrailArchive', 380, 25, NULL);
INSERT INTO Product VALUES (141, 'Handmade Soap Bar', 5, 1041, 'PureLeafSoapCo', 320, 40, TO_DATE('30-06-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (142, 'Lavender Bath Salts', 5, 1042, 'CalmWatersCraft', 450, 30, TO_DATE('31-12-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (143, 'Shea Butter Lotion', 5, 1043, 'ButterBloomCo', 550, 25, TO_DATE('15-08-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (144, 'Beeswax Lip Balm', 5, 1044, 'HoneyHiveCraft', 180, 60, TO_DATE('30-09-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (145, 'Herbal Face Mask', 5, 1045, 'GreenLeafBeauty', 400, 35, TO_DATE('31-05-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (146, 'Essential Oil Roller', 5, 1046, 'AromaRootsCraft', 650, 20, TO_DATE('31-12-2028','DD-MM-YYYY'));
INSERT INTO Product VALUES (147, 'Charcoal Soap', 5, 1047, 'PureLeafSoapCo', 350, 40, TO_DATE('30-06-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (148, 'Body Scrub Jar', 5, 1048, 'SugarAndSaltCo', 480, 28, TO_DATE('31-10-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (149, 'Solid Shampoo Bar', 5, 1049, 'EcoLatherCraft', 420, 32, TO_DATE('28-02-2028','DD-MM-YYYY'));
INSERT INTO Product VALUES (150, 'Herbal Bath Tea Bag', 5, 1050, 'SoakAndSteepCo', 300, 45, TO_DATE('31-07-2027','DD-MM-YYYY'));
INSERT INTO Product VALUES (151, 'Wedding Invitation Set', 6, 1051, 'InkAndPaperCo', 850, 20, NULL);
INSERT INTO Product VALUES (152, 'Table Centerpiece', 6, 1052, 'BloomAndBranchStudio', 1450, 10, NULL);
INSERT INTO Product VALUES (153, 'Photo Booth Props', 6, 1053, 'SnapAndSmileCraft', 550, 25, NULL);
INSERT INTO Product VALUES (154, 'Bridal Hair Comb', 6, 1054, 'VeilAndVineStudio', 780, 15, NULL);
INSERT INTO Product VALUES (155, 'Balloon Garland Kit', 6, 1055, 'PartyPopCraft', 620, 20, NULL);
INSERT INTO Product VALUES (156, 'Cake Topper', 6, 1056, 'SweetTopperCo', 350, 30, NULL);
INSERT INTO Product VALUES (157, 'Guest Book', 6, 1057, 'MemoryPagesStudio', 950, 12, NULL);
INSERT INTO Product VALUES (158, 'Ring Bearer Pillow', 6, 1058, 'VelvetVowsCraft', 480, 18, NULL);
INSERT INTO Product VALUES (159, 'Wedding Favor Box Set', 6, 1059, 'FavorAndForm', 600, 25, NULL);
INSERT INTO Product VALUES (160, 'Party Banner Set', 6, 1060, 'StringAndLetterCo', 420, 22, NULL);
INSERT INTO Product VALUES (161, 'Wooden Puzzle', 7, 1061, 'TinkerToyCraft', 650, 20, NULL);
INSERT INTO Product VALUES (162, 'Crochet Stuffed Animal', 7, 1062, 'YarnFriendsCo', 780, 18, NULL);
INSERT INTO Product VALUES (163, 'Building Block Set', 7, 1063, 'StackAndBuildCraft', 950, 15, NULL);
INSERT INTO Product VALUES (164, 'Felt Finger Puppets', 7, 1064, 'FeltFableStudio', 380, 30, NULL);
INSERT INTO Product VALUES (165, 'Wooden Rattle', 7, 1065, 'LittleAcornCraft', 420, 25, NULL);
INSERT INTO Product VALUES (166, 'Cloth Doll', 7, 1066, 'RagAndRibbonCo', 890, 14, NULL);
INSERT INTO Product VALUES (167, 'Memory Match Game', 7, 1067, 'MindfulPlayStudio', 550, 20, NULL);
INSERT INTO Product VALUES (168, 'Balance Board Toy', 7, 1068, 'WoodenWobbleCraft', 1250, 10, NULL);
INSERT INTO Product VALUES (169, 'Wooden Xylophone', 7, 1069, 'TinyTuneCraft', 720, 16, NULL);
INSERT INTO Product VALUES (170, 'Knitted Play Blocks', 7, 1070, 'SoftStackCo', 600, 20, NULL);
INSERT INTO Product VALUES (171, 'Embroidery Hoop Kit', 8, 1071, 'StitchStartCraft', 450, 30, NULL);
INSERT INTO Product VALUES (172, 'Yarn Skein Bundle', 8, 1072, 'WoolWindStudio', 380, 40, NULL);
INSERT INTO Product VALUES (173, 'Polymer Clay Set', 8, 1073, 'ClayPlayCo', 550, 25, NULL);
INSERT INTO Product VALUES (174, 'Wood Burning Tool', 8, 1074, 'PyroCraftStudio', 1450, 10, NULL);
INSERT INTO Product VALUES (175, 'Bead Assortment Box', 8, 1075, 'BeadBoxCraft', 620, 20, NULL);
INSERT INTO Product VALUES (176, 'Leather Crafting Kit', 8, 1076, 'HideWorksStudio', 980, 12, NULL);
INSERT INTO Product VALUES (177, 'Macrame Cord Set', 8, 1077, 'KnotSupplyCo', 350, 35, NULL);
INSERT INTO Product VALUES (178, 'Fabric Paint Set', 8, 1078, 'ColorThreadCraft', 480, 22, NULL);
INSERT INTO Product VALUES (179, 'Watercolor Palette', 8, 1079, 'PigmentPathStudio', 720, 18, NULL);
INSERT INTO Product VALUES (180, 'Wooden Craft Base Set', 8, 1080, 'BaseCraftCo', 550, 20, NULL);
INSERT INTO Product VALUES (181, 'Vintage Locket', 9, 1081, 'TimeWornTreasures', 950, 10, NULL);
INSERT INTO Product VALUES (182, 'Antique Brooch', 9, 1082, 'RelicRootsCraft', 780, 12, NULL);
INSERT INTO Product VALUES (183, 'Retro Enamel Pin', 9, 1083, 'PastEraPins', 320, 25, NULL);
INSERT INTO Product VALUES (184, 'Vintage Teacup Set', 9, 1084, 'HeirloomHavenCraft', 1250, 8, NULL);
INSERT INTO Product VALUES (185, 'Old Map Print', 9, 1085, 'ArchiveAtlasCo', 450, 20, NULL);
INSERT INTO Product VALUES (186, 'Vintage Button Jar', 9, 1086, 'ButtonBoxStudio', 380, 30, NULL);
INSERT INTO Product VALUES (187, 'Retro Vinyl Record', 9, 1087, 'SpinBackCraft', 650, 15, NULL);
INSERT INTO Product VALUES (188, 'Antique Key Charm', 9, 1088, 'RelicRootsCraft', 300, 28, NULL);
INSERT INTO Product VALUES (189, 'Vintage Lace Doily', 9, 1089, 'HeirloomHavenCraft', 420, 22, NULL);
INSERT INTO Product VALUES (190, 'Old Typewriter Keys Set', 9, 1090, 'TypecastTreasures', 780, 12, NULL);
INSERT INTO Product VALUES (191, 'Printable Planner', 10, 1091, 'PagePlanCraft', 250, 50, NULL);
INSERT INTO Product VALUES (192, 'Greeting Card Set', 10, 1092, 'InkAndPetalStudio', 300, 45, NULL);
INSERT INTO Product VALUES (193, 'Origami Paper Pack', 10, 1093, 'FoldCraftCo', 220, 60, NULL);
INSERT INTO Product VALUES (194, 'Custom Stamp Set', 10, 1094, 'StampAndSealCraft', 450, 30, NULL);
INSERT INTO Product VALUES (195, 'Washi Tape Bundle', 10, 1095, 'TapeTrailStudio', 280, 40, NULL);
INSERT INTO Product VALUES (196, 'Scrapbook Kit', 10, 1096, 'MemoryLaneCraft', 650, 20, NULL);
INSERT INTO Product VALUES (197, 'Gift Wrap Set', 10, 1097, 'WrapAndBowCo', 350, 35, NULL);
INSERT INTO Product VALUES (198, 'Party Invitation Templates', 10, 1098, 'InviteInkStudio', 300, 40, NULL);
INSERT INTO Product VALUES (199, 'Sticker Sheet Pack', 10, 1099, 'StickerStudioCo', 220, 55, NULL);
INSERT INTO Product VALUES (200, 'Kraft Gift Tags', 10, 1100, 'TagAndTwineCraft', 180, 50, NULL);

COMMIT;

SELECT * FROM Category;

SELECT * FROM Product;

UPDATE Product
SET Price = 700, Stock = 25
WHERE Product_ID = 121;

UPDATE Product
SET Price = 500, Stock = 35
WHERE Product_ID = 132;

UPDATE Product
SET Price = 450, Stock = 28
WHERE Product_ID = 160;

SELECT * FROM Product
WHERE Product_ID IN (121, 132, 160);

DELETE FROM Product WHERE Product_ID = 118;

DELETE FROM Product WHERE Product_ID = 172;

DELETE FROM Product WHERE Product_ID = 192;

COMMIT;

SELECT * FROM Product;

SELECT c.Category_ID, c.Category_Name, p.Product_ID, p.Product_Name, p.Price, p.Stock
FROM Category c JOIN Product p
  ON c.Category_ID = p.Category_ID
ORDER BY c.Category_ID, p.Product_ID;
