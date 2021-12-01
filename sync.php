#!/usr/bin/php
<?php

/** *************************************************************************************** *
 * sync.php : A handy, self-contained, interactive PHP script that can synchronize          *
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

// IMPORTS
require_once 'model/model_prestashop.php';
require_once 'model/model_roaster.php';
require_once 'utils/format.php';
require_once 'utils/exit_codes.php';

// CONSTANTS & GLOBALS
const MYSQL_USERNAME = 'root';
const MYSQL_PASSWORD = '';
const ROASTER_DB_NAME = 'pg_afterwork';
const PRESTASHOP_DB_NAME = 'pg_prestashop';

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
    echo_error('Unable to initiate a database connection, check your environment and script constants.\n' . $e);
    die(PHP_EXIT_ERROR_INIT);
  }

  // At that point the databases are good.
  echo_info('<init> Initiated database connection !');

  // We're gonna check for variants first

  echo_title('<start_transaction> [Delete Downstream] on [variants]');
  // TODO
  echo_info('<end_transaction>');

  echo_title('<start_transaction> [Upstream->Downstream] on [variants]');
  // TODO
  echo_info('<end_transaction>');

  // Fetch categories from Upstream + local
  echo_info('<prepare> Fetching local categories...');
  $local_categories_names = array_values($Roaster_DB_connection->categories_select_names());

  echo_info('<prepare> Fetching upstream categories...');
  $upstream_categories_names = array_values($Prestashop_DB_connection->categories_select_names());

  echo_title('<start_transaction> [Upstream->Downstream] on [categories]');

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

  echo_info('<end_transaction>');
  echo_title('<start_transaction> [Delete Downstream] on [categories]');

  $yes_all = user_prompt('Would you like to say \'Yes\' to all ?');

  // See if we locally have a category that doesn't exist upstream
  foreach ($Roaster_DB_connection->categories_select_all() as $local_categories_line)
  {
    if ( ! in_array($local_categories_line['nom'], $upstream_categories_names))
    {
      $answer = $yes_all ? true : user_prompt('The category ' . $local_categories_line['nom'] . ' is not in distant database, do you want to delete it ?');

      if ($answer)
      {
        $Roaster_DB_connection->categories_delete_by_ID($local_categories_line['id_categorie']);
        echo_info('Local category \'' . $local_categories_line['nom'] . '\'has been removed.');
      }
      else
      {
        echo_info('Skipping...');
      }
    }
  }

  echo_info('<end_transaction>');  

}

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
  exit(PHP_EXIT_OK);
}
