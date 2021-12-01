<?php

/**
 * Script-wide exit codes for easier integration with other wrappers
 */

/** Script completed without errors. */
const PHP_EXIT_OK                = 0;

/** User cancelled the script execution. */
const PHP_EXIT_USER_CANCEL       = 1;

/** Generic error exit code. */
const PHP_EXIT_ERROR_GENERIC     = 2;

/** Script failed initialization. */
const PHP_EXIT_ERROR_INIT        = 3;

/** A SQL transation has failed. */
const PHP_EXIT_ERROR_TRANSACTION = 4;
