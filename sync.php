#!/usr/bin/php
<?php

/** *************************************************************************************** *
 * sync.php : A handy, interactive PHP script that can synchronize                          *
 * between a Prestashop database and a local custom one.                                    *
 * ---------------------------------------------------------------------------------------- *
 * This software is licensed under the GNU GPLv3, for more information,                     *
 * consult the included "COPYING" file.                                                     *
 * **************************************************************************************** */

/**
 * The prestashop database is not included,
 * as I have not gotten permission to include it in the project.
 * Still, the custom local database can be found under the 'db' directory.
 */
 // Bugfix Part #1
 // Bugfix Part #2

// IMPORTS
require_once 'model/model_prestashop.php';
require_once 'model/model_roaster.php';
require_once 'utils/format.php';
require_once 'utils/exit_codes.php';

// CONSTANTS & GLOBALS
const PHP_SCRIPT_VERSION = 'indev';
const MYSQL_USERNAME = 'root';
const MYSQL_PASSWORD = '';
const ROASTER_DB_NAME = 'pg_afterwork';
const PRESTASHOP_DB_NAME = 'pg_prestashop_full';

// - General-purpose utilities -------------------------------------------------- //

function main() : void
{
  echo_info('<init> Running pre-transaction checks');

  // Object instanciation establishes a connection to its database
  try
  {
    $Prestashop_DB_connection = new Model_Prestashop(MYSQL_USERNAME, MYSQL_PASSWORD, PRESTASHOP_DB_NAME);
    $Roaster_DB_connection = new Model_Roaster(MYSQL_USERNAME, MYSQL_PASSWORD, ROASTER_DB_NAME);
  }
  catch (Exception $e)
  {
    echo_error($e);
    die(PHP_EXIT_ERROR_INIT);
  }
  
  // At that point the databases are good.
  echo_info('<init> Initiated database connection !');
  
  // Fetch variants from Upstream + local
  echo_info('<prepare> Fetching : local    : variants...');
  $local_variants = $Roaster_DB_connection->variants_select_all();
  echo_info('<prepare> Fetching : upstream : variants...');
  $upstream_variants = $Prestashop_DB_connection->attributes_select_all();

  // Fetch categories from Upstream + local
  echo_info('<prepare> Fetching : local    : categories...');
  $local_categories_names = array_values($Roaster_DB_connection->categories_select_names());
  echo_info('<prepare> Fetching : upstream : categories...');
  $upstream_categories_names = array_values($Prestashop_DB_connection->categories_select_names());

  // Fetch products from Upstream + local
  echo_info('<prepare> Fetching : local    : products...');
  $local_products = $Roaster_DB_connection->products_select_all();
  echo_info('<prepare> Fetching : upstream : products...');
  $upstream_products = $Prestashop_DB_connection->products_select_all();

  // Fetch products-variants associations from Upstream + local
  echo_info('<prepare> Fetching : local    : products-variants...');
  $local_products_variants = $Roaster_DB_connection->products_variants_select_all_joined_products();
  echo_info('<prepare> Fetching : upstream : products-variants...');
  $upstream_products_variants = $Prestashop_DB_connection->product_attributes_select_all_joined_products();

  // We're gonna check for variants first
  echo_title('<transaction> [Delete Downstream] on [variants]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');
  $rows_deleted = 0;

  // Delete local variants which are not stored upstream
  foreach ($local_variants as $local_variant_line)
  {
    $has_match = false;
    foreach ($upstream_variants as $upstream_variant_line)
    {
      if ($local_variant_line['nom'] == $upstream_variant_line['name'])
      {
        $has_match = true;
        break;
      }
    }

    if (!$has_match)
    {
      $should_delete = $yes_all ? true : user_prompt('The local variant \'' . $local_variant_line['nom'] . '\' (' . $local_variant_line['id_declinaison'] . ') is not stored upstream. Do you want to delete it ?');
      if ($should_delete)
      {
        $rows_deleted++;
        $Roaster_DB_connection->variants_delete_by_id_cascade($local_variant_line['id_declinaison']);
        echo_info('Local variant \'' . $local_variant_line['nom'] . '\' has been recursively deleted.');
      }
      else
      {
        echo_info('Skipping...');
      }
    }
  }

  echo_info('Deleted ' . $rows_deleted . ' local variants.');

  echo_title('<transaction> [Upstream->Downstream] on [variants]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');

  // Add upstream variants that are not downstream
  // NOTE : The loop's flow is different than before so it's not really DRY compatible...
  foreach ($upstream_variants as $upstream_variant_line)
  {
    $has_match = false;
    foreach ($local_variants as $local_variant_line)
    {
      if ($upstream_variant_line['name'] == $local_variant_line['nom'])
      {
        $has_match = true;
        break;
      }
    }

    if (!$has_match)
    {
      $should_add = $yes_all ? true : user_prompt('The upstream variant \'' . $upstream_variant_line['name'] . '\' is not stored locally. Do you want to add it ?');
      if ($should_add)
      {
        $description = $yes_all ? 'No description' : user_input('Enter the new variant\'s description');
        $Roaster_DB_connection->variants_add($upstream_variant_line['name'], $description);
        echo_info('Upstream variant \'' . $upstream_variant_line['name'] . '\' has been added locally.');
      }
      else
      {
        echo_info('Skipping...');
      }
    }
    else
    {
      echo_info('Variant \'' . $upstream_variant_line['name'] . '\' has already been synced. Skipping...');
    }
  }

  // Add corresponding products-attributes locally, hard to do tho
  // foreach
  
  // TODO

  echo_title('<transaction> [Upstream->Downstream] on [categories]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');

  foreach ($Prestashop_DB_connection->categories_select_all() as $ps_category_line)
  {
    if ( ! in_array($ps_category_line['name'], $local_categories_names))
    {
      $answer = $yes_all ? true : user_prompt('The category ' . $ps_category_line['name'] . ' is not in local database, would you like to add it ?');

      if ($answer)
      {
        $category_value = user_input('Enter the category description for category \'' . $ps_category_line['name'] . '\'');
        $Roaster_DB_connection->categories_add($ps_category_line['name'], $category_value);
        echo_info('The local category has been added.');
      }
      else
      {
        echo_info('Skipping...');
      }
    }
    else
    {
      echo_info('Category \'' . $ps_category_line['name'] . '\' has already been synced. Skipping...');
    }
  }

  echo_title('<transaction> [Delete Downstream] on [categories]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');
  $rows_deleted = 0;

  // See if we locally have a category that doesn't exist upstream
  foreach ($Roaster_DB_connection->categories_select_all() as $local_categories_line)
  {
    if ( ! in_array($local_categories_line['nom'], $upstream_categories_names))
    {
      $answer = $yes_all ? true : user_prompt('The category ' . $local_categories_line['nom'] . ' is not stored upstream, do you want to delete it ?');

      if ($answer)
      {
        $rows_deleted++;
        $Roaster_DB_connection->categories_delete_by_ID($local_categories_line['id_categorie']);
        echo_info('Local category \'' . $local_categories_line['nom'] . '\' has been removed.');
      }
      else
      {
        echo_info('Skipping...');
      }
    }
  }

  echo_info('Deleted ' . $rows_deleted . ' local categories.');

  // Remove local products that are not stored upstream
  echo_title('<transaction> [Delete Downstream] on [products]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');
  $rows_deleted = 0;

  foreach ($local_products as $local_product_line)
  {
    $has_match = false;

    foreach ($upstream_products as $upstream_product_line)
    {
      if ($local_product_line['nom'] == $upstream_product_line['name'])
      {
        $has_match = true;
        break;
      }
    }

    if (!$has_match)
    {
      $should_delete = $yes_all ? true : user_prompt('Local product \'' . $local_product_line['nom'] . '\' is not stored upstream, do you want to delete it ?');
      if ($should_delete)
      {
        $rows_deleted++;
        $Roaster_DB_connection->products_delete_by_id_cascade($local_product_line['id_produit']);
        echo_info('Local product \'' . $local_product_line['nom'] . '\' has been removed.');
      }
      else
      {
        echo_info('Skipping...');
      }
    }
    else
    {
      echo_info('Local product \'' . $local_product_line['nom'] . '\' has already been synced. Skipping...');
    }
  }

  echo_info('Deleted ' . $rows_deleted . ' local products.');

  // Add products from upstream
  echo_title('<transaction> [Upstream->Downstream] on [products]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');
  $rows_added = 0;
  foreach ($upstream_products as $upstream_product_line)
  {
    $has_match = false;
    foreach ($local_products as $local_product_line)
    {
      if ($upstream_product_line['name'] == $local_product_line['nom'])
      {
        $has_match = true;
        break;
      }
    }

    if (!$has_match)
    {
      $should_add = $yes_all ? true : user_prompt('Upstream product \'' . $upstream_product_line['name'] .'\' is not in local database, do you want to add it ?');
      if ($should_add)
      {
        $rows_added++;
        $Roaster_DB_connection->products_add(name: $upstream_product_line['name'], description: $upstream_product_line['description'], price: $upstream_product_line['price']);
        echo_info('Local product \'' . $upstream_product_line['name'] . '\' has been added.');
      }
    }
  }

  echo_info('Added ' . $rows_added . ' local products.');
  
  /* 
  // BUG It's broken and it's late, I'm tired and gonna fix this some day.

  // Add local variants associations not upstream.
  echo_title('<transaction> [Upstream->Downstream] on [products-variants]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');
  $rows_deleted = 0;
  foreach ($local_products_variants as $local_product_variant_line)
  {
    $has_match = false;
    foreach ($upstream_products_variants as $upstream_product_variant_line)
    {
      if (   $upstream_product_variant_line['product_name']   == $local_product_variant_line['nom_produit']
          && $upstream_product_variant_line['attribute_name'] == $local_product_variant_line['nom_declinaison']
          && $upstream_product_variant_line['price']          == $local_product_variant_line['prix'])
      {
        $has_match = true;
        break;
      }
    }

    if (!$has_match)
    {
      $should_delete = $yes_all ? true : user_prompt('Local variant is not in upstream database, do you want to remove it ?');
      
      if ($should_delete)
      {
        $Roaster_DB_connection->products_variants_delete($local_product_line['id_produit'], $local_product_line['id_declinaison']);
        echo_info('Upstream variant (\'' . $upstream_product_variant_line['product_name'] . '/' . $upstream_product_variant_line['attribute_name'] . '\') has been added.');
        $rows_deleted++;
      }
    }
    else
    {
      echo_info('Product variant is already synced.');
    }
  }

  echo_info('Removed ' . $rows_deleted . ' products-variants');

  echo_title('<transaction> [Delete Downstream] on [products-variants]');
  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');
  foreach ($upstream_products_variants as $upstream_product_variant_line)
  {
    $has_match = false;
    foreach ($local_products_variants as $local_product_variant_line)
    {
      if (   $upstream_product_variant_line['product_name']   == $local_product_variant_line['nom_produit']
          && $upstream_product_variant_line['attribute_name'] == $local_product_variant_line['nom_declinaison']
          && $upstream_product_variant_line['price']          == $local_product_variant_line['prix'])
      {
        $has_match = true;
        break;
      }
    }

    if (!$has_match)
    {
      $should_add = $yes_all ? true : user_prompt('Upstream variant (\'' . $upstream_product_variant_line['product_name'] . '/' . $upstream_product_variant_line['attribute_name'] . '\') is not in local database, do you want to add it ?');
      $product_id = $Roaster_DB_connection->product_select_id_by_name($upstream_product_variant_line['product_name'])['nom'];
      $category_id = $Roaster_DB_connection->categories_select_id_by_name($upstream_product_variant_line['attribute_name'])['nom'];
      $Roaster_DB_connection->products_variants_add(
        $product_id,
        $category_id,
        $upstream_product_variant_line['price']
      );
      echo_info('Upstream variant (\'' . $upstream_product_variant_line['product_name'] . '/' . $upstream_product_variant_line['attribute_name'] . '\') has been added.');
    }
    else
    {
      echo_info('Product variant is already synced.');
    }
  } */
}

echo_title('Syncdb - version ' . PHP_SCRIPT_VERSION);
echo_title('Welcome!');
echo PHP_EOL;
echo '-- Start Global variables' . PHP_EOL;
echo '  `\__ MYSQL_USERNAME    : ' . MYSQL_USERNAME . PHP_EOL;
echo '  `\__ MYSQL_PASSWORD    : ' . MYSQL_PASSWORD . PHP_EOL;
echo '  `\__ UPSTREAM_DATABASE : ' . PRESTASHOP_DB_NAME . PHP_EOL;
echo '  `\__ LOCAL_DATABASE    : ' . ROASTER_DB_NAME . PHP_EOL;
echo '-- End Global variables' . PHP_EOL;
echo PHP_EOL;
echo_info('LICENSING : Please note that this software is licensed under the GNU GPLv3.');
echo_info('LICENSING : More information is available in the file \'COPYING\'');
echo PHP_EOL;

if (user_prompt('Would you like to execute this software ?'))
{
  main();
  echo_info('Job finished.');
  exit(PHP_EXIT_OK);
}
