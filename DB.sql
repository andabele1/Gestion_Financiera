CREATE TABLE Bolsillo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE, -- Nombre del bolsillo (ej, banco, nequi, etc.)
    saldo DECIMAL(15, 2) NOT NULL -- Saldo disponible en el bolsillo
);

CREATE TABLE Meta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NOT NULL,
    valor_fijo DECIMAL(15, 2) NOT NULL,
    valor_de_cuota DECIMAL(15, 2) NOT NULL,
    fecha_de_creacion_de_meta DATE NOT NULL,
    banco_id INT, -- FK que referencia a la tabla Bolsillo
    FOREIGN KEY (banco_id) REFERENCES Bolsillo(id) ON DELETE SET NULL
);

CREATE TABLE Pago (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    monto DECIMAL(15, 2) NOT NULL,
    fecha DATETIME NOT NULL,
    banco_id INT, -- FK que referencia a la tabla Bolsillo
    FOREIGN KEY (banco_id) REFERENCES Bolsillo(id) ON DELETE SET NULL
);

CREATE TABLE Extractos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(15, 2) NOT NULL,
    fecha DATETIME NOT NULL,
    descripcion TEXT NOT NULL,
    banco_id INT, -- FK que referencia a la tabla Bolsillo
    meta_id INT, -- FK que referencia a la tabla Meta
    pago_id INT, -- FK que referencia a la tabla Pago
    FOREIGN KEY (banco_id) REFERENCES Bolsillo(id) ON DELETE SET NULL,
    FOREIGN KEY (meta_id) REFERENCES Meta(id) ON DELETE SET NULL,
    FOREIGN KEY (pago_id) REFERENCES Pago(id) ON DELETE SET NULL
);

