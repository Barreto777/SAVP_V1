-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: savp_v1
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividades_economicas`
--

DROP TABLE IF EXISTS `actividades_economicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividades_economicas` (
  `id` int(11) NOT NULL,
  `actividad` varchar(200) NOT NULL,
  `activiadid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activiadid` (`activiadid`),
  CONSTRAINT `actividades_economicas_ibfk_1` FOREIGN KEY (`activiadid`) REFERENCES `actividades_economicas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades_economicas`
--

LOCK TABLES `actividades_economicas` WRITE;
/*!40000 ALTER TABLE `actividades_economicas` DISABLE KEYS */;
INSERT INTO `actividades_economicas` VALUES (1,'agua',1);
/*!40000 ALTER TABLE `actividades_economicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barrios` (
  `id` int(11) NOT NULL,
  `barrio` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES (1,'Valle Pyta'),(2,'Santa Rita');
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `cajeroid` int(11) NOT NULL,
  `fechaapertura` datetime DEFAULT NULL,
  `montoapertura` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `cerrado` int(11) NOT NULL,
  `montosistema` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `montocierre` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `nrocaja` int(11) NOT NULL,
  `fechacierre` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcdcajacajeroid` (`cajeroid`),
  CONSTRAINT `fkcdcajacajeroid` FOREIGN KEY (`cajeroid`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (1,5,'2024-08-18 00:00:00',1000.00000,1,1000.00000,1000.00000,1,'2024-08-19 00:00:00'),(2,3,'2024-08-20 00:00:00',250000.00000,0,500000.00000,0.00000,1,'2024-08-22 00:00:00');
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja_detalle`
--

DROP TABLE IF EXISTS `caja_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja_detalle` (
  `id` int(11) NOT NULL,
  `tabla` varchar(20) DEFAULT NULL,
  `tablaid` int(11) NOT NULL,
  `importe` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `monedaid` int(11) NOT NULL,
  `cajaid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcajadetmonedaid` (`monedaid`),
  KEY `fk_caja_det_cajaid` (`cajaid`),
  CONSTRAINT `fk_caja_det_cajaid` FOREIGN KEY (`cajaid`) REFERENCES `caja` (`id`),
  CONSTRAINT `fkcajadetmonedaid` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_detalle`
--

LOCK TABLES `caja_detalle` WRITE;
/*!40000 ALTER TABLE `caja_detalle` DISABLE KEYS */;
INSERT INTO `caja_detalle` VALUES (1,'COBROS',1,250000.00000,1,2);
/*!40000 ALTER TABLE `caja_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TR_UPDATE_MONTOSISTEMA_CAJA AFTER INSERT ON CAJA_DETALLE
FOR EACH ROW 
BEGIN   
DECLARE lsmsg TEXT;
DECLARE maxidcj INTEGER DEFAULT 0; 

        
		
		IF NEW.tabla= 'COBROS' THEN 
			UPDATE CAJA SET montosistema = montosistema + NEW.importe WHERE id = NEW.cajaid;
		ELSEIF NEW.tabla= 'PAGOS' THEN 
			UPDATE CAJA SET montosistema = montosistema - NEW.importe WHERE id = NEW.cajaid;
		END IF;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Yataity');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `nrocelular` int(11) NOT NULL,
  `fechaingreso` date NOT NULL,
  `barrioid` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Gloria','Barreto','1996-12-30',986895689,'2024-05-24',2,'Activo'),(2,'Fátima','Barreto','1968-12-30',983578563,'2024-05-27',2,'Activo'),(3,'Cristina','Martínez','1968-12-25',985741789,'2024-05-27',2,'Activo'),(4,'Jazz','Gusmán','1967-04-27',986378542,'2024-05-27',1,'Activo'),(5,'Cornelio','Bogado','1985-07-16',987542156,'2024-06-13',2,'Activo'),(6,'Tere','Mosque','1962-10-23',986589564,'2024-06-14',2,'Activo'),(7,'Celestial','Alto','1995-12-30',987546123,'2024-06-15',2,'Activo'),(8,'Lore','Alegre','1998-12-12',986785456,'2024-06-17',1,'Activo'),(9,'prueba','alto','1985-12-12',987564123,'2024-07-10',1,'Activo'),(10,'ajuste','cobro','1995-08-12',987564897,'2024-07-15',2,'Activo'),(11,'eso','era','1998-10-10',987546123,'2024-07-15',2,'Activo'),(12,'Luci','Barreto','1998-12-12',98657421,'2024-08-15',2,'Activo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobros`
--

DROP TABLE IF EXISTS `cobros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros` (
  `id` int(11) NOT NULL,
  `fechaproceso` datetime DEFAULT NULL,
  `fechacobro` datetime DEFAULT NULL,
  `clienteid` int(11) NOT NULL,
  `monedaid` int(11) NOT NULL,
  `talonarioid` int(11) NOT NULL,
  `nrorecibo` varchar(20) NOT NULL,
  `totaldoc` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `totalcobro` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `totalinteres` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `observacion` varchar(200) DEFAULT NULL,
  `efectivo` int(11) NOT NULL,
  `vuelto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcobrosclienteid` (`clienteid`),
  KEY `fkcobrosmonedaid` (`monedaid`),
  KEY `fkcobrostalonarioid` (`talonarioid`),
  CONSTRAINT `fkcobrosclienteid` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fkcobrosmonedaid` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`),
  CONSTRAINT `fkcobrostalonarioid` FOREIGN KEY (`talonarioid`) REFERENCES `talonarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobros`
--

LOCK TABLES `cobros` WRITE;
/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
INSERT INTO `cobros` VALUES (1,'2024-08-21 00:00:00','2024-08-21 00:00:00',1,1,2,'001-011-0000101',250000.00000,250000.00000,0.00000,'Cobro de Conexion 1',250000,0);
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TR_INSERT_CAJA_DETALLE_POR_COBROS AFTER INSERT ON COBROS
FOR EACH ROW 
BEGIN   
DECLARE lsmsg TEXT;
DECLARE maxidcj INTEGER DEFAULT 0; 
DECLARE maxidcd INTEGER DEFAULT 0; 
    
		SELECT MAX(cj.id) INTO maxidcj FROM CAJA cj WHERE cj.cerrado=0 AND cj.montocierre=0;
	
		SELECT IFNULL(MAX(cd.id), 0) + 1 INTO maxidcd FROM CAJA_DETALLE cd;
    
	INSERT INTO CAJA_DETALLE(id, cajaid, tabla, tablaid, importe, monedaid)
	VALUES(maxidcd, maxidcj,'COBROS', NEW.id, NEW.totalcobro, NEW.monedaid );
    

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cobros_documentos`
--

DROP TABLE IF EXISTS `cobros_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros_documentos` (
  `id` int(11) NOT NULL,
  `cobroid` int(11) NOT NULL,
  `ctasclienteid` int(11) NOT NULL,
  `monedaid` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `importe` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `interes` decimal(3,0) NOT NULL,
  `importeinteres` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `total` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `cobrado` decimal(15,5) NOT NULL DEFAULT 0.00000,
  PRIMARY KEY (`id`),
  KEY `fkcdcobroid` (`cobroid`),
  KEY `fkcdctasclienteid` (`ctasclienteid`),
  KEY `fkcdmonedaid` (`monedaid`),
  CONSTRAINT `fkcdcobroid` FOREIGN KEY (`cobroid`) REFERENCES `cobros` (`id`),
  CONSTRAINT `fkcdctasclienteid` FOREIGN KEY (`ctasclienteid`) REFERENCES `ctas_cliente` (`id`),
  CONSTRAINT `fkcdmonedaid` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobros_documentos`
--

LOCK TABLES `cobros_documentos` WRITE;
/*!40000 ALTER TABLE `cobros_documentos` DISABLE KEYS */;
INSERT INTO `cobros_documentos` VALUES (1,1,1,1,1,250000.00000,0,0.00000,250000.00000,250000.00000);
/*!40000 ALTER TABLE `cobros_documentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TR_ACTUALIZAR_CTAS_CLIENTE AFTER INSERT ON COBROS_DOCUMENTOS
FOR EACH ROW 
BEGIN   
DECLARE lsmsg TEXT;

    UPDATE ctas_cliente
    SET importecobrado = importecobrado + NEW.cobrado
    WHERE id = NEW.ctasclienteid; 

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `fechaproceso` date DEFAULT NULL,
  `fechafactura` date DEFAULT NULL,
  `nrofactura` int(11) NOT NULL,
  `serie` varchar(20) NOT NULL,
  `timbrado` varchar(20) NOT NULL,
  `vence` date NOT NULL,
  `proveedorid` int(11) NOT NULL,
  `cuotaid` int(11) NOT NULL,
  `monedaid` int(11) NOT NULL,
  `tipodocid` int(11) NOT NULL,
  `totpreciobruto` decimal(15,5) DEFAULT NULL,
  `totexento` decimal(15,5) DEFAULT NULL,
  `totprecioneto` decimal(15,5) DEFAULT NULL,
  `totimpuesto` decimal(15,5) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `tipocompraid` int(11) NOT NULL,
  `depositoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcompprov` (`proveedorid`),
  KEY `fkcompcuota` (`cuotaid`),
  KEY `fkcompmon` (`monedaid`),
  KEY `fkcomptipdoc` (`tipodocid`),
  CONSTRAINT `fkcompcuota` FOREIGN KEY (`cuotaid`) REFERENCES `cuotas` (`id`),
  CONSTRAINT `fkcompmon` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`),
  CONSTRAINT `fkcompprov` FOREIGN KEY (`proveedorid`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `fkcomptipdoc` FOREIGN KEY (`tipodocid`) REFERENCES `tipo_documentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2024-08-19','2024-08-19',236548,'001-001','456879','2024-10-18',1,1,1,1,100000.00000,0.00000,90909.00000,9091.00000,'',1,1),(2,'2024-08-19','2024-08-19',8965,'001-001','78214','2025-07-11',3,1,1,1,150000.00000,0.00000,136364.00000,13636.00000,'Obs',1,1),(3,'2024-08-19','2024-08-19',23651,'001-001','3265','2025-08-15',1,1,1,1,100000.00000,0.00000,90909.00000,9091.00000,'Obs',1,1);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_COMPRAS_CTASPAGAR` AFTER INSERT ON `COMPRAS` FOR EACH ROW
BEGIN 
    
    DECLARE lirows integer DEFAULT 0;  
    DECLARE lirow integer DEFAULT 0;   
    DECLARE liiregular integer DEFAULT 0;   
    DECLARE litipoid integer DEFAULT 0;   
    DECLARE limaxid integer DEFAULT 0; 
    DECLARE lidays integer DEFAULT 0; 
    DECLARE ldultimacuota DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldimportecuota DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldtotcuenta DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldtvence DATE;
    DECLARE lsmsg TEXT;
    
    
    
    SELECT q.cuotas, q.irregular, q.tipoid INTO lirows, liiregular, litipoid
    FROM CUOTAS q 
    WHERE q.id = NEW.cuotaid;
    
    IF lirows = 0 OR litipoid = 0  THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se recuperó datos de Cuotas'; 
	END if; 
    
    
    SELECT IFNULL(cp.totpreciobruto, 0) INTO ldtotcuenta 
    FROM compras cp
    WHERE cp.id = NEW.id;
    
    IF ldtotcuenta = 0  THEN
		SELECT CONCAT('No se recuperó el total de precio de la factura ', NEW.id) INTO lsmsg;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = lsmsg; 
	END if;
    
    
    SET ldimportecuota = ROUND(ldtotcuenta / lirows, 0);
    
    
    SET ldultimacuota = ldtotcuenta - (ldimportecuota * (lirows - 1));
    
    
    
    SET lirow = 1;
    while lirows >= lirow do 
		SELECT IFNULL(MAX(c.id), 0) + 1 INTO limaxid
        FROM CTAS_PAGAR c;
        
        IF liiregular = 1 THEN    
			SELECT DATE_ADD(NEW.fechafactura, INTERVAL d.dias DAY)
            INTO ldtvence
            FROM CUOTAS_DET d
            WHERE d.cuotaid = NEW.cuotaid
            AND d.cuota = lirow;
        ELSE      
			IF litipoid = 1 THEN 
				SET ldtvence = DATE(NEW.fechafactura);
			ELSE  
				SET ldtvence = DATE_ADD(NEW.fechafactura, INTERVAL lirow MONTH);
			END IF;
        END IF;
        
        IF lirows = lirow THEN
			INSERT INTO CTAS_PAGAR(id, tabla, tablaid, cuota, importe, vence, importepagado)
			VALUES(limaxid, 'COMPRAS', NEW.id, lirow, ldultimacuota, ldtvence, 0);
        ELSE
			INSERT INTO CTAS_PAGAR(id, tabla, tablaid, cuota, importe, vence, importepagado)
			VALUES(limaxid, 'COMPRAS', NEW.id, lirow, ldimportecuota, ldtvence, 0);
        END IF;			
        SET lirow = lirow + 1;
    end while;			
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compras_det`
--

DROP TABLE IF EXISTS `compras_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras_det` (
  `id` int(11) NOT NULL,
  `compraid` int(11) NOT NULL,
  `productoid` int(11) NOT NULL,
  `preciobruto` decimal(15,5) DEFAULT NULL,
  `cantbonificado` decimal(15,5) DEFAULT NULL,
  `descuento` decimal(15,5) DEFAULT NULL,
  `total` decimal(15,5) DEFAULT NULL,
  `cantidad` decimal(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcompdetprov` (`compraid`),
  KEY `fkcompdetprod` (`productoid`),
  CONSTRAINT `fkcompdetprod` FOREIGN KEY (`productoid`) REFERENCES `productos2` (`id`),
  CONSTRAINT `fkcompdetprov` FOREIGN KEY (`compraid`) REFERENCES `compras` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_det`
--

LOCK TABLES `compras_det` WRITE;
/*!40000 ALTER TABLE `compras_det` DISABLE KEYS */;
INSERT INTO `compras_det` VALUES (1,1,3,100000.00000,0.00000,0.00000,100000.00000,1.00000),(2,2,4,150000.00000,0.00000,0.00000,150000.00000,1.00000),(3,3,3,100000.00000,0.00000,0.00000,100000.00000,1.00000);
/*!40000 ALTER TABLE `compras_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexion_categorias`
--

DROP TABLE IF EXISTS `conexion_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conexion_categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(200) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexion_categorias`
--

LOCK TABLES `conexion_categorias` WRITE;
/*!40000 ALTER TABLE `conexion_categorias` DISABLE KEYS */;
INSERT INTO `conexion_categorias` VALUES (1,'Residencial',1),(2,'Residencial Subsidiada',1),(3,'sin categoria',1),(4,'Comercial',1);
/*!40000 ALTER TABLE `conexion_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexion_estados`
--

DROP TABLE IF EXISTS `conexion_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conexion_estados` (
  `id` int(11) NOT NULL,
  `conexionid` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estadoid` int(11) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conexionid` (`conexionid`),
  CONSTRAINT `conexion_estados_ibfk_1` FOREIGN KEY (`conexionid`) REFERENCES `conexiones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexion_estados`
--

LOCK TABLES `conexion_estados` WRITE;
/*!40000 ALTER TABLE `conexion_estados` DISABLE KEYS */;
INSERT INTO `conexion_estados` VALUES (1,1,'2024-08-18 00:00:00',1,'pri'),(2,2,'2024-08-20 00:00:00',1,'Cristina'),(3,3,'2024-08-20 00:00:00',1,'Cristina conexión 2'),(4,4,'2024-08-20 00:00:00',1,'Gloria conexión 2');
/*!40000 ALTER TABLE `conexion_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexiones`
--

DROP TABLE IF EXISTS `conexiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conexiones` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `clienteid` int(11) NOT NULL,
  `inmuebleid` int(11) NOT NULL,
  `categoriaid` int(11) NOT NULL,
  `productodetid` int(11) NOT NULL,
  `medidornro` varchar(50) DEFAULT NULL,
  `issan` varchar(50) NOT NULL,
  `facturatipo` int(11) NOT NULL,
  `cuotaid` int(11) NOT NULL,
  `ciclomes` int(11) NOT NULL,
  `cicloano` int(11) NOT NULL,
  `estadoid` int(11) NOT NULL,
  `cantidadconexion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issan` (`issan`),
  KEY `clienteid` (`clienteid`),
  KEY `inmuebleid` (`inmuebleid`),
  KEY `categoriaid` (`categoriaid`),
  KEY `productodetid` (`productodetid`),
  CONSTRAINT `conexiones_ibfk_1` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`id`),
  CONSTRAINT `conexiones_ibfk_2` FOREIGN KEY (`inmuebleid`) REFERENCES `inmuebles` (`id`),
  CONSTRAINT `conexiones_ibfk_3` FOREIGN KEY (`categoriaid`) REFERENCES `conexion_categorias` (`id`),
  CONSTRAINT `conexiones_ibfk_4` FOREIGN KEY (`productodetid`) REFERENCES `productos2_det` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexiones`
--

LOCK TABLES `conexiones` WRITE;
/*!40000 ALTER TABLE `conexiones` DISABLE KEYS */;
INSERT INTO `conexiones` VALUES (1,'2024-08-18 00:00:00',1,1,1,1,'0','VP359',1,1,8,2024,1,1),(2,'2024-08-20 00:00:00',3,3,1,1,'0','VP360',1,1,8,2024,1,1),(3,'2024-08-20 00:00:00',3,4,1,1,'0','SR361',1,1,8,2024,1,1),(4,'2024-08-20 00:00:00',1,6,1,1,'0','SR362',1,1,8,2024,1,1);
/*!40000 ALTER TABLE `conexiones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_INS_CONEXION` AFTER INSERT ON `conexiones` FOR EACH ROW
BEGIN 
    
    DECLARE lirows integer DEFAULT 0;  
    DECLARE lirow integer DEFAULT 0;   
    DECLARE liiregular integer DEFAULT 0;   
    DECLARE litipoid integer DEFAULT 0;   
    DECLARE limaxid integer DEFAULT 0; 
    DECLARE lidays integer DEFAULT 0; 
    DECLARE ldultimacuota DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldimportecuota DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldtotcuenta DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldtvence DATE;
    DECLARE lsmsg TEXT;
    
    
    
    SELECT q.cuotas, q.irregular, q.tipoid INTO lirows, liiregular, litipoid
    FROM CUOTAS q 
    WHERE q.id = NEW.cuotaid;
    
    IF lirows = 0 OR litipoid = 0  THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se recuperó datos de Cuotas'; 
	END if; 
    
    
    SELECT IFNULL(pd.precio, 0) INTO ldtotcuenta 
    FROM PRODUCTOS2_DET pd
    WHERE pd.id = NEW.productodetid;
    
    IF ldtotcuenta = 0  THEN
		SELECT CONCAT('No se recuperó precio para el producto ', NEW.productodetid) INTO lsmsg;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = lsmsg; 
	END if;
    
    
    SET ldimportecuota = ROUND(ldtotcuenta / lirows, 0);
    
    
    SET ldultimacuota = ldtotcuenta - (ldimportecuota * (lirows - 1));
    
    
    
    SET lirow = 1;
    while lirows >= lirow do 
		SELECT IFNULL(MAX(c.id), 0) + 1 INTO limaxid
        FROM CTAS_CLIENTE c;
        
        IF liiregular = 1 THEN    
			SELECT DATE_ADD(NEW.fecha, INTERVAL d.dias DAY)
            INTO ldtvence
            FROM CUOTAS_DET d
            WHERE d.cuotaid = NEW.cuotaid
            AND d.cuota = lirow;
        ELSE      
			IF litipoid = 1 THEN 
				SET ldtvence = DATE(NEW.fecha);
			ELSE  
				SET ldtvence = DATE_ADD(NEW.fecha, INTERVAL lirow MONTH);
			END IF;
        END IF;
        
        IF lirows = lirow THEN
			INSERT INTO CTAS_CLIENTE(id, tabla, tablaid, cuota, importe, vence, importecobrado, ciclomes, cicloanio)
			VALUES(limaxid, 'CONEXIONES', NEW.id, lirow, ldultimacuota, ldtvence, 0, NEW.ciclomes, NEW.cicloano);
        ELSE
			INSERT INTO CTAS_CLIENTE(id, tabla, tablaid, cuota, importe, vence, importecobrado, ciclomes, cicloanio)
			VALUES(limaxid, 'CONEXIONES', NEW.id, lirow, ldimportecuota, ldtvence, 0, NEW.ciclomes, NEW.cicloano);
        END IF;			
        SET lirow = lirow + 1;
    end while;			
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_UPD_CONEXIONES` AFTER UPDATE ON `conexiones` FOR EACH ROW
BEGIN 
    
    DECLARE lirows integer DEFAULT 0;  
    DECLARE lirow integer DEFAULT 0;   
    DECLARE liiregular integer DEFAULT 0;   
    DECLARE litipoid integer DEFAULT 0;   
    DECLARE limaxid integer DEFAULT 0; 
    DECLARE lidays integer DEFAULT 0; 
    DECLARE ldultimacuota DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldimportecuota DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldtotcuenta DECIMAL(15,5) DEFAULT 0.0;
    DECLARE ldtvence DATE;
    DECLARE lsmsg TEXT;
    
    
    
    SELECT q.cuotas, q.irregular, q.tipoid INTO lirows, liiregular, litipoid
    FROM CUOTAS q 
    WHERE q.id = NEW.cuotaid;
    
    IF lirows = 0 OR litipoid = 0  THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se recuperó datos de Cuotas'; 
	END if; 
    
    
    SELECT IFNULL(pd.precio, 0) INTO ldtotcuenta 
    FROM PRODUCTOS2_DET pd
    WHERE pd.id = NEW.productodetid;
    
    IF ldtotcuenta = 0  THEN
		SELECT CONCAT('No se recuperó precio para el producto ', NEW.productodetid) INTO lsmsg;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = lsmsg; 
	END if;
    
    
    SET ldimportecuota = ROUND(ldtotcuenta / lirows, 0);
    
    
    SET ldultimacuota = ldtotcuenta - (ldimportecuota * (lirows - 1));
    
    
    
    SET lirow = 1;
    while lirows >= lirow do 
		SELECT IFNULL(MAX(c.id), 0) + 1 INTO limaxid
        FROM CTAS_CLIENTE c;
        
        IF liiregular = 1 THEN    
			SELECT DATE_ADD(NEW.fecha, INTERVAL d.dias DAY)
            INTO ldtvence
            FROM CUOTAS_DET d
            WHERE d.cuotaid = NEW.cuotaid
            AND d.cuota = lirow;
        ELSE      
			IF litipoid = 1 THEN 
				SET ldtvence = DATE(NEW.fecha);
			ELSE  
				SET ldtvence = DATE_ADD(NEW.fecha, INTERVAL lirow MONTH);
			END IF;
        END IF;
        
        IF lirows = lirow THEN
			INSERT INTO CTAS_CLIENTE(id, tabla, tablaid, cuota, importe, vence, importecobrado)
			VALUES(limaxid, 'CONEXIONES', NEW.id, lirow, ldultimacuota, ldtvence, 0);
        ELSE
			INSERT INTO CTAS_CLIENTE(id, tabla, tablaid, cuota, importe, vence, importecobrado)
			VALUES(limaxid, 'CONEXIONES', NEW.id, lirow, ldimportecuota, ldtvence, 0);
        END IF;			
        SET lirow = lirow + 1;
    end while;			
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_DEL_CONEXION` BEFORE DELETE ON `conexiones` FOR EACH ROW
BEGIN 
    
  
    DECLARE lsmsg TEXT;
    
    IF MONTH(NOW()) < OLD.ciclomes AND YEAR(NOW()) < OLD.cicloano THEN
		SELECT CONCAT('No se puede eliminar un registro de un ciclo pasado ', 
                      OLD.ciclomes, ' - ', OLD.cicloano) INTO lsmsg;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = lsmsg; 
    END IF;
    
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ctas_cliente`
--

DROP TABLE IF EXISTS `ctas_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctas_cliente` (
  `id` int(11) NOT NULL,
  `tabla` varchar(100) NOT NULL,
  `tablaid` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `importe` decimal(15,5) DEFAULT NULL,
  `vence` date DEFAULT NULL,
  `importecobrado` decimal(15,5) DEFAULT NULL,
  `ciclomes` int(11) NOT NULL,
  `cicloanio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctas_cliente`
--

LOCK TABLES `ctas_cliente` WRITE;
/*!40000 ALTER TABLE `ctas_cliente` DISABLE KEYS */;
INSERT INTO `ctas_cliente` VALUES (1,'CONEXIONES',1,1,250000.00000,'2024-08-18',250000.00000,8,2024),(2,'CONSUMO',1,1,15000.00000,'2024-09-05',0.00000,8,2024),(3,'CONSUMO',1,1,15000.00000,'2024-10-05',0.00000,9,2024),(4,'CONEXIONES',2,1,250000.00000,'2024-08-20',0.00000,8,2024),(5,'CONSUMO',2,1,15000.00000,'2024-09-05',0.00000,8,2024),(6,'CONEXIONES',3,1,250000.00000,'2024-08-20',0.00000,8,2024),(7,'CONSUMO',3,1,15000.00000,'2024-09-05',0.00000,8,2024),(8,'CONSUMO',0,1,15000.00000,'2024-09-05',0.00000,8,2024),(9,'CONSUMO',3,1,15000.00000,'2024-10-05',0.00000,9,2024),(10,'CONEXIONES',4,1,250000.00000,'2024-08-20',0.00000,8,2024),(11,'CONSUMO',4,1,15000.00000,'2024-09-05',0.00000,8,2024);
/*!40000 ALTER TABLE `ctas_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctas_pagar`
--

DROP TABLE IF EXISTS `ctas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctas_pagar` (
  `id` int(11) NOT NULL,
  `tabla` varchar(100) NOT NULL,
  `tablaid` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `importe` decimal(15,5) DEFAULT NULL,
  `vence` date DEFAULT NULL,
  `importepagado` decimal(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctas_pagar`
--

LOCK TABLES `ctas_pagar` WRITE;
/*!40000 ALTER TABLE `ctas_pagar` DISABLE KEYS */;
INSERT INTO `ctas_pagar` VALUES (1,'COMPRAS',1,1,100000.00000,'2024-08-06',100000.00000),(2,'COMPRAS',2,1,150000.00000,'2024-08-06',150000.00000),(3,'COMPRAS',3,1,150000.00000,'2024-08-07',150000.00000),(4,'COMPRAS',4,1,50000.00000,'2024-08-07',50000.00000),(5,'COMPRAS',4,2,50000.00000,'2024-08-22',0.00000),(6,'COMPRAS',5,1,100000.00000,'2024-08-15',100000.00000),(7,'COMPRAS',6,1,100000.00000,'2024-08-15',0.00000),(8,'COMPRAS',7,1,142000.00000,'2024-08-16',142000.00000),(9,'COMPRAS',1,1,100000.00000,'2024-08-19',0.00000),(10,'COMPRAS',2,1,150000.00000,'2024-08-19',0.00000),(11,'COMPRAS',3,1,100000.00000,'2024-08-19',0.00000);
/*!40000 ALTER TABLE `ctas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuotas` (
  `id` int(11) NOT NULL,
  `cuota` varchar(200) NOT NULL,
  `tipoid` int(11) NOT NULL,
  `cuotas` int(11) NOT NULL,
  `irregular` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
INSERT INTO `cuotas` VALUES (1,'Contado CO 1 dia',1,1,0),(2,'Créidito CR 1,15 días',2,2,1),(3,'prueba',2,3,1);
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas_det`
--

DROP TABLE IF EXISTS `cuotas_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuotas_det` (
  `id` int(11) NOT NULL,
  `cuotaid` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `dias` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cuotaid` (`cuotaid`,`cuota`),
  CONSTRAINT `cuotas_det_ibfk_1` FOREIGN KEY (`cuotaid`) REFERENCES `cuotas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas_det`
--

LOCK TABLES `cuotas_det` WRITE;
/*!40000 ALTER TABLE `cuotas_det` DISABLE KEYS */;
INSERT INTO `cuotas_det` VALUES (1,2,1,0),(2,2,2,15),(3,3,1,10);
/*!40000 ALTER TABLE `cuotas_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositos` (
  `id` int(11) NOT NULL,
  `deposito` varchar(200) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
INSERT INTO `depositos` VALUES (1,'Interno','Valle Pyta, Yataity','0987854956');
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `tipoid` int(11) NOT NULL,
  `empresa` varchar(300) NOT NULL,
  `ruc` varchar(50) DEFAULT NULL,
  `ruc_dv` char(1) DEFAULT NULL,
  `actividadid` int(11) NOT NULL,
  `ciudadid` int(11) NOT NULL,
  `barrioid` int(11) NOT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actividadid` (`actividadid`),
  KEY `ciudadid` (`ciudadid`),
  KEY `barrioid` (`barrioid`),
  KEY `fk_empresa_tipo` (`tipoid`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`actividadid`) REFERENCES `actividades_economicas` (`id`),
  CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`ciudadid`) REFERENCES `ciudades` (`id`),
  CONSTRAINT `empresa_ibfk_3` FOREIGN KEY (`barrioid`) REFERENCES `barrios` (`id`),
  CONSTRAINT `fk_empresa_tipo` FOREIGN KEY (`tipoid`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,1,'Junta de Saneamiento Valle Pytã','5714271','8',1,1,1,'Valle Pytã','054140010','juntadesaneamientovallepyta@gmail.com'),(2,1,'Junta de Saneamiento Valle Pytã','5714271','8',1,1,1,'Valle Pytã','054140010','juntadesaneamientovallepyta@gmail.com');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Conectado'),(2,'Suspendido'),(3,'Desconectado'),(4,'Reconectado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_detalle` (
  `id` int(11) NOT NULL,
  `facturaid` int(11) NOT NULL,
  `productodetid` int(11) NOT NULL,
  `cantidad` decimal(15,5) NOT NULL,
  `precio` decimal(15,5) NOT NULL,
  `baseimponible` decimal(15,5) NOT NULL,
  `impuesto` decimal(15,5) NOT NULL,
  `total` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facturaid` (`facturaid`),
  KEY `productodetid` (`productodetid`),
  CONSTRAINT `factura_detalle_ibfk_1` FOREIGN KEY (`facturaid`) REFERENCES `facturas` (`id`),
  CONSTRAINT `factura_detalle_ibfk_2` FOREIGN KEY (`productodetid`) REFERENCES `productos2_det` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
INSERT INTO `factura_detalle` VALUES (1,1,1,1.00000,250000.00000,227273.00000,22727.00000,250000.00000),(2,2,2,1.00000,15000.00000,13636.00000,1364.00000,15000.00000),(3,3,2,1.00000,15000.00000,13636.00000,1364.00000,15000.00000),(4,4,1,1.00000,250000.00000,227273.00000,22727.00000,250000.00000),(5,5,2,1.00000,15000.00000,13636.00000,1364.00000,15000.00000),(6,6,1,1.00000,250000.00000,227273.00000,22727.00000,250000.00000),(7,7,2,1.00000,15000.00000,13636.00000,1364.00000,15000.00000),(8,8,2,1.00000,15000.00000,13636.00000,1364.00000,15000.00000),(9,9,1,1.00000,250000.00000,227273.00000,22727.00000,250000.00000),(10,10,2,1.00000,15000.00000,13636.00000,1364.00000,15000.00000);
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `clienteid` int(11) NOT NULL,
  `conexionid` int(11) NOT NULL,
  `condicionventa` int(11) NOT NULL,
  `cuotaid` int(11) NOT NULL,
  `monedaid` int(11) NOT NULL,
  `depositoid` int(11) NOT NULL,
  `talonarioid` int(11) NOT NULL,
  `nrodocumento` varchar(20) NOT NULL,
  `ciclomes` int(11) NOT NULL,
  `cicloano` int(11) NOT NULL,
  `vencimiento` date DEFAULT NULL,
  `totalfact` decimal(15,5) DEFAULT NULL,
  `totalgravada` decimal(15,5) DEFAULT NULL,
  `totalexenta` decimal(15,5) DEFAULT NULL,
  `totalbruto` decimal(15,5) DEFAULT NULL,
  `erssan` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteid` (`clienteid`),
  KEY `conexionid` (`conexionid`),
  KEY `cuotaid` (`cuotaid`),
  KEY `monedaid` (`monedaid`),
  KEY `depositoid` (`depositoid`),
  KEY `fk_talonario` (`talonarioid`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`id`),
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`conexionid`) REFERENCES `conexiones` (`id`),
  CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`cuotaid`) REFERENCES `cuotas` (`id`),
  CONSTRAINT `facturas_ibfk_4` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`),
  CONSTRAINT `facturas_ibfk_5` FOREIGN KEY (`depositoid`) REFERENCES `depositos` (`id`),
  CONSTRAINT `fk_talonario` FOREIGN KEY (`talonarioid`) REFERENCES `talonarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2024-08-18 00:00:00',1,1,1,1,1,1,1,'001-001-0037301',8,2024,'2024-08-18',250000.00000,22727.00000,0.00000,227273.00000,0.00000),(2,'2024-08-18 00:00:00',1,1,1,1,1,1,1,'001-001-0037302',8,2024,'2024-09-05',15000.00000,1364.00000,0.00000,13636.00000,0.00000),(3,'2024-09-19 00:00:00',1,1,1,1,1,1,1,'001-001-0037304',9,2024,'2024-10-05',15000.00000,1364.00000,0.00000,13636.00000,300.00000),(4,'2024-08-20 00:00:00',3,2,1,1,1,1,1,'001-001-0037305',8,2024,'2024-08-20',250000.00000,22727.00000,0.00000,227273.00000,0.00000),(5,'2024-08-20 00:00:00',3,2,1,1,1,1,1,'001-001-0037306',8,2024,'2024-09-05',15000.00000,1364.00000,0.00000,13636.00000,300.00000),(6,'2024-08-20 00:00:00',3,3,1,1,1,1,1,'001-001-0037307',8,2024,'2024-08-20',250000.00000,22727.00000,0.00000,227273.00000,0.00000),(7,'2024-08-20 00:00:00',3,3,1,1,1,1,1,'001-001-0037308',8,2024,'2024-09-05',15000.00000,1364.00000,0.00000,13636.00000,300.00000),(8,'2024-08-30 00:00:00',3,3,1,1,1,1,1,'001-001-0037309',9,2024,'2024-10-05',15000.00000,1364.00000,0.00000,13636.00000,300.00000),(9,'2024-08-20 00:00:00',1,4,1,1,1,1,1,'001-001-0037310',8,2024,'2024-08-20',250000.00000,22727.00000,0.00000,227273.00000,0.00000),(10,'2024-08-20 00:00:00',1,4,1,1,1,1,1,'001-001-0037311',8,2024,'2024-09-05',15000.00000,1364.00000,0.00000,13636.00000,300.00000);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmuebles` (
  `id` int(11) NOT NULL,
  `ctactectral` varchar(200) DEFAULT NULL,
  `ciudadid` int(11) NOT NULL,
  `barrioid` int(11) NOT NULL,
  `dirección` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ciudadid` (`ciudadid`),
  KEY `barrioid` (`barrioid`),
  CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`ciudadid`) REFERENCES `ciudades` (`id`),
  CONSTRAINT `inmuebles_ibfk_2` FOREIGN KEY (`barrioid`) REFERENCES `barrios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
INSERT INTO `inmuebles` VALUES (1,'12345',1,1,'Calle 789'),(2,'123456789l',1,2,'Calle 123'),(3,'122222',1,1,'11 yu'),(4,'77777',1,2,'54kjj'),(5,'898954',1,2,'Norte Esquina Sur'),(6,'6598723',1,2,'calle Cnel. José Félix Bogado');
/*!40000 ALTER TABLE `inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monedas`
--

DROP TABLE IF EXISTS `monedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monedas` (
  `id` int(11) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `abreviatura` char(5) DEFAULT NULL,
  `decimales` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abreviatura` (`abreviatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monedas`
--

LOCK TABLES `monedas` WRITE;
/*!40000 ALTER TABLE `monedas` DISABLE KEYS */;
INSERT INTO `monedas` VALUES (1,'Guaranies','Gs',0);
/*!40000 ALTER TABLE `monedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `fechaproceso` datetime DEFAULT NULL,
  `fechapago` datetime DEFAULT NULL,
  `proveedorid` int(11) NOT NULL,
  `monedaid` int(11) NOT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `totaldoc` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `totalpago` decimal(15,5) NOT NULL DEFAULT 0.00000,
  PRIMARY KEY (`id`),
  KEY `fkpagosprov` (`proveedorid`),
  KEY `fkpagosmon` (`monedaid`),
  CONSTRAINT `fkpagosmon` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`),
  CONSTRAINT `fkpagosprov` FOREIGN KEY (`proveedorid`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TR_INSERT_CAJA_DETALLE_POR_PAGOS AFTER INSERT ON PAGOS
FOR EACH ROW 
BEGIN   
DECLARE lsmsg TEXT;
DECLARE maxidcj INTEGER DEFAULT 0; 
DECLARE maxidcd INTEGER DEFAULT 0; 
	
		SELECT MAX(cj.id) INTO maxidcj FROM CAJA cj WHERE cj.cerrado=0 AND cj.montocierre=0;
	
		SELECT IFNULL(MAX(cd.id), 0) + 1 INTO maxidcd FROM CAJA_DETALLE cd;
    
	INSERT INTO CAJA_DETALLE(id, cajaid, tabla, tablaid, importe, monedaid)
	VALUES(maxidcd, maxidcj,'PAGOS', NEW.id, NEW.totalpago, NEW.monedaid );
    

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pagos_documentos`
--

DROP TABLE IF EXISTS `pagos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos_documentos` (
  `id` int(11) NOT NULL,
  `pagoid` int(11) NOT NULL,
  `ctaspagarid` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `importe` decimal(15,5) NOT NULL,
  `pagado` decimal(15,5) DEFAULT NULL,
  `monedaid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkpagoid` (`pagoid`),
  KEY `fkctaspagarid` (`ctaspagarid`),
  KEY `fkmonedaid` (`monedaid`),
  CONSTRAINT `fkctaspagarid` FOREIGN KEY (`ctaspagarid`) REFERENCES `ctas_pagar` (`id`),
  CONSTRAINT `fkmonedaid` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`),
  CONSTRAINT `fkpagoid` FOREIGN KEY (`pagoid`) REFERENCES `pagos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_documentos`
--

LOCK TABLES `pagos_documentos` WRITE;
/*!40000 ALTER TABLE `pagos_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos_documentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER TR_ACTUALIZAR_CTAS_PAGAR AFTER INSERT ON PAGOS_DOCUMENTOS
FOR EACH ROW 
BEGIN   
DECLARE lsmsg TEXT;

    UPDATE ctas_pagar
    SET importepagado = importepagado + NEW.pagado
    WHERE id = NEW.ctaspagarid; 

	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `id` int(11) NOT NULL,
  `conexion_pagoprimeracuota` int(11) DEFAULT NULL,
  `cuotaid` int(11) NOT NULL,
  `deudaagua` decimal(15,5) DEFAULT NULL,
  `cantconexion` int(11) NOT NULL,
  `cantreconexion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cuotaid` (`cuotaid`),
  CONSTRAINT `parametros_ibfk_1` FOREIGN KEY (`cuotaid`) REFERENCES `cuotas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (1,1,2,60000.00000,5,1);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos2`
--

DROP TABLE IF EXISTS `productos2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos2` (
  `id` int(11) NOT NULL,
  `producto` varchar(100) DEFAULT NULL,
  `gravada` decimal(15,5) DEFAULT NULL,
  `monedaid` int(11) NOT NULL,
  `servicio` int(11) NOT NULL,
  `fraccionable` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monedaid` (`monedaid`),
  CONSTRAINT `productos2_ibfk_1` FOREIGN KEY (`monedaid`) REFERENCES `monedas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos2`
--

LOCK TABLES `productos2` WRITE;
/*!40000 ALTER TABLE `productos2` DISABLE KEYS */;
INSERT INTO `productos2` VALUES (1,'Conexion de Agua',10.00000,1,1,1,1),(2,'Ser. Agua Potable',10.00000,1,1,1,1),(3,'Corte de césped',10.00000,1,1,0,1),(4,'Cano conexion',10.00000,1,1,1,1);
/*!40000 ALTER TABLE `productos2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos2_det`
--

DROP TABLE IF EXISTS `productos2_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos2_det` (
  `id` int(11) NOT NULL,
  `productoid` int(11) NOT NULL,
  `categoriaid` int(11) NOT NULL,
  `tamanoid` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productoid` (`productoid`),
  KEY `categoriaid` (`categoriaid`),
  KEY `tamanoid` (`tamanoid`),
  CONSTRAINT `productos2_det_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `productos2` (`id`),
  CONSTRAINT `productos2_det_ibfk_2` FOREIGN KEY (`categoriaid`) REFERENCES `conexion_categorias` (`id`),
  CONSTRAINT `productos2_det_ibfk_3` FOREIGN KEY (`tamanoid`) REFERENCES `tamanos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos2_det`
--

LOCK TABLES `productos2_det` WRITE;
/*!40000 ALTER TABLE `productos2_det` DISABLE KEYS */;
INSERT INTO `productos2_det` VALUES (1,1,1,2,250000),(2,2,3,4,15000),(3,3,3,5,100000),(4,4,3,4,150000);
/*!40000 ALTER TABLE `productos2_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `proveedor` varchar(100) NOT NULL,
  `ruc` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudaddepartamento` varchar(100) NOT NULL,
  `celular` int(11) NOT NULL,
  `tipoprovid` varchar(100) NOT NULL,
  `fechaingreso` date NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruc` (`ruc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Sión SRL','12345678','Acceso Norte 1','Villarrica, Guairá',986858789,'2','2024-05-30',1),(2,'Electric','456879-7','Al Norte','Caaguazú - Cnel. Oviedo',987546123,'1','2024-06-13',1),(3,'LyL','789456-2','Al Este','Mondra, Villarrica',987456123,'1','2024-06-13',1),(4,'Fortaleza y Poder','777777-7','Acceso al Norte','Villarrica - Guairá',987456245,'1','2024-06-14',1),(5,'Gardinería Topo','4265481-1','Esquina los jardines','Yataity-Guairá',986458265,'1','2024-07-31',1),(6,'Tigre SA','6896532-5','Tte. Fariña','Cnel. Oviedo - Caaguazú',986321487,'2','2024-08-16',1);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Tesorero'),(3,'Cajero');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talonarios`
--

DROP TABLE IF EXISTS `talonarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talonarios` (
  `id` int(11) NOT NULL,
  `tipodocid` int(11) NOT NULL,
  `timbrado` int(11) NOT NULL,
  `vence` date NOT NULL,
  `serieempresa` int(11) NOT NULL,
  `seriecaja` int(11) NOT NULL,
  `nrodesde` int(11) NOT NULL,
  `nrohasta` int(11) NOT NULL,
  `nrousado` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipoid` (`tipodocid`,`timbrado`,`serieempresa`,`seriecaja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talonarios`
--

LOCK TABLES `talonarios` WRITE;
/*!40000 ALTER TABLE `talonarios` DISABLE KEYS */;
INSERT INTO `talonarios` VALUES (1,1,16419750,'2024-06-30',1,1,37300,37400,37311,1),(2,2,123,'2024-05-22',1,11,100,200,101,1);
/*!40000 ALTER TABLE `talonarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanos`
--

DROP TABLE IF EXISTS `tamanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamanos` (
  `id` int(11) NOT NULL,
  `tamano` varchar(100) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanos`
--

LOCK TABLES `tamanos` WRITE;
/*!40000 ALTER TABLE `tamanos` DISABLE KEYS */;
INSERT INTO `tamanos` VALUES (1,'1/2\"',1),(2,'3/4\"',1),(3,'1\"',1),(4,'sin tamaño',1),(5,'15x30 m.',1),(6,'2 m',1),(7,'5 m',1);
/*!40000 ALTER TABLE `tamanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'SRL');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documentos`
--

DROP TABLE IF EXISTS `tipo_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documentos` (
  `id` int(11) NOT NULL,
  `tipodocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documentos`
--

LOCK TABLES `tipo_documentos` WRITE;
/*!40000 ALTER TABLE `tipo_documentos` DISABLE KEYS */;
INSERT INTO `tipo_documentos` VALUES (1,'Factura'),(2,'Recibo de Dinero');
/*!40000 ALTER TABLE `tipo_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nrocedula` varchar(50) NOT NULL,
  `nrocelular` varchar(15) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `barrioid` int(11) NOT NULL,
  `rolid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `barrioid` (`barrioid`),
  KEY `rolid` (`rolid`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`barrioid`) REFERENCES `barrios` (`id`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`rolid`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'María Gloria','Barreto Martínez','5586072','0985689745','g','c4ca4238a0b923820dcc509a6f75849b','Activo',2,1),(2,'Fátima','Barreto','5897456','0985986523','f','c4ca4238a0b923820dcc509a6f75849b','Activo',2,2),(3,'Cris','Martínez','1458968','0998564123','c','c4ca4238a0b923820dcc509a6f75849b','Activo',2,3),(4,'Juan','Gutierrez','5698321','0968321568','Gut','c4ca4238a0b923820dcc509a6f75849b','Activo',1,2),(5,'Gabriela','Samudio','5897632','0976987563','Gabi','202cb962ac59075b964b07152d234b70','Activo',1,3),(6,'Ana','Vaz','5698321','0975987896','Ana','68053af2923e00204c3ca7c6a3150cf7','Activo',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-21 20:37:19
