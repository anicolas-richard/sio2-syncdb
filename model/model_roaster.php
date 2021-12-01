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

  public function products_add(int $tva_id=null, int $category_id=null, string $name, string $description, float $price, string $images=null) : int
  {
    /**
     * Adds a new product to the database.
     */

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
    /**
     * Returns a column of category names from the database
     */

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
    /**
     * Returns all vat-related information
     */

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

  public function categories_delete_by_ID_cascade(int $category_id) : void
  {
    /**
     * Very destructive way of deleting a category,
     * It will remove any subsequent products and/or variants
     * that would be related to that category.
     */
    
    // First delete the variants
    $request = $this->connection->prepare('
      DELETE pd.*
      FROM `produit_declinaison` pd INNER JOIN `produit` p ON pd.id_produit=p.id_produit
      WHERE id_categorie = :paramIDCategory;
    ');
    $request->bindParam('paramIDCategory', $category_id);
    $request->execute();

    // Delete the products linked to the category
    $request = $this->connection->prepare('
      DELETE *
      FROM `produit`
      WHERE id_categorie = :paramIDCategory;
    ');
    $request->bindParam('paramIDCategory', $category_id);
    $request->execute();

    // Delete the category
    $request = $this->connection->prepare('
      DELETE c.*
      FROM `categorie` c
      WHERE id_categorie = :paramIDCategory;
    ');
    $request->bindParam('paramIDCategory', $category_id);
    $request->execute();
  }

  public function products_variants_select_all_joined_products() : array
  {
    /**
     * Returns all local products-variants intermediate table
     */

    $request = $this->connection->prepare('
      SELECT pd.*, p.nom AS nom_produit, de.nom AS nom_declinaison
      FROM `produit_declinaison` pd
        INNER JOIN `produit` p ON pd.id_produit = p.id_produit
        INNER JOIN `declinaison` de ON de.id_declinaison = pd.id_declinaison;
    ');
    $request->execute();
    return $request->fetchAll(PDO::FETCH_ASSOC);
  }

  public function variants_select_all() : array
  {
    /**
     * Returns all local variants
     */

    $request = $this->connection->prepare('
      SELECT *
      FROM `declinaison`
    ');
    $request->execute();
    return $request->fetchAll(PDO::FETCH_ASSOC);
  }

  public function variants_delete_by_id_cascade(int $variant_id) : void
  {
    /**
     * Deletes a variant from its table the destructive way.
     * Also deletes any related products to it.
     * Caveat Emptor.
     */

    $request = $this->connection->prepare('
      DELETE FROM `produit_declinaison`
      WHERE `produit_declinaison`.`id_declinaison` = :paramIDDec;

      DELETE FROM `declinaison`
      WHERE `declinaison`.`id_declinaison` = :paramIDDec;
    ');
    $request->bindParam('paramIDDec', $variant_id);
    $request->execute();
  }

  public function variants_add(string $name, string $description = 'No description') : int
  {
    /**
     * Inserts a new variant into the database
     */

    $request = $this->connection->prepare('
      INSERT INTO `declinaison` (`nom`, `description`) VALUES
      (
        :paramName,
        :paramDesc
      );
    ');

    $request->bindParam('paramName', $name);
    $request->bindParam('paramDesc', $description);

    $request->execute();
    return $this->connection->lastInsertId();
  }

  public function products_variants_add(int $product_id, int $variant_id, float $price) : int
  {
    /**
     * Inserts a new product-variant association into the database (w/ custom price)
     */

    $request = $this->connection->prepare('
      INSERT INTO `produit_declinaison` (`id_produit`, `id_declinaison`, `prix`) VALUES
      (
        :paramIDProduct,
        :paramIDVariant,
        :paramIDPrice
      );
    ');

    $request->bindParam('paramIDProduct', $product_id);
    $request->bindParam('paramIDVariant', $variant_id);
    $request->bindParam('paramIDPrice', $price);

    $request->execute();
    return $this->connection->lastInsertId();
  }

  public function products_delete_by_id_cascade(int $product_id) : void
  {
    /**
     * Recursively deletes a product from the database
     * Caveat Emptor.
     */

    $request = $this->connection->prepare('
      DELETE FROM `produit_declinaison`
      WHERE `produit_declinaison`.`id_produit` = :paramIDProd;

      DELETE FROM `produit`
      WHERE `produit`.`id_produit` = :paramIDProd;
    ');
    $request->bindParam('paramIDProd', $product_id);
    $request->execute();
  }

  public function product_select_id_by_name(string $name) : array
  {
    $request = $this->connection->prepare('
      SELECT id_produit
      FROM `produit`
      WHERE `nom` = :paramName;
    ');

    $request->bindParam('paramName', $name);
    $request->execute();
    return $request->fetch();
  }

  public function categories_select_id_by_name(string $name) : array
  {
    $request = $this->connection->prepare('
      SELECT id_categorie
      FROM `categorie`
      WHERE `nom` = :paramName;
    ');

    $request->bindParam('paramName', $name);
    $request->execute();
    return $request->fetch();
  }

  public function products_variants_delete(int $product_id, int $category_id)
  {
    $request = $this->connection->prepare('
      DELETE FROM `produit_declinaison`
      WHERE `produit_declinaison`.`id_produit` = :paramIDProd;
      AND `produit_declinaison`.`id_declinaison` = :paramIDCat
    ');
    $request->bindParam('paramIDProd', $product_id);
    $request->bindParam('paramIDCat', $category_id);
    $request->execute();
  }
}
