#!/usr/bin/php
<?php

/* **************************************************************************************** *
 * sync.php : A handy, self-contained, interactive PHP script that can synchronize          *
 * between a Prestashop database and a local custom one.                                    *
 * ---------------------------------------------------------------------------------------- *
 * This software is licensed under the GNU GPLv3, for more information,                     *
 * consult the included "COPYING" file.                                                     *
 * **************************************************************************************** */

// IMPORTS
require_once 'model/model_prestashop.php';
require_once 'model/model_roaster.php';

// CONSTANTS & GLOBALS
const MYSQL_USERNAME = 'root';
const MYSQL_PASSWORD = 'root';
const ROASTER_DB_NAME = 'pg_torrefacteur';
const PRESTASHOP_DB_NAME = 'pg_prestashop';

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

function user_prompt(string $message)
{
  /**
   * Prompts for user action, returns true/false
   */
  
  echo '-- Prompt --';
  echo '-  ' . $message . PHP_EOL;
  $answer = readline('Y/y for yes, any other key for no) >>> ');

  if (strtolower($answer) === 'y')
  {
    return true;
  }

  return false;
}

function main() : void
{
  // Entry point
  echo_title('Running pre-transaction checks');

  // We're gonna check if we have a valid connection between the two databases
  try
  {
    $Prestashop_DB_connection = new Model_Prestashop(MYSQL_USERNAME, MYSQL_PASSWORD, PRESTASHOP_DB_NAME);
    $Roaster_DB_connection = new Model_Roaster(MYSQL_USERNAME, MYSQL_PASSWORD, ROASTER_DB_NAME);
  }
  catch (Exception $e)
  {
    echo_error('Unable to initiate a database connection, check your environment and script constants.\n' . $e);
    die(1);
  }

  // At that point the databases are good.
  echo 'Initiated database connection !' . PHP_EOL;

  // We're gonna check for categories first
  

  // Fetch categories from Upstream

  $local_categories = array_values($Roaster_DB_connection->categories_select_names());
  var_dump($local_categories);

  foreach ($Prestashop_DB_connection->categories_select_all() as $ps_category_line)
  {
    if ( ! in_array($ps_category_line['name'], $local_categories))
    {
      $answer = user_prompt('The category ' . $ps_category_line['name'] . ' is not in local database, would you like to add it ?');

      if ($answer)
      {
        $Roaster_DB_connection->categories_add($ps_category_line['name']);
      }
    }
  }

  // See if we locally have a category that doesn't exist upstream
  // TODO
}

main();
