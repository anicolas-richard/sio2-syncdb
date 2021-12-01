<?php

class Model_Prestashop
{
  private PDO $connection;

  public function __construct(string $mysql_username, string $mysql_password, string $prestashop_db_name)
  {
    $this->connection = new PDO(
      'mysql:host=127.0.0.1;dbname='. $prestashop_db_name . ';charset=UTF8',
      $mysql_username,
      $mysql_password,
      array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
    );
  }

  // ------------------- //
  // Products-related R* //
  // ------------------- //

  public function products_select_all() : array
  {
    $request = $this->connection->prepare('
      SELECT pl.*, pr.price AS price
      FROM `ps_product_lang` pl INNER JOIN `ps_product` pr ON pl.id_product = pr.id_product;
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

  public function categories_select_names() : array
  {
    $request = $this->connection->prepare('SELECT `name` FROM `ps_category_lang`;');
    $request->execute();
    return $request->fetchAll(PDO::FETCH_COLUMN);
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

  public function attributes_select_all() : array
  {
    $request = $this->connection->prepare('
      SELECT *
      FROM `ps_attribute_lang`;
    ');

    $request->execute();
    return $request->fetchAll(PDO::FETCH_ASSOC);
  }

  public function product_attributes_select_all() : array
  {
    $request = $this->connection->prepare('
      SELECT *
      FROM `ps_product_attribute`;
    ');

    $request->execute();
    return $request->fetchAll(PDO::FETCH_ASSOC);
  }

  public function product_select_id_by_name(string $name) : int
  {
    $request = $this->connection->prepare('
      SELECT id_product
      FROM `ps_profile_lang`
      WHERE `name` = :paramName;
    ');

    $request->bindParam('paramName', $name);
    $request->execute();
    return $request->fetch();
  }

  public function product_attributes_select_all_joined_products() : array
  {
    $request = $this->connection->prepare('
      SELECT DISTINCT pa.id_product, pa.price, p.name AS product_name, al.name AS attribute_name
      FROM `ps_product_attribute` pa
        INNER JOIN `ps_product_lang` p ON pa.id_product = p.id_product
        INNER JOIN `ps_layered_product_attribute` lpa ON lpa.id_product = p.id_product
        INNER JOIN `ps_attribute_lang` al ON al.id_attribute = lpa.id_attribute;
    ');

    $request->execute();
    return $request->fetchAll(PDO::FETCH_ASSOC);
  }
}
