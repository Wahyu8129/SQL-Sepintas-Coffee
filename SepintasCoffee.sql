CREATE SCHEMA sepintascoffee;

CREATE  TABLE sepintascoffee.alat ( 
	id_alat              INT    NOT NULL   PRIMARY KEY,
	nama_alat            VARCHAR(255)       ,
	jenis                VARCHAR(255)       ,
	kondisi              VARCHAR(255)       ,
	jumlah               INT       ,
	supplier             VARCHAR(255)       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE  TABLE sepintascoffee.karyawan ( 
	id_karyawan          INT    NOT NULL   PRIMARY KEY,
	nama                 VARCHAR(255)       ,
	posisi               VARCHAR(255)       ,
	gaji                 DECIMAL(10,2)       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE  TABLE sepintascoffee.menu ( 
	id_menu              INT    NOT NULL   PRIMARY KEY,
	nama_menu            VARCHAR(255)       ,
	harga                DECIMAL(10,2)       ,
	jenis                VARCHAR(255)       ,
	CONSTRAINT idx_menu_nama UNIQUE ( nama_menu ) 
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE  TABLE sepintascoffee.pelanggan ( 
	id_pelanggan         INT    NOT NULL   PRIMARY KEY,
	nama                 VARCHAR(255)       ,
	no_telepon           VARCHAR(20)       ,
	email                VARCHAR(255)       ,
	CONSTRAINT idx_pelanggan_email UNIQUE ( email ) ,
	CONSTRAINT idx_pelanggan_no_telepon UNIQUE ( no_telepon ) 
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE  TABLE sepintascoffee.pesanan ( 
	id_pesanan           INT    NOT NULL   PRIMARY KEY,
	id_pelanggan         INT       ,
	tanggal_pesanan      DATE       ,
	jumlah               INT       ,
	id_menu              INT       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE INDEX id_pelanggan ON sepintascoffee.pesanan ( id_pelanggan );

CREATE INDEX id_menu ON sepintascoffee.pesanan ( id_menu );

CREATE  TABLE sepintascoffee.stok_bahan ( 
	id_bahan             INT    NOT NULL   PRIMARY KEY,
	nama_bahan           VARCHAR(255)       ,
	jumlah               INT       ,
	supplier             VARCHAR(255)       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE  TABLE sepintascoffee.pembayaran ( 
	id_pembayaran        INT    NOT NULL   PRIMARY KEY,
	id_pesanan           INT       ,
	metode_pembayaran    VARCHAR(50)       ,
	status               VARCHAR(50)       
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE INDEX id_pesanan ON sepintascoffee.pembayaran ( id_pesanan );

ALTER TABLE sepintascoffee.pembayaran ADD CONSTRAINT pembayaran_ibfk_1 FOREIGN KEY ( id_pesanan ) REFERENCES sepintascoffee.pesanan( id_pesanan ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sepintascoffee.pesanan ADD CONSTRAINT pesanan_ibfk_1 FOREIGN KEY ( id_pelanggan ) REFERENCES sepintascoffee.pelanggan( id_pelanggan ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE sepintascoffee.pesanan ADD CONSTRAINT pesanan_ibfk_2 FOREIGN KEY ( id_menu ) REFERENCES sepintascoffee.menu( id_menu ) ON DELETE NO ACTION ON UPDATE NO ACTION;
