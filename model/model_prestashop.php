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
}
