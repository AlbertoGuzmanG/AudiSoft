
-- Indicadores

-- Cartera de Préstamos
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-PR-A15', 'Préstamos sumatoria garantía no cumple con las políticas.', 'Identificar préstamos de vehículos cancelados o saldados cuya póliza de seguro aún esté activa.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-PR-A05', 'Préstamos Garantía Certificado PXP', 'Verificar si existen préstamos del tipo PXP (con garantía de certificados), cuyas tasas de interés estén por debajo de lo establecido por el CAP.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-PR-A11', 'Préstamos Vehículo Sin Garantía Prendarias', 'Verificar si existen préstamos de vehículos cuyas garantías sean prendarias y no estén a nombre del deudor.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-PR-A20', 'Préstamos LD Sin Fórmula Capital e Interés.', 'Verificar si existen préstamos bajo el límite discrecional otorgados sin la fórmula de pago Capital e Interés.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-PR-53', 'Préstamos LD no desembolso en la cuenta del cliente', 'Préstamos LD no desembolso en la cuenta del cliente.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-PR-22', 'Préstamos Hipotecarios Sin Póliza Vida o Incendio', 'Identificar los Préstamos hipotecarios que no tengan póliza de vida o incendio.');


-- Tarjetas de Crédito
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-TC-264', 'TC que exceden 80% Monto Garantizado', 'Identificar las Tarjetas de Crédito con garantía de depósitos que exceden en más de un 80% el monto de la garantía.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-TC-400', 'Comisiones no Cobradas en TC', 'Identifica las tarjetas a las cuales no les ha sido cobrado el cargo por emisión. ');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-TC-398', 'Cargos Duplicados en Tarjetas de Crédito', 'Identifica los cargos por emisión y mantenimiento que fueron cargados varias veces al cliente');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-TC-354', 'Avance efectivo TC no reflejados Cadencie.', 'Identifica los avances de efectivo realizados a través de netbanking y que no fueron aplicados en CADENCIE.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-TC-316', 'Avance Credimás vía Netbanking no Reflejados en CADENCIE.', 'Identifica los credimás realizados a través de netbanking que no fueron registrados en CADENCIE.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-TC-272', 'TC Garantizadas Activas con Cuotas Vencidas', 'Identifica las tarjetas de crédito otorgadas con garantías que tienen cuotas vencidas.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-MAY-11-17', 'Tarjeta de Crédito con total disponibilidad consumido en 15 Días', 'Evalúa las tarjetas colocadas, cuyo comportamiento exhibe  indicios de fraudes.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-MAY-10-17', 'Tarjetas castigadas por ejecutivo del último año.', 'Realiza un análisis de los gestores que tienen un alto % de colocaciones castigadas.');

-- Cartera de Pasivas
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-AH-CC-A02', 'Cuentas Activas Más 3-10 Años sin Movimiento', 'Identificar si se existen cuentas de ahorro activas sin ejecutar ningún movimiento durante un transcurso de 3 años o inactivas que no han sido transferidas al Banco central luego de tener 10 años sin movimientos.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-AH-CC-207', 'Comisiones después de tres años sin actividad', 'Identificar transacciones por concepto de comisiones a cuentas que tengan más de tres años de inactividad.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-CD-70', 'Incorrecta Penalización de Certificados', 'Identificar las penalizaciones que se han realizado de forma incorrecto.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-AH-CC-432', 'Cobro incorrecto Comisión por Balance Mínimo', 'Identifica las cuentas de ahorros y corrientes a las cuales se les realizaron cargos por balance mínimo no acorde a lo establecido en el tarifario.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-AH-CC-422', 'Cobro incorrecto comisión 180 días sin movimientos', 'Identifica las comisiones que son cobradas a las cuentas inactivas con más de 180 días en incumplimiento a lo establecido por la superintendencia de Bancos.');


-- Indicios de Fraude
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-DIC-12-15',  'Fallecidos en la JCE con movimientos en el banco sin excluir que existan un poder.', 'Identifican los clientes reportados como fallecidos en la JCE a los cuales se les están realizando movimientos.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-BR-FR-201', 'Transacciones de cuentas ociosas a cuentas personales.', 'Identifica transacciones realizadas desde cuentas con mucho tiempo de inactividad a cuentas de empleados.');
INSERT INTO `dashboard_indicator` (`code`, `name`, `description`) VALUES ('DAC-JUL-01-17', 'Fraude Cobro de Comisión Retiros por Caja Menores de 10 Mil.', 'Identifica los cajeros que cobran las comisiones por retiros menores de 10 mil y la depositan en su cuenta.');
  



-- Categorias
INSERT INTO `dashboard_category` (`name`, `description`) VALUES ('Cartera de Préstamos', 'Contiene todos los indicadores relacionados con la cartera de préstamos activos del Banco. ');
INSERT INTO `dashboard_category` (`name`, `description`) VALUES ('Tarjetas de Crédito', 'Esta categoría agrupa los indicadores relacionados con los controles vinculados a tarjetas de crédito');
INSERT INTO `dashboard_category` (`name`, `description`) VALUES ('Cartera de Pasivas', 'Esta categoría agrupa los indicadores relacionados con las cuentas de ahorros, corrientes y certificados');
INSERT INTO `dashboard_category` (`name`, `description`) VALUES ('Indicios de Fraude', 'Agrupa las pruebas que identifican situaciones que resultaron ser fraudulentas y que pudieran ameritar investigación');


-- Peso de las categorías
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (35, 1, 1);
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (35, 1, 2);
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (25, 2, 1);
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (25, 2, 2);
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (15, 3, 1);
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (15, 3, 2);
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (25, 4, 1);
INSERT INTO `dashboard_categoryweight` (`weight`, `category_id`, `indicator_type_id`) VALUES (25, 4, 2);



-- Peso de los indicadores en las categorías
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (18, 1, 1, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (18, 1, 1, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 2, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 2, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (18, 1, 3, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (18, 1, 3, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 4, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 4, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 5, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 5, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 6, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (16, 1, 6, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 7, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 7, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 8, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 8, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 9, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 9, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (14, 2, 10, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (14, 2, 10, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (14, 2, 11, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (14, 2, 11, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 12, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 12, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 13, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 13, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 14, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (12, 2, 14, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 15, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 15, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 16, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 16, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 17, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 17, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 18, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 18, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 19, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (20, 3, 19, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (34, 4, 20, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (34, 4, 20, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (33, 4, 21, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (33, 4, 21, 2);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (33, 4, 22, 1);
INSERT INTO `dashboard_indicatorcategory` (`weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES (33, 4, 22, 2);
