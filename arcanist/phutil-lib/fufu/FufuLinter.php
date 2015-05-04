<?php

final class FufuLinter extends ArcanistLintEngine
{
  public function buildLinters()
  {
    $linters = array();

    $paths = $this->getPaths();

    foreach ($paths as $key => $path) {
      if (!$this->pathExists($path)) {
        unset($paths[$key]);
      }
      if (preg_match('@Vendors/@', $path)) {
        unset($paths[$key]);
      }

      // Exclude arcanist linter files
      if (preg_match('@^arcanist/@', $path)) {
        unset($paths[$key]);
      }
    }

    $generated_linter = new ArcanistGeneratedLinter();
    $linters[] = $generated_linter;

    $nolint_linter = new ArcanistNoLintLinter();
    $linters[] = $nolint_linter;

    //$text_linter = new ArcanistTextLinter();
    // Use linter without the charset check
    $text_linter = new FufuTextLinter();
    $text_linter->setMaxLineLength(150);
    $linters[] = $text_linter;
    foreach ($paths as $path) {
      $is_text = false;
      if (preg_match('/\.(h|m)$/', $path)) {
        $is_text = true;
      }
      if ($is_text) {
        $generated_linter->addPath($path);
        $generated_linter->addData($path, $this->loadData($path));

        $nolint_linter->addPath($path);
        $nolint_linter->addData($path, $this->loadData($path));

        $text_linter->addPath($path);
        $text_linter->addData($path, $this->loadData($path));
      }
    }

    /*$name_linter = new ArcanistFilenameLinter();
    $linters[] = $name_linter;
    foreach ($paths as $path) {
      $name_linter->addPath($path);
    }*/

    return $linters;
  }
}

