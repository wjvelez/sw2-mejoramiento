-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2017 a las 06:09:59
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

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
-- Estructura de tabla para la tabla `apikeys`
--

CREATE TABLE `apikeys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `subtotal` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `subtotal`) VALUES
(1, '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriacita`
--

CREATE TABLE `categoriacita` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoriacita`
--

INSERT INTO `categoriacita` (`id`, `nombre`) VALUES
(1, 'Portatiles'),
(2, 'Celulares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriaproducto`
--

INSERT INTO `categoriaproducto` (`id`, `nombre`) VALUES
(4, 'AIRES ACONDICIONADOS '),
(6, 'AUDIO'),
(1, 'LAVADORAS'),
(5, 'MICROONDAS'),
(3, 'REFRIGERADORAS'),
(2, 'SECADORAS DE ROPA'),
(8, 'TABLETS'),
(7, 'TELEVISORES ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id` int(11) NOT NULL,
  `usuario` varchar(128) NOT NULL,
  `tecnico` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `asunto` varchar(200) NOT NULL,
  `estado` int(1) NOT NULL DEFAULT '0',
  `fechaFin` datetime DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita2`
--

CREATE TABLE `cita2` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `ubicacion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cita2`
--

INSERT INTO `cita2` (`id`, `usuario`, `fecha`, `ubicacion`, `descripcion`, `estado`) VALUES
(1, 1, '2017-09-22', 'local', 'tablet dañada, pantalla no responde', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citamensajes`
--

CREATE TABLE `citamensajes` (
  `id` int(11) NOT NULL,
  `cita` int(11) NOT NULL,
  `mensaje` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_transaccion`
--

CREATE TABLE `estado_transaccion` (
  `id` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_transaccion`
--

INSERT INTO `estado_transaccion` (`id`, `estado`) VALUES
(1, 'Pendiente'),
(2, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id`, `nombre`) VALUES
(1, 'Depósito'),
(2, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariotecnico`
--

CREATE TABLE `horariotecnico` (
  `id` int(11) NOT NULL,
  `tecnico` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `dia` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horariotecnico`
--

INSERT INTO `horariotecnico` (`id`, `tecnico`, `horaInicio`, `horaFin`, `dia`) VALUES
(1, 1, '09:00:00', '17:00:00', 1),
(2, 1, '09:00:00', '17:00:00', 2),
(3, 2, '09:00:00', '17:00:00', 3),
(4, 2, '09:00:00', '17:00:00', 4);

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
  `marca` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
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
(1, 'Lavadora Digital 16 Kg. Turbo Drum Blanca / Tapa d', 1, 1, 'LG-WF-SL1632EK', '', '1623.84', '', 2, 0, 2, '2017-08-20'),
(2, 'SECADORA DE ROPA A GAS DE 19Kg', 1, 2, 'LG-DLG1002W', '', '596.95', '', 2, 0, 2, '2017-08-20'),
(3, 'SECADORA DE ROPA A GAS DE 21Kg - BLANCA - CONVERTI', 1, 2, 'LG-DT21WS', '', '605.01', '', 2, 0, 2, '2017-08-20'),
(4, 'REFRIG. DE  13,5 PIES NF / DOS PUERTAS / SMART INV', 1, 3, 'LG-GT32WPP', '', '705.85', '', 1, 45, 2, '2017-08-20'),
(5, 'REFRIG. DE  15 PIES NF / DOS PUERTAS / DIAGNOSTICO', 1, 3, 'LG-GT40WGP', '', '824.16', '', 1, 2, 2, '2017-08-20'),
(6, 'Refrig S&S 23 pies Titanium Moving Ice Maker - LED', 1, 3, 'LG-GS65MPP1', '', '1578.41', '', 2, 0, 2, '2017-08-20'),
(7, 'Refrig S&S 23 pies Titanium con Disp. de agua y hi', 1, 3, 'LG-GS65SPP1', '', '1827.14', '', 1, 1, 2, '2017-08-20'),
(8, 'A/C SPLIT 12.000 BTU BASICO', 1, 4, 'LG-SP122CE', '', '664.17', '', 1, 50, 2, '2017-08-20'),
(9, 'A/C SPLIT 18.000 BTU ECONO INVERTER', 1, 4, 'LG-VM182CS', '', '1054.07', '', 1, 2, 2, '2017-08-20'),
(10, 'A/C SPLIT 12.000 BTU ECONO INVERTER', 1, 4, 'LG-VM122C6', '', '798.62', '', 1, 56, 2, '2017-08-20'),
(11, 'A/C SPLIT 18.000 BTU ECONO INVERTER', 1, 4, 'LG-VM182C6', '', '1027.18', '', 1, 1, 2, '2017-08-20'),
(12, 'A/C SPLIT 24.000 BTU ECONO INVERTER', 1, 4, 'LG-VM242C6', '', '1195.24', '', 1, 56, 2, '2017-08-20'),
(13, 'TUBERIA PARA DE AC VR122CL', 1, 4, 'LG-SQ060905D01', '', '67.22', '', 1, 10, 2, '2017-08-20'),
(14, 'MICRO. 1,1pies PANTALLA LED / TOUCH / SILVER MENU ', 1, 5, 'LG-MS1140S', '', '193.60', '', 2, 0, 2, '2017-08-20'),
(15, 'MICRO. 1,1pies PANTALLA LED / TOUCH / BLANCO MENU ', 1, 5, 'LG-MS1142GWA', '', '176.13', '', 2, 0, 2, '2017-08-20'),
(16, 'EQ. SONIDO 3.000 / DUAL USB / ECUALIZADOR LATINO /', 1, 6, 'LG-CM4350', '', '274.27', '', 2, 0, 2, '2017-08-20'),
(17, 'EQ. SONIDO 5.000 / DUAL USB / ECUALIZADOR LATINO /', 1, 6, 'LG-CM4450', '', '287.72', '', 2, 0, 2, '2017-08-20'),
(18, 'EQ. SONIDO 5.000 / AUTO DJ / DUAL USB / ECUALIZADO', 1, 6, 'LG-CM4460', '', '301.16', '', 1, 1, 2, '2017-08-20'),
(19, 'EQ. SONIDO 8.000 / DUAL USB / ECUALIZADOR LATINO /', 1, 6, 'LG-CM4550', '', '342.84', '', 2, 0, 2, '2017-08-20'),
(20, 'EQ. SONIDO 8.000 / DUAL USB / ECUALIZADOR LATINO /', 1, 6, 'LG-CM4560', '', '348.22', '', 2, 0, 2, '2017-08-20'),
(21, 'EQ. SONIDO 11.000 / X BOOM  BLUETOOTH/ DUAL USB / ', 1, 6, 'LG-CM4750', '', '442.33', '', 2, 0, 2, '2017-08-20'),
(22, 'EQ. SONIDO 12.000 / DUAL USB / ECUALIZADOR LATINO ', 1, 6, 'LG-CM5760', '', '469.22', '', 1, 6, 2, '2017-08-20'),
(23, 'PARLANTE AMPLIFICADO 3.500W / BLUETOOTH / DOBLE US', 1, 6, 'LG-OM5540', '', '442.33', '', 1, 34, 2, '2017-08-20'),
(24, 'PARLANTE AMPLIFICADO 4.800W / BLUETOOTH + NFC / DO', 1, 6, 'LG-OM5541', '', '517.62', '', 1, 6, 2, '2017-08-20'),
(25, 'DVD / USB / MP3', 1, 7, 'LG-DP132', '', '56.47', '', 1, 1, 2, '2017-08-20'),
(26, 'DVD / GRABA A USB / ESCANEO PROGRESIVO /  DivX / K', 1, 7, 'LG-DP547', '', '61.85', '', 1, 1, 2, '2017-08-20'),
(27, 'GAFAS 3D', 1, 7, 'LG-AG-F316', '', '5.38', '', 1, 10, 2, '2017-08-20'),
(28, 'CONTRO REMOTO PARA PANTALLAS SMART SERIE LA', 1, 7, 'LG-ANMR400', '', '25.54', '', 2, 0, 2, '2017-08-20'),
(29, 'CONTRO REMOTO PARA PANTALLAS SMART - CONTROL DE VO', 1, 7, 'LG-ANMR600', '', '38.99', '', 1, 344, 2, '2017-08-20'),
(30, 'TELEVISOR LED 32\"  HD SMART TV / 2 HDMI / USB', 1, 7, 'LG-32LH600B', '', '547.20', '', 1, 4, 2, '2017-08-20'),
(31, 'TELEVISOR LED 42\" SMART TV / FULL HD / MODO FUTBOL', 1, 7, 'LG-42LB5800', '', '873.91', '', 1, 1, 2, '2017-08-20'),
(32, 'TELEVISOR LED 42\" SMART SHARE / MAGIC REMOTE / PAN', 1, 7, 'LG-42LF5850', '', '873.91', '', 2, 0, 2, '2017-08-20'),
(33, 'TELEVISOR LED 43\" SMART TV / FULL HD', 1, 7, 'LG-43LH6000', '', '887.35', '', 1, 5, 2, '2017-08-20'),
(34, 'TELEVISOR LED DE 47\" FULL HD / 3 HDMI / SENSOR INT', 1, 7, 'LG-47LS4600', '', '1048.69', '', 2, 0, 2, '2017-08-20'),
(35, 'TELEVISOR LED 47\" SMART TV / FULL HD / MODO FUTBOL', 1, 7, 'LG-47LB5800', '', '1118.60', '', 1, 14, 2, '2017-08-20'),
(36, 'TELEVISOR LED 49\" SMART TV / FULL HD - LOCAL', 1, 7, 'LG-49LH6000', '', '1113.22', '', 2, 0, 2, '2017-08-20'),
(37, 'TELEVISOR LED 49\" 4K SMART TV / ULTRA HD / TRIPLE ', 1, 7, 'LG-49UB7000', '', '1289.35', '', 1, 1, 2, '2017-08-20'),
(38, 'TELEVISOR LED 55\" SMART TV / FULL HD - LOCAL', 1, 7, 'LG-55LH6000', '', '1387.50', '', 2, 0, 2, '2017-08-20'),
(39, 'TABLET  7\" BLANCA - WIFI - PANTALLA FULL HD - MEM.', 1, 8, 'LG-LGV400.AMIAWN', '', '264.86', '', 2, 0, 2, '2017-08-20'),
(40, 'TABLET  8,3\" NEGRO  - WIFI - Procesador Quad Core ', 1, 8, 'LG-LGV480.AMIABK', '', '293.09', '', 1, 13, 2, '2017-08-20'),
(41, 'TABLET  8\" BLANCA - WIFI-LTE 4G - Procesador Quad ', 1, 8, 'LG-LGV490W', '', '465.19', '', 2, 0, 2, '2017-08-20'),
(42, 'TABLET  8\" NEGRA - WIFI -LTE 4G Procesador Quad Co', 1, 8, 'LG-LGV490B', '', '465.19', '', 1, 1, 2, '2017-08-20'),
(43, 'TABLET  10\" NEGRO - WIFI - PANTALLA FULL HD - MEM.', 1, 8, 'LG-LGV700.AMIABK', '', '423.51', '', 1, 2, 2, '2017-08-20'),
(44, 'TABLET  10\" BLANCA - WIFI - PANTALLA FULL HD - MEM', 1, 8, 'LG-LGV700.AMIAWH', '', '423.51', '', 1, 5, 2, '2017-08-20');

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
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha_creac` date NOT NULL,
  `fecha_cita` date NOT NULL,
  `asunto` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ubicacion` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id`, `usuario`, `fecha_creac`, `fecha_cita`, `asunto`, `ubicacion`, `estado`) VALUES
(1, 1, '2017-09-18', '2017-09-19', 'refrigeradora no funciona adecuadamente', 'domicilio', 'nueva'),
(2, 1, '2017-09-17', '2017-09-19', 'asunto 2', 'local', 'nueva'),
(3, 1, '2017-09-20', '2017-09-22', 'tablet dañada', 'local', 'aceptada');

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
  `estado` int(1) NOT NULL,
  `ganador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subasta`
--

INSERT INTO `subasta` (`id`, `fechaInicio`, `fechaFin`, `producto`, `precioBase`, `estado`, `ganador`) VALUES
(1, '2017-08-17 00:00:00', '2017-08-31 05:00:00', 13, '20.00', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `nombre`, `correo`) VALUES
(1, 'tecnico1', 't1@dq.com'),
(2, 'tecnico2', 't2@dq.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_entrega`
--

CREATE TABLE `tipo_entrega` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_entrega`
--

INSERT INTO `tipo_entrega` (`id`, `nombre`) VALUES
(1, 'Retiro en Local'),
(2, 'Entrega a Domicilio');

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
  `formaPago` int(11) NOT NULL,
  `nombreFactura` char(100) NOT NULL,
  `cedulaFactura` char(10) NOT NULL,
  `direccionFactura` char(100) NOT NULL,
  `tipoEntrega` int(11) NOT NULL,
  `recibe` varchar(100) NOT NULL,
  `direccionEntrega` varchar(100) NOT NULL
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
(1, 'imera92', 'eb675e6ee4ac3b943552670add77285b', 'Ivan', 'Mera', 'imera92@gmail.com', '0924166127', NULL, NULL, 'Guayacanes', '0981617261', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apikeys`
--
ALTER TABLE `apikeys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoriacita`
--
ALTER TABLE `categoriacita`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cita2`
--
ALTER TABLE `cita2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `citamensajes`
--
ALTER TABLE `citamensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_transaccion`
--
ALTER TABLE `estado_transaccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horariotecnico`
--
ALTER TABLE `horariotecnico`
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
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subasta`
--
ALTER TABLE `subasta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_entrega`
--
ALTER TABLE `tipo_entrega`
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
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `apikeys`
--
ALTER TABLE `apikeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `categoriacita`
--
ALTER TABLE `categoriacita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cita2`
--
ALTER TABLE `cita2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `citamensajes`
--
ALTER TABLE `citamensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado_transaccion`
--
ALTER TABLE `estado_transaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `horariotecnico`
--
ALTER TABLE `horariotecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
-- AUTO_INCREMENT de la tabla `ofertasubasta`
--
ALTER TABLE `ofertasubasta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `subasta`
--
ALTER TABLE `subasta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_entrega`
--
ALTER TABLE `tipo_entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
