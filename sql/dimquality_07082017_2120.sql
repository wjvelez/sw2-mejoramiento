-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-08-2017 a las 06:41:47
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dimquality`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `persona` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `user`, `password`, `persona`, `correo`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrador', 'imera92@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `subtotal` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id` int(11) NOT NULL,
  `usuario` varchar(128) NOT NULL,
  `tecnico` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `asunto` varchar(200) NOT NULL,
  `estado` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadotransaccion`
--

CREATE TABLE `estadotransaccion` (
  `id` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariotecnico`
--

CREATE TABLE `horariotecnico` (
  `id` int(11) NOT NULL,
  `tecnico` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemtransaccion`
--

CREATE TABLE `itemtransaccion` (
  `id` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `transaccion` int(11) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`) VALUES
(1, 'LG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertasubasta`
--

CREATE TABLE `ofertasubasta` (
  `id` int(11) NOT NULL,
  `subasta` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `imagen` varchar(60) NOT NULL,
  `pvp` decimal(8,2) NOT NULL,
  `descripcion` text,
  `estado` int(1) NOT NULL,
  `stock` int(4) NOT NULL,
  `destacado` int(1) NOT NULL,
  `fechaCreacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `marca`, `categoria`, `codigo`, `imagen`, `pvp`, `descripcion`, `estado`, `stock`, `destacado`, `fechaCreacion`) VALUES
(1, 'Lavadora Digital 16 Kg. Turbo Drum Blanca / Tapa d', 'LG', 'LAVADORAS', 'LG-WF-SL1632EK', 'default.png', '623.84', '', 1, 1, 0, NULL),
(2, 'Lavadora Digital 16 Kg. Turbo Drum Plata / Tapa de', 'LG', 'LAVADORAS', 'LG-WF-S1634EK', 'default.png', '704.50', '', 1, 1, 0, NULL),
(3, 'SECADORA DE ROPA A GAS DE 19Kg', 'LG', 'SECADORAS DE ROPA', 'LG-DLG1002W', 'default.png', '596.95', '', 1, 1, 0, NULL),
(4, 'SECADORA DE ROPA A GAS DE 21Kg - BLANCA - CONVERTI', 'LG', 'SECADORAS DE ROPA', 'LG-DT21WS', 'default.png', '605.01', '', 1, 1, 0, NULL),
(5, 'REFRIG. DE  13,5 PIES NF / DOS PUERTAS / SMART INV', 'LG', 'REFRIGERADORAS', 'LG-GT32WPP', 'default.png', '705.85', '', 1, 1, 0, NULL),
(6, 'REFRIG. DE  15 PIES NF / DOS PUERTAS / DIAGNOSTICO', 'LG', 'REFRIGERADORAS', 'LG-GT40WGP', 'default.png', '824.16', '', 1, 1, 0, NULL),
(7, 'Refrig S&S 23 pies Titanium Moving Ice Maker - LED', 'LG', 'REFRIGERADORAS', 'LG-GS65MPP1', 'default.png', '1.00', '', 1, 1, 0, NULL),
(8, 'Refrig S&S 23 pies Titanium con Disp. de agua y hi', 'LG', 'REFRIGERADORAS', 'LG-GS65SPP1', 'default.png', '1.00', '', 1, 1, 0, NULL),
(9, '0', 'LG', 'REFRIGERADORAS', 'AIRES ACONDICIONADOS ', 'default.png', '0.00', '', 1, 0, 0, NULL),
(10, 'A/C SPLIT 12.000 BTU BASICO', 'LG', 'REFRIGERADORAS', 'LG-SP122CE', 'default.png', '664.17', '', 1, 1, 0, NULL),
(11, 'A/C SPLIT 18.000 BTU ECONO INVERTER', 'LG', 'REFRIGERADORAS', 'LG-VM182CS', 'default.png', '1.00', '', 1, 1, 0, NULL),
(12, 'A/C SPLIT 12.000 BTU ECONO INVERTER', 'LG', 'REFRIGERADORAS', 'LG-VM122C6', 'default.png', '798.62', '', 1, 1, 0, NULL),
(13, 'A/C SPLIT 18.000 BTU ECONO INVERTER', 'LG', 'REFRIGERADORAS', 'LG-VM182C6', 'default.png', '1.00', '', 1, 1, 0, NULL),
(14, 'A/C SPLIT 24.000 BTU ECONO INVERTER', 'LG', 'REFRIGERADORAS', 'LG-VM242C6', 'default.png', '1.00', '', 1, 1, 0, NULL),
(15, 'TUBERIA PARA DE AC VR122CL', 'LG', 'REFRIGERADORAS', 'LG-SQ060905D01', 'default.png', '67.22', '', 1, 1, 0, NULL),
(16, 'MICRO. 1,1pies PANTALLA LED / TOUCH / SILVER MENU ', 'LG', 'MICROONDAS', 'LG-MS1140S', 'default.png', '193.60', '', 1, 1, 0, NULL),
(17, 'MICRO. 1,1pies PANTALLA LED / TOUCH / BLANCO MENU ', 'LG', 'MICROONDAS', 'LG-MS1142GWA', 'default.png', '176.13', '', 1, 1, 0, NULL),
(18, 'EQ. SONIDO 3.000 / DUAL USB / ECUALIZADOR LATINO /', 'LG', 'AUDIO', 'LG-CM4350', 'default.png', '274.27', '', 1, 1, 0, NULL),
(19, 'EQ. SONIDO 5.000 / DUAL USB / ECUALIZADOR LATINO /', 'LG', 'AUDIO', 'LG-CM4450', 'default.png', '287.72', '', 1, 1, 0, NULL),
(20, 'EQ. SONIDO 5.000 / AUTO DJ / DUAL USB / ECUALIZADO', 'LG', 'AUDIO', 'LG-CM4460', 'default.png', '301.16', '', 1, 1, 0, NULL),
(21, 'EQ. SONIDO 8.000 / DUAL USB / ECUALIZADOR LATINO /', 'LG', 'AUDIO', 'LG-CM4550', 'default.png', '342.84', '', 1, 1, 0, NULL),
(22, 'EQ. SONIDO 8.000 / DUAL USB / ECUALIZADOR LATINO /', 'LG', 'AUDIO', 'LG-CM4560', 'default.png', '348.22', '', 1, 1, 0, NULL),
(23, 'EQ. SONIDO 11.000 / X BOOM  BLUETOOTH/ DUAL USB / ', 'LG', 'AUDIO', 'LG-CM4750', 'default.png', '442.33', '', 1, 1, 0, NULL),
(24, 'EQ. SONIDO 12.000 / DUAL USB / ECUALIZADOR LATINO ', 'LG', 'AUDIO', 'LG-CM5760', 'default.png', '469.22', '', 1, 1, 0, NULL),
(25, 'PARLANTE AMPLIFICADO 3.500W / BLUETOOTH / DOBLE US', 'LG', 'AUDIO', 'LG-OM5540', 'default.png', '442.33', '', 1, 1, 0, NULL),
(26, 'PARLANTE AMPLIFICADO 4.800W / BLUETOOTH + NFC / DO', 'LG', 'AUDIO', 'LG-OM5541', 'default.png', '517.62', '', 1, 1, 0, NULL),
(27, '0', 'LG', 'AUDIO', 'TELEVISORES ', 'default.png', '0.00', '', 1, 0, 0, NULL),
(28, 'DVD / USB / MP3', 'LG', 'AUDIO', 'LG-DP132', 'default.png', '56.47', '', 1, 1, 0, NULL),
(29, 'DVD / GRABA A USB / ESCANEO PROGRESIVO /  DivX / K', 'LG', 'AUDIO', 'LG-DP547', 'default.png', '61.85', '', 1, 1, 0, NULL),
(30, 'GAFAS 3D', 'LG', 'AUDIO', 'LG-AG-F316', 'default.png', '5.38', '', 1, 1, 0, NULL),
(31, 'CONTRO REMOTO PARA PANTALLAS SMART SERIE LA', 'LG', 'AUDIO', 'LG-ANMR400', 'default.png', '25.54', '', 1, 1, 0, NULL),
(32, 'CONTRO REMOTO PARA PANTALLAS SMART - CONTROL DE VO', 'LG', 'AUDIO', 'LG-ANMR600', 'default.png', '38.99', '', 1, 1, 0, NULL),
(33, 'TELEVISOR LED 32"  HD SMART TV / 2 HDMI / USB', 'LG', 'AUDIO', 'LG-32LH600B', 'default.png', '547.20', '', 1, 1, 0, NULL),
(34, 'TELEVISOR LED 42" SMART TV / FULL HD / MODO FUTBOL', 'LG', 'AUDIO', 'LG-42LB5800', 'default.png', '873.91', '', 1, 1, 0, NULL),
(35, 'TELEVISOR LED 42" SMART SHARE / MAGIC REMOTE / PAN', 'LG', 'AUDIO', 'LG-42LF5850', 'default.png', '873.91', '', 1, 1, 0, NULL),
(36, 'TELEVISOR LED 43" SMART TV / FULL HD', 'LG', 'AUDIO', 'LG-43LH6000', 'default.png', '887.35', '', 1, 1, 0, NULL),
(37, 'TELEVISOR LED DE 47" FULL HD / 3 HDMI / SENSOR INT', 'LG', 'AUDIO', 'LG-47LS4600', 'default.png', '1.00', '', 1, 1, 0, NULL),
(38, 'TELEVISOR LED 47" SMART TV / FULL HD / MODO FUTBOL', 'LG', 'AUDIO', 'LG-47LB5800', 'default.png', '1.00', '', 1, 1, 0, NULL),
(39, 'TELEVISOR LED 49" SMART TV / FULL HD - LOCAL', 'LG', 'AUDIO', 'LG-49LH6000', 'default.png', '1.00', '', 1, 1, 0, NULL),
(40, 'TELEVISOR LED 49" 4K SMART TV / ULTRA HD / TRIPLE ', 'LG', 'AUDIO', 'LG-49UB7000', 'default.png', '1.00', '', 1, 1, 0, NULL),
(41, 'TELEVISOR LED 55" SMART TV / FULL HD - LOCAL', 'LG', 'AUDIO', 'LG-55LH6000', 'default.png', '1.00', '', 1, 1, 0, NULL),
(42, 'TABLET  7" BLANCA - WIFI - PANTALLA FULL HD - MEM.', 'LG', 'TABLETS', 'LG-LGV400.AMIAWN', 'default.png', '264.86', '', 1, 1, 0, NULL),
(43, 'TABLET  8,3" NEGRO  - WIFI - Procesador Quad Core ', 'LG', 'TABLETS', 'LG-LGV480.AMIABK', 'default.png', '293.09', '', 1, 1, 0, NULL),
(44, 'TABLET  8" BLANCA - WIFI-LTE 4G - Procesador Quad ', 'LG', 'TABLETS', 'LG-LGV490W', 'default.png', '465.19', '', 1, 1, 0, NULL),
(45, 'TABLET  8" NEGRA - WIFI -LTE 4G Procesador Quad Co', 'LG', 'TABLETS', 'LG-LGV490B', 'default.png', '465.19', '', 1, 1, 0, NULL),
(46, 'TABLET  10" NEGRO - WIFI - PANTALLA FULL HD - MEM.', 'LG', 'TABLETS', 'LG-LGV700.AMIABK', 'default.png', '423.51', '', 1, 1, 0, NULL),
(47, 'TABLET  10" BLANCA - WIFI - PANTALLA FULL HD - MEM', 'LG', 'TABLETS', 'LG-LGV700.AMIAWH', 'default.png', '423.51', '', 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocarrito`
--

CREATE TABLE `productocarrito` (
  `producto` int(11) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `fecha_insert` datetime NOT NULL,
  `carrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurarcontraseña`
--

CREATE TABLE `restaurarcontraseña` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `token` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subasta`
--

CREATE TABLE `subasta` (
  `id` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `producto` int(11) NOT NULL,
  `precioBase` decimal(8,2) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `id` int(11) NOT NULL,
  `fechaCompra` datetime NOT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `estado` int(11) NOT NULL,
  `FormaPago` int(11) NOT NULL,
  `NombreFactura` char(100) NOT NULL,
  `CedulaFactura` char(10) NOT NULL,
  `DireccionFactura` char(100) NOT NULL,
  `EntregaDomicilio` tinyint(1) NOT NULL,
  `NombreEntrega` int(100) NOT NULL,
  `DireccionEntrega` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `user` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cedula` varchar(13) NOT NULL,
  `ciudad` varchar(60) DEFAULT NULL,
  `provincia` varchar(60) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `carrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `user`, `password`, `nombre`, `apellido`, `email`, `cedula`, `ciudad`, `provincia`, `direccion`, `telefono`, `carrito`) VALUES
(1, 'imera92', 'eb675e6ee4ac3b943552670add77285b', 'Iván Alejandro', 'Mera Maldonado', 'imera92@gmail.com', '0924166127', '', '', 'Guayacanes Mz. 211 V. 10', '0981617261', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `estadotransaccion`
--
ALTER TABLE `estadotransaccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `itemtransaccion`
--
ALTER TABLE `itemtransaccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `ofertasubasta`
--
ALTER TABLE `ofertasubasta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `restaurarcontraseña`
--
ALTER TABLE `restaurarcontraseña`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indices de la tabla `subasta`
--
ALTER TABLE `subasta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estadotransaccion`
--
ALTER TABLE `estadotransaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `itemtransaccion`
--
ALTER TABLE `itemtransaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
