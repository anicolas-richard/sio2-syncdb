<?php

class Model_Roaster
{
  private PDO $connection;

  public function __construct(string $mysql_username, string $mysql_password, string $roaster_db_name)
  {
    $this->connection = new PDO(
      'mysql:host=127.0.0.1;dbname='. $roaster_db_name . ';charset=UTF8',
      $mysql_username,
      $mysql_password,
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

  public function products_add(int $tva_id, int $category_id, string $name, string $description, float $price, string $images=null) : int
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

    // Bindings
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

  public function categories_select_names() : array
  {
    $request = $this->connection->prepare('SELECT `nom` FROM `categorie`;');
    $request->execute();
    return $request->fetchAll(PDO::FETCH_COLUMN);
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
    /**
     * Adds a VAT item into the table
     * Returning the last inserted ID.
     */

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
