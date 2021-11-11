#!/usr/bin/php
<?php

/* **************************************************************************************** *
 * sync.php : A handy, self-contained, interactive PHP script that can synchronize          *
 * between a Prestashop database and a local custom one.                                    *
 * ---------------------------------------------------------------------------------------- *
 * This software is licensed under the GNU GPLv3, for more information,                     *
 * consult the included "COPYING" file.                                                     *
 * **************************************************************************************** */

// CONSTANTS & GLOBALS
const MYSQL_USERNAME = 'root';
const MYSQL_PASSWORD = '';
const ROASTER_DB_NAME = 'torrefacteur';
const PRESTASHOP_DB_NAME = 'prestashop';

// - Roaster DB Interface ------------------------------------------------------------ //

class Model_Roaster
{
	private PDO $connection;

	public function __construct()
	{
		$this->connection = new PDO(
			'mysql:host=127.0.0.1;dbname='. ROASTER_DB_NAME . ';charset=UTF8',
			MYSQL_USERNAME,
			MYSQL_PASSWORD,
			array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
	}

	// -------------------- //
	// Products-related CRD //
	// -------------------- //

	public function products_select_all() : array
	{
		$request = $this->connection->prepare('SELECT * FROM `produit`;');
		$request->execute();
		return $request->fetchAll(PDO::FETCH_ASSOC);
	}

	public function products_add(int $tva_id, int $category_id, string $name,
								string $description, float $price, string $images=null) : int
	{
		$request = $this->connection->prepare('
			INSERT INTO `produit` (`id_tva`, `id_categorie`, `nom`, `description`, `pu_ht`, `images`) VALUES
			(
				:paramTVAID,
				:paramCategoryID,
				:paramName,
				:paramDesc,
				:paramPrice,
				:paramImages
			);
		');
		$request->bindParam('paramTVAID', $tva_id);
		$request->bindParam('paramCategoryID', $category_id);
		$request->bindParam('paramName', $name);
		$request->bindParam('paramDesc', $description);
		$request->bindParam('paramPrice', $price);
		$request->bindParam('paramImages', $images);
		$request->execute();

		// Return the inserted item's new ID
		return $this->connection->lastInsertId();
	}

	public function products_delete_by_id(int $id) : void
	{
		$request = $this->connection->prepare('
			DELETE `produit`.*
			FROM `produit`
			WHERE id_produit = :paramID;
		');
		$request->bindParam('paramID', $id);
		$request->execute();
	}

	// -------------------- //
	// Category-related CRD //
	// -------------------- //

	public function categories_select_all() : array
	{
		$request = $this->connection->prepare('SELECT * FROM `categorie`;');
		$request->execute();
		return $request->fetchAll(PDO::FETCH_ASSOC);
	}

	public function categories_add(string $nom, string $description) : int
	{
		$request = $this->connection->prepare('
			INSERT INTO `categorie` (`nom`, `description`) VALUES
			(
				:paramNom,
				:paramDescription
			);
		');
		$request->bindParam('paramNom', $nom);
		$request->bindParam('paramDescription', $description);
		$request->execute();

		// Return the inserted item's new ID
		return $this->connection->lastInsertId();
	}

	public function categories_delete_by_ID(int $id) : void
	{
		$request = $this->connection->prepare('
			DELETE categorie.*
			FROM `categorie`
			WHERE categorie.id_categorie = :paramID;
		');
		$request->bindParam('paramID', $id);
		$request->execute();
	}

	// --------------- //
	// VAT-related CRD //
	// --------------- //

	public function tva_select_all() : array
	{
		$request = $this->connection->prepare('
			SELECT *
			FROM `tva`;
		');
		$request->execute();
		return $request->fetchAll(PDO::FETCH_ASSOC);
	}

	public function tva_add(float $vat_value) : int
	{
		$request = $this->connection->prepare('
			INSERT INTO `tva` (`taux_tva`) VALUES
			(
					:paramTVAID
			);
		');
		$request->bindParam('paramTVAID', $vat_value);
		$request->execute();

		// Return the inserted item's new ID
		return $this->connection->lastInsertId();
	}

	public function tva_delete_by_ID(int $id) : void
	{
		$request = $this->connection->prepare('
			DELETE *
			FROM `tva`
			WHERE id_tva = :paramTVAID;
		');
		$request->execute();
	}
}

// - Prestashop DB Interface --------------------------------------------------- //

class Model_Prestashop
{
	private PDO $connection;

	public function __construct()
	{
		$this->connection = new PDO(
			'mysql:host=127.0.0.1;dbname='. PRESTASHOP_DB_NAME . ';charset=UTF8',
			MYSQL_USERNAME,
			MYSQL_PASSWORD,
			array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
		);
	}

	// ------------------- //
	// Products-related R* //
	// ------------------- //

	public function products_select_all() : array
	{
		$request = $this->connection->prepare('
			SELECT *
			FROM `ps_product`;
		');
		$request->execute();
		return $request->fetchAll(PDO::FETCH_ASSOC);
	}

	// --------------------- //
	// Categories-related R* //
	// --------------------- //

	public function categories_select_all() : array
	{
		$request = $this->connection->prepare('
			SELECT *
			FROM `ps_category_lang`;
		');
		$request->execute();
		return $request->fetchAll(PDO::FETCH_ASSOC);
	}

	public function categories_varieties_select_all() : array
	{
		$request = $this->connection->prepare('
			SELECT *
			FROM `ps_category_product`;
		');
		$request->execute();
		return $request->fetchAll(PDO::FETCH_ASSOC);
	}
}

// - General-purpose utilities -------------------------------------------------- //

function echo_title(string $title) : void
{
	echo '=== ' . $title . ' ===' . PHP_EOL;
}

function echo_error(string $error) : void
{
	echo '(!) Error' . PHP_EOL;
	echo '    Description - ' . $error . PHP_EOL;
}

// ---------------------------------------------------------------------------- //

function main() : void
{
	// Entry point
	echo_title('Running pre-transaction checks');

	// We're gonna check if we have a valid connection between the two databases
	try
	{
		$PS_DB_connection = new Model_Prestashop();
		$CR_DB_connection = new Model_Roaster();
	}
	catch (Exception $e)
	{
		echo_error('Unable to initiate a database connection, check your environment and script constants.');
		die(1);
	}

	// At that point the databases are good.
	echo 'Initiated database connection !' . PHP_EOL;

	var_dump(products_select($CR_DB_connection));

}

main();