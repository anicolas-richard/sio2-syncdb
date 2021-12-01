<?php

function echo_title(string $title) : void
{
  echo "\033[35m=== " . $title . " ===\033[39m" . PHP_EOL;
}

function echo_error(string $error) : void
{
  echo "\033[31m(!) Error" . PHP_EOL;
  echo '    Description - ' . $error . "\033[39m" . PHP_EOL;
}

function echo_info(string $info) : void
{
  echo "\033[36m** " . $info . "\033[39m" . PHP_EOL;
}

function user_prompt(string $message) : bool
{
  /**
   * Prompts for user action, returns true/false
   */
  
  echo '<Prompt> ';
  echo $message . PHP_EOL;
  $answer = readline('Y/y for yes, any other key for no) >>> ');

  if (strtolower($answer) === 'y')
  {
    return true;
  }

  return false;
}

function user_input(string $message) : string
{
  /**
   * Prompts for user-returned string
   */

  echo '<Prompt> ';
  echo $message . PHP_EOL;
  return readline('Enter a message >>> ');
}
